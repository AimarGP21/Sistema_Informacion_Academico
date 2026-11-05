-- DDL Módulo 6: Evaluaciones y Calificaciones
-- Requiere: Módulo 4 (estudiantes) y Módulo 5 (grupos_clase, inscripciones_materias)

DROP TABLE IF EXISTS evaluaciones_docentes CASCADE;
DROP TABLE IF EXISTS actas_calificaciones CASCADE;
DROP TABLE IF EXISTS calificaciones_evaluacion CASCADE;
DROP TABLE IF EXISTS esquemas_evaluacion CASCADE;
DROP TABLE IF EXISTS tipos_evaluacion CASCADE;

-- 1. Catálogo de tipos de evaluación (parciales, proyectos, final, extraordinario, etc.)
CREATE TABLE tipos_evaluacion (
    id_tipo_evaluacion SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,

    CONSTRAINT uq_tipos_evaluacion_nombre UNIQUE(nombre)
);

-- 2. Ponderación y esquemas de evaluación configurados por grupo
CREATE TABLE esquemas_evaluacion (
    id_esquema SERIAL PRIMARY KEY,
    id_grupo INT NOT NULL,
    id_tipo_evaluacion INT NOT NULL,
    porcentaje NUMERIC(5,2) NOT NULL,
    fecha_evaluacion DATE NULL,

    CONSTRAINT uk_esquemas_grupo_tipo UNIQUE(id_grupo, id_tipo_evaluacion),
    CONSTRAINT ck_esquemas_porcentaje CHECK(porcentaje > 0 AND porcentaje <= 100),

    CONSTRAINT fk_esquemas_grupo
        FOREIGN KEY (id_grupo)
        REFERENCES grupos_clase (id_grupo)
        ON DELETE CASCADE,

    CONSTRAINT fk_esquemas_tipo
        FOREIGN KEY (id_tipo_evaluacion)
        REFERENCES tipos_evaluacion (id_tipo_evaluacion)
        ON DELETE RESTRICT
);

-- 3. Calificaciones individuales obtenidas por estudiante en cada rubro
CREATE TABLE calificaciones_evaluacion (
    id_calificacion SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_grupo INT NOT NULL,
    id_esquema INT NOT NULL,
    calificacion NUMERIC(4,2) NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT uk_calificaciones_estudiante_esquema UNIQUE(id_estudiante, id_esquema),
    CONSTRAINT ck_calificaciones_rango CHECK(calificacion BETWEEN 0 AND 10),

    CONSTRAINT fk_calificaciones_inscripcion
        FOREIGN KEY (id_estudiante, id_grupo)
        REFERENCES inscripciones_materias (id_estudiante, id_grupo)
        ON DELETE CASCADE,

    CONSTRAINT fk_calificaciones_esquema
        FOREIGN KEY (id_esquema)
        REFERENCES esquemas_evaluacion (id_esquema)
        ON DELETE CASCADE
);

-- 4. Actas finales de calificaciones por grupo
CREATE TABLE actas_calificaciones (
    id_acta SERIAL PRIMARY KEY,
    id_grupo INT NOT NULL UNIQUE,
    fecha_cierre TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estatus_acta VARCHAR(20) NOT NULL DEFAULT 'borrador',
    observaciones TEXT,

    CONSTRAINT ck_actas_estatus CHECK(estatus_acta IN ('borrador', 'cerrada', 'extemporanea')),

    CONSTRAINT fk_actas_grupo
        FOREIGN KEY (id_grupo)
        REFERENCES grupos_clase (id_grupo)
        ON DELETE CASCADE
);

-- 5. Evaluación docente (encuesta de desempeño del profesor realizada por alumnos)
CREATE TABLE evaluaciones_docentes (
    id_evaluacion_docente SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_grupo INT NOT NULL,
    puntaje_dominio_materia INT NOT NULL,
    puntaje_pedagogia INT NOT NULL,
    puntaje_puntualidad INT NOT NULL,
    comentarios TEXT,
    fecha_evaluacion DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT uk_eval_docente_estudiante_grupo UNIQUE(id_estudiante, id_grupo),
    CONSTRAINT ck_eval_docente_dominio CHECK(puntaje_dominio_materia BETWEEN 1 AND 5),
    CONSTRAINT ck_eval_docente_pedagogia CHECK(puntaje_pedagogia BETWEEN 1 AND 5),
    CONSTRAINT ck_eval_docente_puntualidad CHECK(puntaje_puntualidad BETWEEN 1 AND 5),

    CONSTRAINT fk_eval_docente_inscripcion
        FOREIGN KEY (id_estudiante, id_grupo)
        REFERENCES inscripciones_materias (id_estudiante, id_grupo)
        ON DELETE CASCADE
);