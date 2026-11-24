-- ============================================================================
-- SISTEMA DE INFORMACIÓN ACADÉMICA (SIA) - CUCEI / UDG
-- SCRIPT MAESTRO DE INICIALIZACIÓN DE POSTGRESQL (SPRINT 4)
-- ============================================================================
-- Uso desde la raíz del repositorio en psql:
--   psql -U postgres -d sia_cucei_db -f database/init_postgres_master.sql
--
-- Orden topológico de ejecución:
--   Fase 1: DDL (Creación de las 27 tablas relacionales M1 a M6)
--   Fase 2: DML (Semillas de datos con hashes Bcrypt, UPDATEs y bloques ACID)
--   Fase 3: Vistas Analíticas (20 vistas vw_kpi_* para reportes e inteligencia)
--   Fase 4: Triggers PL/pgSQL (Reglas de negocio con RAISE EXCEPTION)
--   Fase 5: DCL (Endurecimiento de roles y permisos Zero Trust)
-- ============================================================================

\echo '======================================================================'
\echo ' [FASE 1/5] EJECUTANDO SCRIPTS DDL (MÓDULOS 1 AL 6)'
\echo '======================================================================'
\i Modulo_1/Modulo_1_RBAC.sql
\i Modulo_2/Modulo_2_Estructura.sql
\i Modulo_3/Modulo_3_Personal_Docente.sql
\i Modulo_4/Modulo_4_Alumnos_Matricula.sql
\i Modulo_5/DDL_Modulo_5_Oferta_Curricular.sql
\i Modulo_6/DDL_Modulo_6_Evaluaciones.sql

\echo '======================================================================'
\echo ' [FASE 2/5] CARGANDO DATOS SEMILLA DML (BCRYPT & INTEGRIDAD ACID)'
\echo '======================================================================'
\i Modulo_1/DML_Modulo_1.sql
\i Modulo_2/DML_Modulo_2.sql
\i Modulo_3/DML_Modulo_3.sql
\i Modulo_4/DML_Modulo_4.sql
\i Modulo_5/DML_Modulo_5.sql
\i Modulo_6/DML_Modulo_6.sql

\echo '======================================================================'
\echo ' [FASE 3/5] CREANDO 20 VISTAS ANALÍTICAS Y KPIS (MÓDULOS 1 AL 6)'
\echo '======================================================================'
\i Modulo_1/Vistas_Analiticas_Modulo_1.sql
\i Modulo_2/Vistas_Analiticas_Modulo_2.sql
\i Modulo_3/Vistas_Analiticas_Modulo_3.sql
\i Modulo_4/Vistas_Analiticas_Modulo_4.sql
\i Modulo_5/Vistas_Analiticas_Modulo_5.sql
\i Modulo_6/Vistas_Analiticas_Modulo_6.sql

\echo '======================================================================'
\echo ' [FASE 4/5] INSTALANDO TRIGGERS PL/PGSQL CON RAISE EXCEPTION (SPRINT 4)'
\echo '======================================================================'
\i database/triggers_sprint4.sql

\echo '======================================================================'
\echo ' [FASE 5/5] APLICANDO POLÍTICAS DCL Y PERMISOS (MÓDULO 1)'
\echo '======================================================================'
\i Modulo_1/DCL_Modulo_1.sql

-- Conceder permisos adicionales a rol_app_backend sobre Módulos 2 al 6 para la API FastAPI
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO rol_app_backend;
REVOKE DELETE ON TABLE usuarios FROM rol_app_backend;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO rol_app_backend;

\echo '======================================================================'
\echo ' INICIALIZACIÓN MAESTRA DE POSTGRESQL COMPLETADA EXITOSAMENTE'
\echo '======================================================================'
