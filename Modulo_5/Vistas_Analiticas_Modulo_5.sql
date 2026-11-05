-- Vistas Analíticas y KPIs del Módulo 5: Oferta Curricular

-- 1. Resumen de ocupación y cupos por grupo y ciclo escolar
CREATE OR REPLACE VIEW vw_kpi_ocupacion_grupos AS
SELECT 
    ce.nombre_ciclo,
    m.clave_materia,
    m.nombre AS materia,
    p.numero_empleado AS codigo_profesor,
    gc.clave_grupo,
    gc.aula,
    gc.cupo_maximo,
    COUNT(im.id_estudiante) AS total_inscritos,
    (gc.cupo_maximo - COUNT(im.id_estudiante)) AS lugares_disponibles,
    ROUND(
        (COUNT(im.id_estudiante)::NUMERIC * 100.0 / NULLIF(gc.cupo_maximo, 0)), 2
    ) AS porcentaje_ocupacion,
    CASE 
        WHEN COUNT(im.id_estudiante) >= gc.cupo_maximo THEN 'Lleno'
        WHEN COUNT(im.id_estudiante)::NUMERIC / gc.cupo_maximo >= 0.8 THEN 'Alta Demanda'
        ELSE 'Cupo Disponible'
    END AS estado_grupo
FROM grupos_clase gc
INNER JOIN ciclos_escolares ce ON gc.id_ciclo = ce.id_ciclo
INNER JOIN materias m ON gc.id_materia = m.id_materia
INNER JOIN profesores p ON gc.id_profesor = p.id_profesor
LEFT JOIN inscripciones_materias im ON gc.id_grupo = im.id_grupo
GROUP BY ce.id_ciclo, ce.nombre_ciclo, m.clave_materia, m.nombre, p.numero_empleado, gc.id_grupo, gc.clave_grupo, gc.aula, gc.cupo_maximo
ORDER BY ce.nombre_ciclo DESC, m.clave_materia ASC;

-- 2. Tasa de aprobación y deserción por asignatura
CREATE OR REPLACE VIEW vw_kpi_rendimiento_materias AS
SELECT 
    m.id_materia,
    m.clave_materia,
    m.nombre AS materia,
    pa.nombre AS programa_academico,
    COUNT(im.id_estudiante) AS total_cursados,
    COUNT(im.id_estudiante) FILTER (WHERE im.estatus = 'acreditado') AS acreditados,
    COUNT(im.id_estudiante) FILTER (WHERE im.estatus = 'no_acreditado') AS no_acreditados,
    COUNT(im.id_estudiante) FILTER (WHERE im.estatus = 'baja_voluntaria') AS bajas_voluntarias,
    ROUND(
        COUNT(im.id_estudiante) FILTER (WHERE im.estatus = 'acreditado')::NUMERIC * 100.0 / NULLIF(COUNT(im.id_estudiante) FILTER (WHERE im.estatus IN ('acreditado', 'no_acreditado')), 0),
        2
    ) AS tasa_aprobacion,
    ROUND(
        COUNT(im.id_estudiante) FILTER (WHERE im.estatus = 'baja_voluntaria')::NUMERIC * 100.0 / NULLIF(COUNT(im.id_estudiante), 0),
        2
    ) AS tasa_baja
FROM materias m
INNER JOIN programas_academicos pa ON m.id_programa = pa.id_programa
LEFT JOIN grupos_clase gc ON m.id_materia = gc.id_materia
LEFT JOIN inscripciones_materias im ON gc.id_grupo = im.id_grupo
GROUP BY m.id_materia, m.clave_materia, m.nombre, pa.nombre
ORDER BY total_cursados DESC;

-- 3. Carga docente por ciclo escolar
CREATE OR REPLACE VIEW vw_kpi_carga_docente AS
SELECT 
    ce.nombre_ciclo,
    p.id_profesor,
    p.numero_empleado,
    p.categoria,
    d.nombre AS departamento,
    COUNT(DISTINCT gc.id_grupo) AS total_grupos,
    COUNT(DISTINCT gc.id_materia) AS materias_distintas,
    SUM(m.horas_teoria + m.horas_practica) AS horas_totales_semanales,
    COUNT(im.id_estudiante) AS total_alumnos_atendidos
FROM profesores p
INNER JOIN departamentos d ON p.id_departamento = d.id_departamento
INNER JOIN grupos_clase gc ON p.id_profesor = gc.id_profesor
INNER JOIN ciclos_escolares ce ON gc.id_ciclo = ce.id_ciclo
INNER JOIN materias m ON gc.id_materia = m.id_materia
LEFT JOIN inscripciones_materias im ON gc.id_grupo = im.id_grupo
GROUP BY ce.id_ciclo, ce.nombre_ciclo, p.id_profesor, p.numero_empleado, p.categoria, d.nombre
ORDER BY ce.nombre_ciclo DESC, total_alumnos_atendidos DESC;

-- 4. Mapa de prerrequisitos
CREATE OR REPLACE VIEW vw_mapa_prerrequisitos AS
SELECT 
    m.clave_materia AS materia_origen_clave,
    m.nombre AS materia_origen,
    p.tipo_prerrequisito,
    pre.clave_materia AS materia_prerrequisito_clave,
    pre.nombre AS materia_prerrequisito
FROM prerrequisitos p
INNER JOIN materias m ON p.id_materia = m.id_materia
INNER JOIN materias pre ON p.id_materia_prerrequisito = pre.id_materia
ORDER BY m.clave_materia ASC;