DROP TABLE IF EXISTS campus CASCADE;
DROP TABLE IF EXISTS facultades CASCADE;
DROP TABLE IF EXISTS departamentos CASCADE;
DROP TABLE IF EXISTS programas_academicos CASCADE;

-- Modulo 2: Estructura organizacional

-- 1. campus
CREATE TABLE campus (
    id_campus SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    direccion VARCHAR(200),
    ciudad VARCHAR(80),
    estado VARCHAR(80)
);

-- 2. facultades
CREATE TABLE facultades (
    id_facultad SERIAL PRIMARY KEY,
    id_campus INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,

    CONSTRAINT fk_facultades_campus
        FOREIGN KEY (id_campus)
        REFERENCES campus(id_campus)
        ON DELETE CASCADE,

    CONSTRAINT uk_facultades_campus_nombre
        UNIQUE (id_campus, nombre)
);

-- 3. departamentos
CREATE TABLE departamentos (
    id_departamento SERIAL PRIMARY KEY,
    id_facultad INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,

    CONSTRAINT fk_departamentos_facultad
        FOREIGN KEY (id_facultad)
        REFERENCES facultades(id_facultad)
        ON DELETE CASCADE,

    CONSTRAINT uk_departamentos_facultad_nombre
        UNIQUE (id_facultad, nombre)
);

-- 4. programas_academicos
CREATE TABLE programas_academicos (
    id_programa SERIAL PRIMARY KEY,
    id_departamento INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    nivel VARCHAR(15) NOT NULL,

    CONSTRAINT fk_programas_departamentos
        FOREIGN KEY (id_departamento)
        REFERENCES departamentos(id_departamento)
        ON DELETE CASCADE,

    CONSTRAINT ck_programas_nivel
        CHECK (nivel IN ('Licenciatura', 'Maestria', 'Doctorado')),

    CONSTRAINT uk_programas_departamento_nombre
        UNIQUE (id_departamento, nombre)
);