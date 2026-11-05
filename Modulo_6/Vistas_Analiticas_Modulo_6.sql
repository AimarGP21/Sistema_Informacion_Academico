-- Vistas Analíticas y KPIs del Módulo 6: Evaluaciones y Calificaciones

-- 1. Promedio final ponderado y porcentaje de aprobación por grupo de clase
CREATE OR REPLACE VIEW vw_kpi_promedios_grupo AS
WITH promedio_ponderado_estudiante AS (
    SELECT 
        ce.id_grupo,
        ce.id_estudiante,
        SUM(ce.calificacion * (ee.porcentaje / 100.0)) AS nota_final_grupo
    FROM calificaciones_evaluacion ce
    INNER JOIN esquemas_evaluacion ee ON ce.id_esquema = ee.id_esquema
    GROUP BY ce.id_grupo, ce.id_estudiante
)
SELECT 
    c.nombre_ciclo,
    m.clave_materia,
    m.nombre AS materia,
    gc.clave_grupo,
    p.numero_empleado AS codigo_profesor,
    COUNT(pve.id_estudiante) AS estudiantes_evaluados,
    ROUND(AVG(pve.nota_final_grupo), 2) AS promedio_grupo,
    COUNT(pve.id_estudiante) FILTER (WHERE pve.nota_final_grupo >= 60.0 OR pve.nota_final_grupo >= 6.0) AS aprobados,
    COUNT(pve.id_estudiante) FILTER (WHERE pve.nota_final_grupo < 60.0 AND pve.nota_final_grupo < 6.0) AS reprobados,
    ROUND(
        COUNT(pve.id_estudiante) FILTER (WHERE pve.nota_final_grupo >= 6.0)::NUMERIC * 100.0 / NULLIF(COUNT(pve.id_estudiante), 0),
        2
    ) AS tasa_aprobacion_porcentaje
FROM grupos_clase gc
INNER JOIN ciclos_escolares c ON gc.id_ciclo = c.id_ciclo
INNER JOIN materias m ON gc.id_materia = m.id_materia
INNER JOIN profesores p ON gc.id_profesor = p.id_profesor
LEFT JOIN promedio_ponderado_estudiante pve ON gc.id_grupo = pve.id_grupo
GROUP BY c.id_ciclo, c.nombre_ciclo, m.clave_materia, m.nombre, gc.clave_grupo, p.numero_empleado, gc.id_grupo
ORDER BY c.nombre_ciclo DESC, m.clave_materia ASC;

-- 2. Análisis del desempeño de los estudiantes agrupado por Tipo de Evaluación
CREATE OR REPLACE VIEW vw_kpi_desempeno_tipo_evaluacion AS
SELECT 
    te.nombre AS tipo_evaluacion,
    COUNT(ce.id_calificacion) AS total_calificaciones_registradas,
    ROUND(AVG(ce.calificacion), 2) AS promedio_general,
    ROUND(MIN(ce.calificacion), 2) AS calificacion_minima,
    ROUND(MAX(ce.calificacion), 2) AS calificacion_maxima,
    ROUND(STDDEV(ce.calificacion), 2) AS desviacion_estandar
FROM calificaciones_evaluacion ce
INNER JOIN esquemas_evaluacion ee ON ce.id_esquema = ee.id_esquema
INNER JOIN tipos_evaluacion te ON ee.id_tipo_evaluacion = te.id_tipo_evaluacion
GROUP BY te.id_tipo_evaluacion, te.nombre
ORDER BY promedio_general DESC;

-- 3. Evaluación del desempeño docente (promedio por rubros y puntaje global sobre 5)
CREATE OR REPLACE VIEW vw_kpi_evaluacion_docente AS
SELECT 
    p.id_profesor,
    p.numero_empleado,
    d.nombre AS departamento,
    COUNT(DISTINCT ed.id_evaluacion_docente) AS total_encuestas_recibidas,
    ROUND(AVG(ed.puntaje_dominio_materia), 2) AS promedio_dominio_materia,
    ROUND(AVG(ed.puntaje_pedagogia), 2) AS promedio_pedagogia,
    ROUND(AVG(ed.puntaje_puntualidad), 2) AS promedio_puntualidad,
    ROUND(
        (AVG(ed.puntaje_dominio_materia) + AVG(ed.puntaje_pedagogia) + AVG(ed.puntaje_puntualidad)) / 3.0,
        2
    ) AS calificacion_global_docente
FROM profesores p
INNER JOIN departamentos d ON p.id_departamento = d.id_departamento
INNER JOIN grupos_clase gc ON p.id_profesor = gc.id_profesor
LEFT JOIN evaluaciones_docentes ed ON gc.id_grupo = ed.id_grupo
GROUP BY p.id_profesor, p.numero_empleado, d.nombre
ORDER BY calificacion_global_docente DESC NULLS LAST;

-- 4. Estatus de entrega y cierre de actas de calificaciones por ciclo escolar
CREATE OR REPLACE VIEW vw_kpi_estatus_actas_ciclo AS
SELECT 
    c.nombre_ciclo,
    COUNT(ac.id_acta) AS total_actas,
    COUNT(ac.id_acta) FILTER (WHERE ac.estatus_acta = 'cerrada') AS actas_cerradas,
    COUNT(ac.id_acta) FILTER (WHERE ac.estatus_acta = 'borrador') AS actas_en_borrador,
    COUNT(ac.id_acta) FILTER (WHERE ac.estatus_acta = 'extemporanea') AS actas_extemporaneas,
    ROUND(
        COUNT(ac.id_acta) FILTER (WHERE ac.estatus_acta IN ('cerrada', 'extemporanea'))::NUMERIC * 100.0 / NULLIF(COUNT(ac.id_acta), 0),
        2
    ) AS porcentaje_cumplimiento_cierre
FROM actas_calificaciones ac
INNER JOIN grupos_clase gc ON ac.id_grupo = gc.id_grupo
INNER JOIN ciclos_escolares c ON gc.id_ciclo = c.id_ciclo
GROUP BY c.id_ciclo, c.nombre_ciclo
ORDER BY c.nombre_ciclo DESC;