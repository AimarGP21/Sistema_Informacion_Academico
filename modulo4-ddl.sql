DROP TABLE IF EXISTS cohortes CASCADE;
DROP TABLE IF EXISTS estudiantes CASCADE;
DROP TABLE IF EXISTS expedientes_academicos CASCADE;
DROP TABLE IF EXISTS becas_asignadas CASCADE;
 
-- Módulo 4: Alumnos y matrícula
-- Requiere: Módulo 1 (usuarios) y Módulo 2 (programas_academicos)
 
-- 1. cohortes
CREATE TABLE cohortes (
    id_cohorte SERIAL PRIMARY KEY,
    nombre_cohorte VARCHAR(50) NOT NULL,
    anio_ingreso SMALLINT NOT NULL,
 
    CONSTRAINT uq_cohortes_nombre_cohorte UNIQUE(nombre_cohorte)
);
 
-- 2. estudiantes
CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    apellido VARCHAR(120) NOT NULL,
    estatus_escolar VARCHAR(20) NOT NULL,
    id_usuario INT NOT NULL,
    id_programa INT NOT NULL,
    id_cohorte INT NOT NULL,
 
    CONSTRAINT uq_estudiantes_matricula UNIQUE(matricula),
    CONSTRAINT uq_estudiantes_id_usuario UNIQUE(id_usuario),
 
    CONSTRAINT ck_estudiantes_estatus_escolar
        CHECK (estatus_escolar IN ('activo', 'baja_temporal', 'baja_definitiva', 'egresado')),
 
    CONSTRAINT fk_estudiantes_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios (id_usuario)
        ON DELETE RESTRICT,
 
    CONSTRAINT fk_estudiantes_programa
        FOREIGN KEY (id_programa)
        REFERENCES programas_academicos (id_programa)
        ON DELETE RESTRICT,
 
    CONSTRAINT fk_estudiantes_cohorte
        FOREIGN KEY (id_cohorte)
        REFERENCES cohortes (id_cohorte)
        ON DELETE RESTRICT
);
 
-- 3. expedientes_academicos
CREATE TABLE expedientes_academicos (
    id_expediente SERIAL PRIMARY KEY,
    creditos_cursados INT NOT NULL DEFAULT 0,
    promedio NUMERIC(4,2) NOT NULL DEFAULT 0,
    id_estudiante INT NOT NULL,
 
    CONSTRAINT uq_expedientes_id_estudiante UNIQUE(id_estudiante),
 
    CONSTRAINT ck_expedientes_creditos_cursados
        CHECK (creditos_cursados >= 0),
 
    CONSTRAINT ck_expedientes_promedio
        CHECK (promedio BETWEEN 0 AND 10),
 
    CONSTRAINT fk_expedientes_estudiante
        FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes (id_estudiante)
        ON DELETE CASCADE
);
 
-- 4. becas_asignadas
CREATE TABLE becas_asignadas (
    id_beca SERIAL PRIMARY KEY,
    nombre_beca VARCHAR(120) NOT NULL,
    porcentaje SMALLINT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NULL,
    id_estudiante INT NOT NULL,
 
    CONSTRAINT ck_becas_porcentaje
        CHECK (porcentaje BETWEEN 1 AND 100),
 
    CONSTRAINT ck_becas_fechas
        CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio),
 
    CONSTRAINT fk_becas_estudiante
        FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes (id_estudiante)
        ON DELETE CASCADE
);
 