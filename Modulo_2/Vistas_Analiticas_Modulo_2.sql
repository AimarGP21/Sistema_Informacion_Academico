-- 1. Directorio plano: campus -> facultad -> departamento -> programa
CREATE OR REPLACE VIEW vw_directorio_estructura_organizacional AS
SELECT
    c.id_campus,
    c.nombre  AS campus,
    c.ciudad,
    c.estado,
    f.id_facultad,
    f.nombre  AS facultad,
    d.id_departamento,
    d.nombre  AS departamento,
    pa.id_programa,
    pa.nombre AS programa_academico,
    pa.nivel
FROM campus c
INNER JOIN facultades f ON c.id_campus = f.id_campus
INNER JOIN departamentos d ON f.id_facultad = d.id_facultad
INNER JOIN programas_academicos pa ON d.id_departamento = pa.id_departamento
ORDER BY c.id_campus, f.id_facultad, d.id_departamento, pa.id_programa;

-- 2. Facultades, departamentos y programas por campus, con desglose por nivel
CREATE OR REPLACE VIEW vw_kpi_estructura_por_campus AS
SELECT
    c.id_campus,
    c.nombre AS campus,
    c.ciudad,
    COUNT(DISTINCT f.id_facultad)     AS total_facultades,
    COUNT(DISTINCT d.id_departamento) AS total_departamentos,
    COUNT(DISTINCT pa.id_programa)    AS total_programas,
    COUNT(DISTINCT pa.id_programa) FILTER (WHERE pa.nivel = 'Licenciatura') AS programas_licenciatura,
    COUNT(DISTINCT pa.id_programa) FILTER (WHERE pa.nivel = 'Maestria')     AS programas_maestria,
    COUNT(DISTINCT pa.id_programa) FILTER (WHERE pa.nivel = 'Doctorado')    AS programas_doctorado,
    ROUND(
        COUNT(DISTINCT pa.id_programa)::NUMERIC * 100.0
        / NULLIF(SUM(COUNT(DISTINCT pa.id_programa)) OVER (), 0),
        2
    ) AS porcentaje_oferta_institucional
FROM campus c
LEFT JOIN facultades f ON c.id_campus = f.id_campus
LEFT JOIN departamentos d ON f.id_facultad = d.id_facultad
LEFT JOIN programas_academicos pa ON d.id_departamento = pa.id_departamento
GROUP BY c.id_campus, c.nombre, c.ciudad
ORDER BY total_programas DESC, c.nombre ASC;

-- 3. Porcentaje de posgrado y cobertura académica por facultad
CREATE OR REPLACE VIEW vw_kpi_oferta_posgrado_por_facultad AS
SELECT
    f.id_facultad,
    f.nombre AS facultad,
    c.nombre AS campus,
    COUNT(pa.id_programa) AS total_programas,
    COUNT(pa.id_programa) FILTER (WHERE pa.nivel = 'Licenciatura') AS licenciaturas,
    COUNT(pa.id_programa) FILTER (WHERE pa.nivel = 'Maestria')     AS maestrias,
    COUNT(pa.id_programa) FILTER (WHERE pa.nivel = 'Doctorado')    AS doctorados,
    ROUND(
        COUNT(pa.id_programa) FILTER (WHERE pa.nivel IN ('Maestria', 'Doctorado'))::NUMERIC * 100.0
        / NULLIF(COUNT(pa.id_programa), 0),
        2
    ) AS porcentaje_posgrado,
    CASE
        WHEN COUNT(pa.id_programa) FILTER (WHERE pa.nivel = 'Licenciatura') > 0
         AND COUNT(pa.id_programa) FILTER (WHERE pa.nivel = 'Maestria') > 0
         AND COUNT(pa.id_programa) FILTER (WHERE pa.nivel = 'Doctorado') > 0
            THEN 'Ruta completa'
        WHEN COUNT(pa.id_programa) FILTER (WHERE pa.nivel IN ('Maestria', 'Doctorado')) > 0
            THEN 'Con posgrado'
        ELSE 'Solo licenciatura'
    END AS cobertura_academica
FROM facultades f
INNER JOIN campus c ON f.id_campus = c.id_campus
LEFT JOIN departamentos d ON f.id_facultad = d.id_facultad
LEFT JOIN programas_academicos pa ON d.id_departamento = pa.id_departamento
GROUP BY f.id_facultad, f.nombre, c.nombre
ORDER BY porcentaje_posgrado DESC NULLS LAST, total_programas DESC, f.nombre ASC;

-- 4. Ranking de departamentos por número de programas dentro de su campus
CREATE OR REPLACE VIEW vw_kpi_ranking_departamentos_por_programas AS
SELECT
    c.nombre AS campus,
    d.id_departamento,
    d.nombre AS departamento,
    f.nombre AS facultad,
    COUNT(pa.id_programa) AS total_programas,
    RANK() OVER (PARTITION BY c.id_campus ORDER BY COUNT(pa.id_programa) DESC) AS posicion_en_campus,
    STRING_AGG(pa.nombre, ' | ' ORDER BY pa.nombre) AS programas_ofertados
FROM departamentos d
INNER JOIN facultades f ON d.id_facultad = f.id_facultad
INNER JOIN campus c ON f.id_campus = c.id_campus
LEFT JOIN programas_academicos pa ON d.id_departamento = pa.id_departamento
GROUP BY c.id_campus, c.nombre, d.id_departamento, d.nombre, f.nombre
ORDER BY c.nombre ASC, posicion_en_campus ASC, d.nombre ASC;
