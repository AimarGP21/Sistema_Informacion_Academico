DROP TABLE IF EXISTS comites_titulacion CASCADE;
DROP TABLE IF EXISTS asistencias CASCADE;
DROP TABLE IF EXISTS calificaciones CASCADE;
DROP TABLE IF EXISTS periodos_evaluacion CASCADE;

-- Módulo 6: Evaluaciones y Acreditaciones
-- Requiere: Módulo 3 (profesores), Módulo 4 (estudiantes) y Módulo 5 (ciclos_escolares, grupos_clase)

-- 1. periodos_evaluacion
CREATE TABLE periodos_evaluacion (
    id_periodo_eval SERIAL PRIMARY KEY,
    id_ciclo INT NOT NULL,
    tipo_evaluacion VARCHAR(30) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estatus VARCHAR(15) NOT NULL DEFAULT 'abierto',

    CONSTRAINT ck_periodos_fechas CHECK(fecha_fin >= fecha_inicio),
    CONSTRAINT ck_periodos_tipo 
        CHECK (tipo_evaluacion IN ('parcial_1', 'parcial_2', 'ordinario', 'extraordinario')),
    CONSTRAINT ck_periodos_estatus CHECK (estatus IN ('abierto', 'cerrado')),

    CONSTRAINT fk_periodos_ciclo
        FOREIGN KEY (id_ciclo)
        REFERENCES ciclos_escolares (id_ciclo)
        ON DELETE CASCADE
);

-- 2. calificaciones
CREATE TABLE calificaciones (
    id_calificacion SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_grupo INT NOT NULL,
    id_periodo_eval INT NOT NULL,
    nota NUMERIC(4,2) NOT NULL,
    estatus_acreditacion VARCHAR(20) NOT NULL,

    CONSTRAINT uk_calificaciones_evaluacion UNIQUE(id_estudiante, id_grupo, id_periodo_eval),
    CONSTRAINT ck_calificaciones_nota CHECK(nota BETWEEN 0 AND 100),
    CONSTRAINT ck_calificaciones_estatus 
        CHECK (estatus_acreditacion IN ('aprobado', 'reprobado', 'no_presento', 'pendiente')),

    CONSTRAINT fk_calificaciones_estudiante
        FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes (id_estudiante)
        ON DELETE RESTRICT,

    CONSTRAINT fk_calificaciones_grupo
        FOREIGN KEY (id_grupo)
        REFERENCES grupos_clase (id_grupo)
        ON DELETE RESTRICT,

    CONSTRAINT fk_calificaciones_periodo
        FOREIGN KEY (id_periodo_eval)
        REFERENCES periodos_evaluacion (id_periodo_eval)
        ON DELETE RESTRICT
);

-- 3. asistencias
CREATE TABLE asistencias (
    id_asistencia SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_grupo INT NOT NULL,
    fecha_sesion DATE NOT NULL,
    estatus_asistencia VARCHAR(15) NOT NULL,

    CONSTRAINT uk_asistencias_sesion UNIQUE(id_estudiante, id_grupo, fecha_sesion),
    CONSTRAINT ck_asistencias_estatus 
        CHECK (estatus_asistencia IN ('presente', 'falta', 'justificado', 'retardo')),

    CONSTRAINT fk_asistencias_estudiante
        FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes (id_estudiante)
        ON DELETE CASCADE,

    CONSTRAINT fk_asistencias_grupo
        FOREIGN KEY (id_grupo)
        REFERENCES grupos_clase (id_grupo)
        ON DELETE CASCADE
);

-- 4. comites_titulacion
CREATE TABLE comites_titulacion (
    id_comite SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_profesor INT NOT NULL,
    rol_comite VARCHAR(30) NOT NULL,
    fecha_asignacion DATE NOT NULL DEFAULT CURRENT_DATE,
    dictamen VARCHAR(20) NOT NULL DEFAULT 'pendiente',

    CONSTRAINT uk_comite_estudiante_profesor UNIQUE(id_estudiante, id_profesor),
    CONSTRAINT ck_comite_rol 
        CHECK (rol_comite IN ('presidente', 'secretario', 'vocal', 'suplente')),
    CONSTRAINT ck_comite_dictamen 
        CHECK (dictamen IN ('pendiente', 'aprobado', 'rechazado')),

    CONSTRAINT fk_comite_estudiante
        FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes (id_estudiante)
        ON DELETE RESTRICT,

    CONSTRAINT fk_comite_profesor
        FOREIGN KEY (id_profesor)
        REFERENCES profesores (id_profesor)
        ON DELETE RESTRICT
);