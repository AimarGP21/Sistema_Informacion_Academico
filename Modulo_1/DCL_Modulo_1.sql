-- ============================================================================
-- SISTEMA DE INFORMACIÓN ACADÉMICA (SIA) - ARQUITECTURA DE SEGURIDAD EN SGBD
-- MÓDULO 1: AUTENTICACIÓN Y CONTROL DE ACCESO BASADO EN ROLES (RBAC)
-- SUBLENGUAJE: DCL (Data Control Language) - PostgreSQL
-- ENFOQUE: Principio de Mínimo Privilegio (Least Privilege / Security by Design)
-- ============================================================================
-- ORDEN DE EJECUCIÓN RECOMENDADO EN EL PIPELINE DE BASE DE DATOS:
--   1. Modulo_1_RBAC.sql              (DDL - Estructura de tablas y restricciones)
--   2. DML_Modulo_1.sql               (DML - Poblado inicial y semilla de datos)
--   3. Vistas_Analiticas_Modulo_1.sql (DDL/Views - Capa de abstracción de KPIs)
--   4. DCL_Modulo_1.sql               (DCL - Endurecimiento de permisos y roles)
-- ============================================================================

-- ============================================================================
-- SECCIÓN 1: CREACIÓN IDEMPOTENTE DE ROLES DE CONEXIÓN AL MOTOR POSTGRESQL
-- ============================================================================
-- Se utiliza un bloque anónimo PL/pgSQL para garantizar que el script pueda
-- ejecutarse múltiples veces en entornos locales, de pruebas o integración
-- continua sin arrojar errores de duplicidad de roles.
DO $$
BEGIN
    -- 1.1 Rol Operativo del Backend / API de Autenticación
    -- Diseñado exclusivamente para que la capa de aplicación gestione sesiones,
    -- altas de cuentas y asignación de roles sin privilegios de superusuario.
    IF NOT EXISTS (SELECT 1 FROM pg_catalog.pg_roles WHERE rolname = 'rol_app_backend') THEN
        CREATE ROLE rol_app_backend WITH
            LOGIN
            PASSWORD 'SIA_AppBackend_#2026!Sec'
            NOSUPERUSER
            NOCREATEDB
            NOCREATEROLE
            NOINHERIT
            CONNECTION LIMIT 50;
        RAISE NOTICE 'Rol [rol_app_backend] creado exitosamente.';
    ELSE
        RAISE NOTICE 'Rol [rol_app_backend] ya existe. Se conserva configuración base.';
    END IF;

    -- 1.2 Rol de Auditoría, Analítica y Business Intelligence (BI)
    -- Diseñado para herramientas de visualización (Power BI, Metabase, Tableau)
    -- y auditores institucionales con acceso estricto de solo lectura a métricas.
    IF NOT EXISTS (SELECT 1 FROM pg_catalog.pg_roles WHERE rolname = 'rol_auditor_analitica') THEN
        CREATE ROLE rol_auditor_analitica WITH
            LOGIN
            PASSWORD 'SIA_AuditorBI_#2026!Read'
            NOSUPERUSER
            NOCREATEDB
            NOCREATEROLE
            NOINHERIT
            CONNECTION LIMIT 15;
        RAISE NOTICE 'Rol [rol_auditor_analitica] creado exitosamente.';
    ELSE
        RAISE NOTICE 'Rol [rol_auditor_analitica] ya existe. Se conserva configuración base.';
    END IF;
END
$$;

-- ============================================================================
-- SECCIÓN 2: SANEAMIENTO INICIAL Y REVOCACIÓN PREVENTIVA (DEFENSE IN DEPTH)
-- ============================================================================
-- En PostgreSQL, el grupo implícito PUBLIC puede otorgar privilegios heredados.
-- Limpiamos primero los privilegios sobre los objetos del Módulo 1 para partir
-- de un estado "Zero Trust" antes de conceder permisos granulares.
REVOKE ALL PRIVILEGES ON TABLE
    usuarios,
    roles,
    permisos,
    roles_permisos,
    usuarios_roles
FROM PUBLIC, rol_app_backend, rol_auditor_analitica;

REVOKE ALL PRIVILEGES ON TABLE
    vw_kpi_usuarios_por_rol_estatus,
    vw_kpi_cobertura_permisos_modulo
FROM PUBLIC, rol_app_backend, rol_auditor_analitica;

-- Conceder permiso básico de resolución de objetos sobre el esquema público
GRANT USAGE ON SCHEMA public TO rol_app_backend, rol_auditor_analitica;

