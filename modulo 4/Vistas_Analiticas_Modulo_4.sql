-- 1. Matrícula, estatus y rendimiento por programa académico
CREATE OR REPLACE VIEW vw_kpi_estudiantes_por_programa AS
SELECT
    pa.id_programa,
    pa.nombre AS programa,
    pa.nivel,
    d.nombre AS departamento,
    COUNT(e.id_estudiante) AS total_estudiantes,
    COUNT(e.id_estudiante) FILTER (WHERE e.estatus_escolar = 'activo')   AS activos,
    COUNT(e.id_estudiante) FILTER (WHERE e.estatus_escolar = 'egresado') AS egresados,
    COUNT(e.id_estudiante) FILTER (WHERE e.estatus_escolar IN ('baja_temporal', 'baja_definitiva')) AS bajas,
    ROUND(AVG(x.promedio) FILTER (WHERE x.creditos_cursados > 0), 2) AS promedio_general,
    ROUND(AVG(x.creditos_cursados), 1) AS creditos_promedio,
    RANK() OVER (
        ORDER BY AVG(x.promedio) FILTER (WHERE x.creditos_cursados > 0) DESC NULLS LAST
    ) AS ranking_promedio
FROM programas_academicos pa
INNER JOIN departamentos d ON pa.id_departamento = d.id_departamento
INNER JOIN estudiantes e ON pa.id_programa = e.id_programa
INNER JOIN expedientes_academicos x ON e.id_estudiante = x.id_estudiante
GROUP BY pa.id_programa, pa.nombre, pa.nivel, d.nombre
ORDER BY total_estudiantes DESC, pa.nombre ASC;

-- 2. Retención y deserción por cohorte de ingreso
CREATE OR REPLACE VIEW vw_kpi_retencion_por_cohorte AS
SELECT
    c.id_cohorte,
    c.nombre_cohorte,
    c.anio_ingreso,
    COUNT(e.id_estudiante) AS inscritos,
    COUNT(e.id_estudiante) FILTER (WHERE e.estatus_escolar = 'activo')          AS activos,
    COUNT(e.id_estudiante) FILTER (WHERE e.estatus_escolar = 'egresado')        AS egresados,
    COUNT(e.id_estudiante) FILTER (WHERE e.estatus_escolar = 'baja_temporal')   AS bajas_temporales,
    COUNT(e.id_estudiante) FILTER (WHERE e.estatus_escolar = 'baja_definitiva') AS bajas_definitivas,
    ROUND(
        COUNT(e.id_estudiante) FILTER (WHERE e.estatus_escolar IN ('activo', 'egresado'))::NUMERIC * 100.0
        / NULLIF(COUNT(e.id_estudiante), 0),
        2
    ) AS tasa_retencion,
    ROUND(
        COUNT(e.id_estudiante) FILTER (WHERE e.estatus_escolar = 'baja_definitiva')::NUMERIC * 100.0
        / NULLIF(COUNT(e.id_estudiante), 0),
        2
    ) AS tasa_desercion,
    ROUND(AVG(x.promedio) FILTER (WHERE x.creditos_cursados > 0), 2) AS promedio_general
FROM cohortes c
LEFT JOIN estudiantes e ON c.id_cohorte = e.id_cohorte
LEFT JOIN expedientes_academicos x ON e.id_estudiante = x.id_estudiante
GROUP BY c.id_cohorte, c.nombre_cohorte, c.anio_ingreso
ORDER BY c.anio_ingreso, c.nombre_cohorte;

-- 3. Resumen por tipo de beca: asignaciones, beneficiarios, vigentes y promedio de los becados
CREATE OR REPLACE VIEW vw_kpi_becas_resumen AS
WITH promedio_por_beca AS (
    SELECT bn.nombre_beca, AVG(x.promedio) AS promedio
    FROM (SELECT DISTINCT nombre_beca, id_estudiante FROM becas_asignadas) bn
    INNER JOIN expedientes_academicos x ON bn.id_estudiante = x.id_estudiante
    WHERE x.creditos_cursados > 0
    GROUP BY bn.nombre_beca
)
SELECT
    b.nombre_beca,
    COUNT(b.id_beca) AS asignaciones,
    COUNT(DISTINCT b.id_estudiante) AS estudiantes_beneficiados,
    ROUND(AVG(b.porcentaje), 2) AS porcentaje_promedio,
    COUNT(b.id_beca) FILTER (WHERE b.fecha_fin IS NULL) AS vigentes,
    MIN(b.fecha_inicio) AS primera_asignacion,
    MAX(b.fecha_inicio) AS ultima_asignacion,
    ROUND(MAX(pb.promedio), 2) AS promedio_beneficiarios
FROM becas_asignadas b
LEFT JOIN promedio_por_beca pb ON b.nombre_beca = pb.nombre_beca
GROUP BY b.nombre_beca
ORDER BY asignaciones DESC, b.nombre_beca ASC;

-- 4. Directorio de estudiantes con su cuenta, programa, cohorte, expediente y becas
CREATE OR REPLACE VIEW vw_directorio_estudiantes AS
SELECT
    e.id_estudiante,
    e.matricula,
    e.nombre || ' ' || e.apellido AS estudiante,
    e.estatus_escolar,
    u.username,
    u.estatus AS estatus_cuenta,
    pa.nombre AS programa,
    pa.nivel,
    d.nombre AS departamento,
    co.nombre_cohorte,
    x.creditos_cursados,
    x.promedio,
    COUNT(b.id_beca) AS total_becas,
    COUNT(b.id_beca) FILTER (WHERE b.fecha_fin IS NULL) AS becas_vigentes
FROM estudiantes e
INNER JOIN usuarios u ON e.id_usuario = u.id_usuario
INNER JOIN programas_academicos pa ON e.id_programa = pa.id_programa
INNER JOIN departamentos d ON pa.id_departamento = d.id_departamento
INNER JOIN cohortes co ON e.id_cohorte = co.id_cohorte
INNER JOIN expedientes_academicos x ON e.id_estudiante = x.id_estudiante
LEFT JOIN becas_asignadas b ON e.id_estudiante = b.id_estudiante
GROUP BY
    e.id_estudiante, e.matricula, e.nombre, e.apellido, e.estatus_escolar,
    u.username, u.estatus, pa.nombre, pa.nivel, d.nombre, co.nombre_cohorte,
    x.creditos_cursados, x.promedio
ORDER BY e.id_estudiante;
