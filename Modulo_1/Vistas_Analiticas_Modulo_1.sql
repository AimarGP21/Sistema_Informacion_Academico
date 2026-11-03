-- ============================================================================
-- VISTAS ANALÍTICAS SQL PARA EL MÓDULO 1: AUTENTICACIÓN Y RBAC (PostgreSQL)
-- ============================================================================

-- 1. Vista Analítica: vw_kpi_usuarios_por_rol_estatus
-- Calcula el total de usuarios asignados, desglose por estatus ('activo', 'inactivo', 'bloqueado')
-- y el porcentaje de cuentas activas agrupado por cada rol institucional.
CREATE OR REPLACE VIEW vw_kpi_usuarios_por_rol_estatus AS
SELECT
    r.id_rol,
    r.nombre_rol,
    r.descripcion AS descripcion_rol,
    COUNT(u.id_usuario) AS total_usuarios_asignados,
    COUNT(u.id_usuario) FILTER (WHERE u.estatus = 'activo') AS usuarios_activos,
    COUNT(u.id_usuario) FILTER (WHERE u.estatus = 'inactivo') AS usuarios_inactivos,
    COUNT(u.id_usuario) FILTER (WHERE u.estatus = 'bloqueado') AS usuarios_bloqueados,
    ROUND(
        CASE
            WHEN COUNT(u.id_usuario) = 0 THEN 0.00
            ELSE (COUNT(u.id_usuario) FILTER (WHERE u.estatus = 'activo')::NUMERIC * 100.0) / COUNT(u.id_usuario)
        END,
        2
    ) AS porcentaje_cuentas_activas
FROM roles r
LEFT JOIN usuarios_roles ur
    ON r.id_rol = ur.id_rol
LEFT JOIN usuarios u
    ON ur.id_usuario = u.id_usuario
GROUP BY
    r.id_rol,
    r.nombre_rol,
    r.descripcion
ORDER BY
    total_usuarios_asignados DESC,
    r.nombre_rol ASC;

-- 2. Vista Analítica: vw_kpi_cobertura_permisos_modulo
-- Calcula la cantidad de permisos asignados y la cantidad de usuarios únicos (y activos) impactados
-- agrupados por el módulo del sistema (permisos.modulo) y el rol (roles.nombre_rol).
CREATE OR REPLACE VIEW vw_kpi_cobertura_permisos_modulo AS
SELECT
    p.modulo AS modulo_sistema,
    r.id_rol,
    r.nombre_rol,
    COUNT(DISTINCT p.id_permiso) AS cantidad_permisos_asignados,
    COUNT(DISTINCT ur.id_usuario) AS cantidad_usuarios_impactados,
    COUNT(DISTINCT u.id_usuario) FILTER (WHERE u.estatus = 'activo') AS usuarios_activos_con_acceso,
    STRING_AGG(DISTINCT p.nombre_permiso, ', ' ORDER BY p.nombre_permiso) AS catalogo_permisos_otorgados
FROM permisos p
INNER JOIN roles_permisos rp
    ON p.id_permiso = rp.id_permiso
INNER JOIN roles r
    ON rp.id_rol = r.id_rol
LEFT JOIN usuarios_roles ur
    ON r.id_rol = ur.id_rol
LEFT JOIN usuarios u
    ON ur.id_usuario = u.id_usuario
GROUP BY
    p.modulo,
    r.id_rol,
    r.nombre_rol
ORDER BY
    p.modulo ASC,
    cantidad_permisos_asignados DESC,
    r.nombre_rol ASC;

