-- ============================================================================
-- SISTEMA DE INFORMACIÓN ACADÉMICA (SIA) - CUCEI / UDG
-- SPRINT 4: DISPARADORES (TRIGGERS PL/pgSQL) DE REGLAS DE NEGOCIO CON RAISE EXCEPTION
-- ============================================================================
-- Propósito:
--   Implementar validaciones transaccionales activas a nivel de motor PostgreSQL
--   que puedan detonarse y demostrarse en vivo desde la interfaz web (React + FastAPI).
--
-- Triggers incluidos:
--   1. trg_validar_inscripcion_grupo (BEFORE INSERT ON inscripciones_materias):
--      Valida que el alumno tenga estatus_escolar = 'activo' y que el grupo no
--      haya alcanzado su cupo_maximo en grupos_clase.
--   2. trg_validar_otorgamiento_beca (BEFORE INSERT OR UPDATE ON becas_asignadas):
--      Valida que el alumno esté 'activo' para becas vigentes y que cumpla con
--      un promedio >= 8.50 en expedientes_academicos para 'Beca de Excelencia Académica'.
--   3. trg_bloquear_calificacion_acta_cerrada (BEFORE INSERT OR UPDATE OR DELETE ON calificaciones_evaluacion):
--      Impide modificar calificaciones cuando el acta del grupo ya está 'cerrada'.
-- ============================================================================

-- Limpieza idempotente previa
DROP TRIGGER IF EXISTS trg_validar_inscripcion_grupo ON inscripciones_materias;
DROP FUNCTION IF EXISTS fn_validar_inscripcion_grupo();

DROP TRIGGER IF EXISTS trg_validar_otorgamiento_beca ON becas_asignadas;
DROP FUNCTION IF EXISTS fn_validar_otorgamiento_beca();

DROP TRIGGER IF EXISTS trg_bloquear_calificacion_acta_cerrada ON calificaciones_evaluacion;
DROP FUNCTION IF EXISTS fn_bloquear_calificacion_acta_cerrada();


-- ============================================================================
-- TRIGGER 1: CONTROL DE ESTATUS ESCOLAR Y CUPO MÁXIMO EN INSCRIPCIÓN A GRUPOS
-- Tabla objetivo: inscripciones_materias (Módulo 5)
-- Tablas consultadas: estudiantes (Módulo 4), grupos_clase (Módulo 5)
-- ============================================================================
CREATE OR REPLACE FUNCTION fn_validar_inscripcion_grupo()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_matricula          VARCHAR(20);
    v_nombre_estudiante   TEXT;
    v_estatus_escolar    VARCHAR(20);
    v_clave_grupo        VARCHAR(10);
    v_cupo_maximo        INT;
    v_inscritos_actuales INT;
BEGIN
    -- 1. Verificar existencia y estatus escolar del estudiante
    SELECT e.matricula,
           e.nombre || ' ' || e.apellido,
           e.estatus_escolar
      INTO v_matricula, v_nombre_estudiante, v_estatus_escolar
      FROM estudiantes e
     WHERE e.id_estudiante = NEW.id_estudiante;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'OPERACIÓN RECHAZADA [trg_validar_inscripcion_grupo]: El estudiante con ID % no existe en el padrón escolar.',
            NEW.id_estudiante
            USING ERRCODE = 'P0001';
    END IF;

    IF v_estatus_escolar <> 'activo' THEN
        RAISE EXCEPTION 'OPERACIÓN RECHAZADA [trg_validar_inscripcion_grupo]: El estudiante % (Matrícula: %, ID: %) tiene estatus escolar "%" y no puede inscribir materias (se requiere estatus "activo").',
            v_nombre_estudiante, v_matricula, NEW.id_estudiante, v_estatus_escolar
            USING ERRCODE = 'P0001';
    END IF;

    -- 2. Verificar existencia y cupo máximo del grupo de clase
    SELECT gc.clave_grupo, gc.cupo_maximo
      INTO v_clave_grupo, v_cupo_maximo
      FROM grupos_clase gc
     WHERE gc.id_grupo = NEW.id_grupo;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'OPERACIÓN RECHAZADA [trg_validar_inscripcion_grupo]: El grupo de clase con ID % no existe en la oferta curricular.',
            NEW.id_grupo
            USING ERRCODE = 'P0001';
    END IF;

    -- Contabilizar alumnos actualmente ocupando lugar en el grupo (excluyendo bajas voluntarias)
    SELECT COUNT(*)
      INTO v_inscritos_actuales
      FROM inscripciones_materias im
     WHERE im.id_grupo = NEW.id_grupo
       AND im.estatus <> 'baja_voluntaria';

    IF v_inscritos_actuales >= v_cupo_maximo THEN
        RAISE EXCEPTION 'OPERACIÓN RECHAZADA [trg_validar_inscripcion_grupo]: Sobrecupo en el grupo % (ID: %). Cupo máximo permitido: % alumnos, inscritos actuales: %.',
            v_clave_grupo, NEW.id_grupo, v_cupo_maximo, v_inscritos_actuales
            USING ERRCODE = 'P0001';
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_validar_inscripcion_grupo
BEFORE INSERT ON inscripciones_materias
FOR EACH ROW
EXECUTE FUNCTION fn_validar_inscripcion_grupo();


