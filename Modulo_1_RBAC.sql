DROP TABLE IF EXISTS usuarios CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS permisos CASCADE;
DROP TABLE IF EXISTS roles_permisos CASCADE;
DROP TABLE IF EXISTS usuarios_roles CASCADE;

-- Modulo 1: Autenticacion y control de acceso basado en roles (RBAC)

-- 1. usuarios
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email TEXT NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    estatus VARCHAR(20) NOT NULL, 
    CONSTRAINT uq_usuarios_username UNIQUE(username),
    CONSTRAINT uq_usuarios_email UNIQUE(email),
    CONSTRAINT check_usuarios_estatus CHECK(estatus IN ('activo', 'inactivo', 'bloqueado'))
) ;

-- 2. roles
CREATE TABLE roles (
    id_rol SERIAL PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NULL,
    CONSTRAINT uq_roles_nombre_rol UNIQUE(nombre_rol)
) ;

--3. permisos
CREATE TABLE permisos (
    id_permiso SERIAL PRIMARY KEY,
    nombre_permiso VARCHAR(100) NOT NULL,
    modulo VARCHAR(50) NOT NULL,
    CONSTRAINT uq_permisos_nombre_permiso UNIQUE(nombre_permiso)
) ;

--4. roles_permisos
CREATE TABLE roles_permisos (
    id_rol INT NOT NULL,
    id_permiso INT NOT NULL,

    PRIMARY KEY(id_rol, id_permiso),

        CONSTRAINT fk_rolpe_rol
        FOREIGN KEY (id_rol)
        REFERENCES roles (id_rol)
        ON DELETE CASCADE,

        CONSTRAINT fk_rolpe_permiso
        FOREIGN KEY (id_permiso)
        REFERENCES permisos (id_permiso)
        ON DELETE CASCADE
    ) ;

--5. usuarios_roles
CREATE TABLE usuarios_roles(
    id_usuario INT NOT NULL,
    id_rol INT NOT NULL,

    PRIMARY KEY(id_usuario, id_rol),

        CONSTRAINT fk_usurol_usuario
        FOREIGN KEY(id_usuario)
        REFERENCES usuarios (id_usuario)
        ON DELETE CASCADE,

        CONSTRAINT fk_usurol_rol
        FOREIGN KEY(id_rol)
        REFERENCES roles (id_rol)
        ON DELETE CASCADE
    ) ;

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

    CONSTRAINT uq_programas_departamento_nombre
        UNIQUE (id_departamento, nombre)
);
