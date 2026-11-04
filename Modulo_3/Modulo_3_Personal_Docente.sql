-- ============================================================================
-- SISTEMA DE INFORMACIÓN ACADÉMICA (SIA) - CUCEI / UDG
-- MÓDULO 3: PERSONAL DOCENTE E INVESTIGADORES
-- SUBLENGUAJE: DDL (Data Definition Language) - PostgreSQL 14+
-- ============================================================================
-- DEPENDENCIAS Y PRE-REQUISITOS REFERENCIALES:
--   1. Módulo 1 (RBAC): Requiere la tabla 'usuarios(id_usuario)'
--   2. Módulo 2 (Estructura): Requiere la tabla 'departamentos(id_departamento)'
-- ============================================================================

DROP TABLE IF EXISTS profesores_linea CASCADE;
DROP TABLE IF EXISTS profesores CASCADE;
DROP TABLE IF EXISTS lineas_investigacion CASCADE;
DROP TABLE IF EXISTS cuerpos_academicos CASCADE;

-- ============================================================================
-- 1. TABLA: lineas_investigacion
-- Propósito: Catálogo de Líneas de Generación y Aplicación del Conocimiento (LGAC)
-- acreditadas ante comités científicos, CONAHCYT y la Rectoría de CUCEI.
-- ============================================================================
CREATE TABLE lineas_investigacion (
    id_linea SERIAL PRIMARY KEY,
    nombre_linea VARCHAR(150) NOT NULL,
    descripcion TEXT NULL,
    CONSTRAINT uq_lineas_nombre_linea UNIQUE(nombre_linea)
);

-- ============================================================================
-- 2. TABLA: cuerpos_academicos
-- Propósito: Catálogo colegiado de grupos de investigación reconocidos por PRODEP
-- y la Universidad de Guadalajara según su nivel de madurez académica.
-- ============================================================================
CREATE TABLE cuerpos_academicos (
    id_cuerpo_academico SERIAL PRIMARY KEY,
    nombre_cuerpo VARCHAR(150) NOT NULL,
    grado_consolidacion VARCHAR(50) NOT NULL,

    CONSTRAINT uq_cuerpos_nombre_cuerpo UNIQUE(nombre_cuerpo),
    CONSTRAINT ck_cuerpos_grado_consolidacion
        CHECK (grado_consolidacion IN ('En Formación', 'En Consolidación', 'Consolidado'))
);

-- ============================================================================
-- 3. TABLA: profesores
-- Propósito: Padrón oficial del personal docente e investigadores adscritos
-- a departamentos de CUCEI, con enlace unívoco (1:1) a credenciales de usuario.
-- ============================================================================
CREATE TABLE profesores (
    id_profesor SERIAL PRIMARY KEY,
    numero_empleado VARCHAR(20) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    id_departamento INT NOT NULL,
    id_usuario INT NOT NULL,

    CONSTRAINT uq_profesores_numero_empleado UNIQUE(numero_empleado),
    CONSTRAINT uq_profesores_id_usuario UNIQUE(id_usuario),

    CONSTRAINT fk_profesores_departamento
        FOREIGN KEY (id_departamento)
        REFERENCES departamentos (id_departamento)
        ON DELETE RESTRICT,

    CONSTRAINT fk_profesores_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios (id_usuario)
        ON DELETE RESTRICT
);

-- ============================================================================
-- 4. TABLA: profesores_linea
-- Propósito: Matriz de adscripción N:M entre profesores investigadores
-- y las distintas Líneas de Generación y Aplicación del Conocimiento (LGAC).
-- ============================================================================
CREATE TABLE profesores_linea (
    id_profesor INT NOT NULL,
    id_linea INT NOT NULL,

    PRIMARY KEY(id_profesor, id_linea),

    CONSTRAINT fk_proflin_profesor
        FOREIGN KEY (id_profesor)
        REFERENCES profesores (id_profesor)
        ON DELETE CASCADE,

    CONSTRAINT fk_proflin_linea
        FOREIGN KEY (id_linea)
        REFERENCES lineas_investigacion (id_linea)
        ON DELETE CASCADE
);