-- ============================================================================
-- TRIGGER 2: ELEGIBILIDAD ACADÉMICA Y PROMEDIO MÍNIMO PARA OTORGAMIENTO DE BECAS
-- Tabla objetivo: becas_asignadas (Módulo 4)
-- Tablas consultadas: estudiantes (Módulo 4), expedientes_academicos (Módulo 4)
-- ============================================================================
CREATE OR REPLACE FUNCTION fn_validar_otorgamiento_beca()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_matricula         VARCHAR(20);
    v_nombre_estudiante TEXT;
    v_estatus_escolar   VARCHAR(20);
    v_promedio          NUMERIC(4,2);
BEGIN
    -- 1. Obtener perfil escolar y promedio del expediente del estudiante
    SELECT e.matricula,
           e.nombre || ' ' || e.apellido,
           e.estatus_escolar,
           COALESCE(x.promedio, 0.00)
      INTO v_matricula, v_nombre_estudiante, v_estatus_escolar, v_promedio
      FROM estudiantes e
      LEFT JOIN expedientes_academicos x
        ON e.id_estudiante = x.id_estudiante
     WHERE e.id_estudiante = NEW.id_estudiante;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'OPERACIÓN RECHAZADA [trg_validar_otorgamiento_beca]: El estudiante con ID % no existe.',
            NEW.id_estudiante
            USING ERRCODE = 'P0002';
    END IF;

    -- 2. Si se intenta registrar una beca nueva o mantenerla vigente (fecha_fin IS NULL),
    --    el estudiante debe encontrarse con estatus_escolar = 'activo'.
    IF (TG_OP = 'INSERT' OR NEW.fecha_fin IS NULL) AND v_estatus_escolar <> 'activo' THEN
        RAISE EXCEPTION 'OPERACIÓN RECHAZADA [trg_validar_otorgamiento_beca]: No es posible otorgar una beca activa ("%") al estudiante % (Matrícula: %, ID: %) porque su estatus escolar es "%".',
            NEW.nombre_beca, v_nombre_estudiante, v_matricula, NEW.id_estudiante, v_estatus_escolar
            USING ERRCODE = 'P0002';
    END IF;

    -- 3. Regla de Excelencia Académica: promedio mínimo obligatorio de 8.50
    IF NEW.nombre_beca = 'Beca de Excelencia Académica' AND v_promedio < 8.50 THEN
        RAISE EXCEPTION 'OPERACIÓN RECHAZADA [trg_validar_otorgamiento_beca]: El estudiante % (Matrícula: %, ID: %) posee un promedio general de % y no alcanza el mínimo de 8.50 exigido para la "Beca de Excelencia Académica".',
            v_nombre_estudiante, v_matricula, NEW.id_estudiante, v_promedio
            USING ERRCODE = 'P0002';
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_validar_otorgamiento_beca
BEFORE INSERT OR UPDATE ON becas_asignadas
FOR EACH ROW
EXECUTE FUNCTION fn_validar_otorgamiento_beca();


-- ============================================================================
-- TRIGGER 3 (ADICIONAL): PROTECCIÓN DE INTEGRIDAD DE ACTAS DE CALIFICACIÓN CERRADAS
-- Tabla objetivo: calificaciones_evaluacion (Módulo 6)
-- Tabla consultada: actas_calificaciones (Módulo 6)
-- ============================================================================
CREATE OR REPLACE FUNCTION fn_bloquear_calificacion_acta_cerrada()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_id_grupo     INT;
    v_estatus_acta VARCHAR(20);
BEGIN
    v_id_grupo := COALESCE(NEW.id_grupo, OLD.id_grupo);

    SELECT ac.estatus_acta
      INTO v_estatus_acta
      FROM actas_calificaciones ac
     WHERE ac.id_grupo = v_id_grupo;

    IF v_estatus_acta = 'cerrada' THEN
        RAISE EXCEPTION 'OPERACIÓN RECHAZADA [trg_bloquear_calificacion_acta_cerrada]: El acta oficial del grupo ID % ya se encuentra "cerrada" y no admite altas, cambios ni bajas de calificaciones.',
            v_id_grupo
            USING ERRCODE = 'P0003';
    END IF;

    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_bloquear_calificacion_acta_cerrada
BEFORE INSERT OR UPDATE OR DELETE ON calificaciones_evaluacion
FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_calificacion_acta_cerrada();


-- ============================================================================
-- GUÍA DE DEMOSTRACIÓN EN VIVO (CASOS DE PRUEBA QUE DETONAN RAISE EXCEPTION)
-- ============================================================================
-- Caso 1 (Detona trg_validar_inscripcion_grupo por alumno egresado/baja):
--   INSERT INTO inscripciones_materias (id_estudiante, id_grupo, fecha_inscripcion, estatus)
--   SELECT id_estudiante, 1, CURRENT_DATE, 'inscrito'
--   FROM estudiantes WHERE estatus_escolar <> 'activo' LIMIT 1;
--
-- Caso 2 (Detona trg_validar_otorgamiento_beca por promedio < 8.50):
--   INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante)
--   SELECT 'Beca de Excelencia Académica', 100, CURRENT_DATE, NULL, e.id_estudiante
--   FROM estudiantes e
--   INNER JOIN expedientes_academicos x ON e.id_estudiante = x.id_estudiante
--   WHERE e.estatus_escolar = 'activo' AND x.promedio < 8.50 LIMIT 1;
--
-- Caso 3 (Detona trg_bloquear_calificacion_acta_cerrada en grupo con acta cerrada):
--   UPDATE calificaciones_evaluacion SET calificacion = 10.00 WHERE id_grupo = 1;
-- ============================================================================
