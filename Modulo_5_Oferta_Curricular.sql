DROP TABLE IF EXISTS inscripciones_materias CASCADE;
DROP TABLE IF EXISTS grupos_clase CASCADE;
DROP TABLE IF EXISTS ciclos_escolares CASCADE;
DROP TABLE IF EXISTS prerrequisitos CASCADE;
DROP TABLE IF EXISTS materias CASCADE;

-- Módulo 5: Oferta Curricular
-- Requiere: Módulo 2 (programas_academicos), Módulo 3 (profesores) y Módulo 4 (estudiantes)

-- 1. materias
CREATE TABLE materias (
    id_materia SERIAL PRIMARY KEY,
    clave_materia VARCHAR(20) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    creditos INT NOT NULL,
    horas_teoria INT NOT NULL DEFAULT 0,
    horas_practica INT NOT NULL DEFAULT 0,
    id_programa INT NOT NULL,

    CONSTRAINT uq_materias_clave UNIQUE(clave_materia),
    CONSTRAINT ck_materias_creditos CHECK(creditos > 0),
    CONSTRAINT ck_materias_horas_teoria CHECK(horas_teoria >= 0),
    CONSTRAINT ck_materias_horas_practica CHECK(horas_practica >= 0),

    CONSTRAINT fk_materias_programa
        FOREIGN KEY (id_programa)
        REFERENCES programas_academicos (id_programa)
        ON DELETE RESTRICT
);

-- 2. prerrequisitos
CREATE TABLE prerrequisitos (
    id_materia INT NOT NULL,
    id_materia_prerrequisito INT NOT NULL,
    tipo_prerrequisito VARCHAR(20) NOT NULL DEFAULT 'obligatorio',

    PRIMARY KEY(id_materia, id_materia_prerrequisito),

    CONSTRAINT ck_prerrequisitos_diferentes 
        CHECK (id_materia <> id_materia_prerrequisito),

    CONSTRAINT ck_prerrequisitos_tipo 
        CHECK (tipo_prerrequisito IN ('obligatorio', 'recomendado')),

    CONSTRAINT fk_prerrequisitos_materia
        FOREIGN KEY (id_materia)
        REFERENCES materias (id_materia)
        ON DELETE CASCADE,

    CONSTRAINT fk_prerrequisitos_materia_pre
        FOREIGN KEY (id_materia_prerrequisito)
        REFERENCES materias (id_materia)
        ON DELETE CASCADE
);

-- 3. ciclos_escolares
CREATE TABLE ciclos_escolares (
    id_ciclo SERIAL PRIMARY KEY,
    nombre_ciclo VARCHAR(20) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estatus VARCHAR(20) NOT NULL,

    CONSTRAINT uq_ciclos_nombre UNIQUE(nombre_ciclo),
    CONSTRAINT ck_ciclos_fechas CHECK(fecha_fin >= fecha_inicio),
    CONSTRAINT ck_ciclos_estatus CHECK(estatus IN ('planificacion', 'activo', 'concluido'))
);

-- 4. grupos_clase
CREATE TABLE grupos_clase (
    id_grupo SERIAL PRIMARY KEY,
    id_materia INT NOT NULL,
    id_profesor INT NOT NULL,
    id_ciclo INT NOT NULL,
    clave_grupo VARCHAR(10) NOT NULL,
    aula VARCHAR(50) NOT NULL,
    cupo_maximo INT NOT NULL,

    CONSTRAINT uk_grupos_materia_ciclo_clave UNIQUE(id_materia, id_ciclo, clave_grupo),
    CONSTRAINT ck_grupos_cupo CHECK(cupo_maximo > 0),

    CONSTRAINT fk_grupos_materia
        FOREIGN KEY (id_materia)
        REFERENCES materias (id_materia)
        ON DELETE RESTRICT,

    CONSTRAINT fk_grupos_profesor
        FOREIGN KEY (id_profesor)
        REFERENCES profesores (id_profesor)
        ON DELETE RESTRICT,

    CONSTRAINT fk_grupos_ciclo
        FOREIGN KEY (id_ciclo)
        REFERENCES ciclos_escolares (id_ciclo)
        ON DELETE RESTRICT
);

-- 5. inscripciones_materias
CREATE TABLE inscripciones_materias (
    id_estudiante INT NOT NULL,
    id_grupo INT NOT NULL,
    fecha_inscripcion DATE NOT NULL DEFAULT CURRENT_DATE,
    estatus VARCHAR(20) NOT NULL DEFAULT 'inscrito',

    PRIMARY KEY(id_estudiante, id_grupo),

    CONSTRAINT ck_inscripciones_estatus 
        CHECK (estatus IN ('inscrito', 'baja_voluntaria', 'acreditado', 'no_acreditado')),

    CONSTRAINT fk_inscripciones_estudiante
        FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes (id_estudiante)
        ON DELETE CASCADE,

    CONSTRAINT fk_inscripciones_grupo
        FOREIGN KEY (id_grupo)
        REFERENCES grupos_clase (id_grupo)
        ON DELETE CASCADE
);