-- ============================================================================
-- SECCIÓN 3: PRIVILEGIOS OPERATIVOS PARA EL BACKEND (rol_app_backend)
-- ============================================================================
-- 3.1 Tablas Transaccionales de Identidad (usuarios y usuarios_roles)
-- La aplicación necesita consultar credenciales, registrar nuevos usuarios,
-- actualizar contraseñas/estatus y administrar las asignaciones usuario-rol.
GRANT SELECT, INSERT, UPDATE ON TABLE usuarios TO rol_app_backend;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE usuarios_roles TO rol_app_backend;

-- 3.2 Tablas de Catálogo de Seguridad (roles, permisos, roles_permisos)
-- En operación ordinaria, la API únicamente consulta la matriz RBAC para
-- validar tokens JWT o middlewares de autorización; no debe alterar ni borrar
-- la estructura de permisos definida por arquitectura.
GRANT SELECT ON TABLE roles, permisos, roles_permisos TO rol_app_backend;

-- 3.3 Permisos sobre Secuencias (SERIAL / Autoincrementales)
-- Indispensables para que las operaciones INSERT ejecutadas por rol_app_backend
-- puedan invocar nextval() y currval() sin error de permisos.
GRANT USAGE, SELECT ON SEQUENCE
    usuarios_id_usuario_seq,
    roles_id_rol_seq,
    permisos_id_permiso_seq
TO rol_app_backend;

-- 3.4 Restricción de Seguridad Crítica: Prohibición de Borrado Físico
-- Se revoca explícitamente el privilegio DELETE sobre la tabla 'usuarios' para
-- obligar a la capa de aplicación a emplear un esquema de Borrado Lógico
-- (UPDATE usuarios SET estatus = 'inactivo' o 'bloqueado'), preservando la
-- trazabilidad histórica y forense de todas las identidades del SIA.
REVOKE DELETE ON TABLE usuarios FROM rol_app_backend;

-- ============================================================================
-- SECCIÓN 4: PRIVILEGIOS DE AUDITORÍA Y BI (rol_auditor_analitica)
-- ============================================================================
-- 4.1 Acceso Exclusivo a la Capa de Vistas Analíticas (KPIs)
-- El auditor o analista de datos obtiene visibilidad estadística completa sobre
-- el estado de cuentas y cobertura de permisos por módulo.
GRANT SELECT ON TABLE
    vw_kpi_usuarios_por_rol_estatus,
    vw_kpi_cobertura_permisos_modulo
TO rol_auditor_analitica;

-- 4.2 Acceso de Lectura a Catálogos Institucionales No Sensibles
-- Permite cruzar descripciones de roles y nombres de módulos en reportes.
GRANT SELECT ON TABLE
    roles,
    permisos,
    roles_permisos
TO rol_auditor_analitica;

-- 4.3 Protección Estricta de Datos Sensibles (PII y Credenciales Criptográficas)
-- Se garantiza mediante revocación explícita que el rol de analítica JAMÁS pueda
-- consultar directamente la tabla 'usuarios' (protegiendo 'password_hash' y 'email').
REVOKE ALL PRIVILEGES ON TABLE usuarios, usuarios_roles FROM rol_auditor_analitica;

-- Permiso opcional de lectura a nivel de columnas no sensibles (Descomentar solo
-- si auditoría requiere inspeccionar el mapeo usuario-rol sin ver password_hash):
-- GRANT SELECT (id_usuario, username, estatus) ON TABLE usuarios TO rol_auditor_analitica;

-- ============================================================================
-- SECCIÓN 5: DOCUMENTACIÓN EN EL CATÁLOGO DEL MOTOR (METADATOS PG_DESCRIPTION)
-- ============================================================================
COMMENT ON ROLE rol_app_backend IS
    'Rol operativo del SIA con privilegios mínimos (SELECT/INSERT/UPDATE en usuarios, sin DELETE físico) para el Módulo 1 RBAC.';

COMMENT ON ROLE rol_auditor_analitica IS
    'Rol de solo lectura para Inteligencia de Negocios y Auditoría con acceso restringido a vistas analíticas vw_kpi_* y catálogos no sensibles.';

-- ============================================================================
-- SECCIÓN 6: CONSULTA DE VERIFICACIÓN DE AUDITORÍA DE PRIVILEGIOS
-- ============================================================================
-- Ejecuta esta consulta al finalizar para comprobar la matriz DCL aplicada:
SELECT
    grantee AS rol_motor,
    table_name AS objeto_bd,
    STRING_AGG(privilege_type, ', ' ORDER BY privilege_type) AS privilegios_otorgados
FROM information_schema.role_table_grants
WHERE grantee IN ('rol_app_backend', 'rol_auditor_analitica')
GROUP BY grantee, table_name
ORDER BY grantee ASC, table_name ASC;

