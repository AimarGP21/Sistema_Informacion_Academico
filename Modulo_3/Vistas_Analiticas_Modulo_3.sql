-- ============================================================================
-- SISTEMA DE INFORMACIÓN ACADÉMICA (SIA) - CUCEI / UDG
-- MÓDULO 3: PERSONAL DOCENTE E INVESTIGADORES
-- VISTAS ANALÍTICAS (VIEWS) PARA REPORTEOS Y CUADROS DE MANDO (BI)
-- ============================================================================
-- Sprint 3: Al menos 3 vistas con JOINs complejos, funciones de agregación
-- y métricas operativas / estratégicas institucionales.
-- ============================================================================

-- ============================================================================
-- 1. VISTA: vw_kpi_profesores_por_departamento_categoria
-- Propósito: Monitoreo de la distribución de la plantilla docente por departamento,
-- categoría académica y estado de actividad de sus cuentas de usuario (RBAC).
-- ============================================================================
CREATE OR REPLACE VIEW vw_kpi_profesores_por_departamento_categoria AS
SELECT
    d.id_departamento,
    d.nombre AS nombre_departamento,
    p.categoria AS categoria_docente,
    COUNT(p.id_profesor) AS total_profesores,
    COUNT(p.id_profesor) FILTER (WHERE u.estatus = 'activo') AS profesores_activos_sistema,
    COUNT(p.id_profesor) FILTER (WHERE u.estatus IN ('inactivo', 'bloqueado')) AS profesores_inactivos_bloqueados,
    ROUND(
        CASE
            WHEN COUNT(p.id_profesor) = 0 THEN 0.00
            ELSE (COUNT(p.id_profesor) FILTER (WHERE u.estatus = 'activo')::NUMERIC * 100.0) / COUNT(p.id_profesor)
        END,
        2
    ) AS porcentaje_actividad_digital,
    STRING_AGG(p.numero_empleado, ', ' ORDER BY p.numero_empleado) AS nomina_profesores
FROM departamentos d
INNER JOIN profesores p
    ON d.id_departamento = p.id_departamento
LEFT JOIN usuarios u
    ON p.id_usuario = u.id_usuario
GROUP BY
    d.id_departamento,
    d.nombre,
    p.categoria
ORDER BY
    d.nombre ASC,
    total_profesores DESC,
    p.categoria ASC;

-- ============================================================================
-- 2. VISTA: vw_kpi_cobertura_lineas_investigacion
-- Propósito: Evaluar el impacto, cobertura y multidisciplinariedad de cada LGAC
-- analizando cuántos profesores están adscritos y de cuántos departamentos provienen.
-- ============================================================================
CREATE OR REPLACE VIEW vw_kpi_cobertura_lineas_investigacion AS
SELECT
    li.id_linea,
    li.nombre_linea,
    li.descripcion AS alcance_lgac,
    COUNT(DISTINCT pl.id_profesor) AS total_investigadores_adscritos,
    COUNT(DISTINCT p.id_departamento) AS departamentos_participantes,
    COUNT(DISTINCT pl.id_profesor) FILTER (WHERE p.categoria LIKE '%Titular%') AS investigadores_titulares,
    COUNT(DISTINCT pl.id_profesor) FILTER (WHERE p.categoria LIKE '%Asociado%' OR p.categoria LIKE '%Asignatura%') AS investigadores_asociados_asignatura,
    STRING_AGG(DISTINCT d.nombre, ' | ' ORDER BY d.nombre) AS departamentos_involucrados
FROM lineas_investigacion li
LEFT JOIN profesores_linea pl
    ON li.id_linea = pl.id_linea
LEFT JOIN profesores p
    ON pl.id_profesor = p.id_profesor
LEFT JOIN departamentos d
    ON p.id_departamento = d.id_departamento
GROUP BY
    li.id_linea,
    li.nombre_linea,
    li.descripcion
ORDER BY
    total_investigadores_adscritos DESC,
    departamentos_participantes DESC,
    li.nombre_linea ASC;

-- ============================================================================
-- 3. VISTA: vw_kpi_cuerpos_academicos_madurez
-- Propósito: Diagnóstico institucional del nivel de consolidación PRODEP de los
-- cuerpos académicos registrados en CUCEI, calculando tasas de madurez investigadora.
-- ============================================================================
CREATE OR REPLACE VIEW vw_kpi_cuerpos_academicos_madurez AS
WITH total_ca AS (
    SELECT COUNT(*)::NUMERIC AS gran_total FROM cuerpos_academicos
)
SELECT
    ca.grado_consolidacion,
    COUNT(ca.id_cuerpo_academico) AS cantidad_cuerpos,
    ROUND(
        (COUNT(ca.id_cuerpo_academico)::NUMERIC * 100.0) / NULLIF(MAX(t.gran_total), 0),
        2
    ) AS porcentaje_distribucion,
    STRING_AGG(ca.nombre_cuerpo, ' || ' ORDER BY ca.nombre_cuerpo) AS cuerpos_registrados
FROM cuerpos_academicos ca
CROSS JOIN total_ca t
GROUP BY
    ca.grado_consolidacion
ORDER BY
    CASE ca.grado_consolidacion
        WHEN 'Consolidado' THEN 1
        WHEN 'En Consolidación' THEN 2
        WHEN 'En Formación' THEN 3
        ELSE 4
    END ASC;
