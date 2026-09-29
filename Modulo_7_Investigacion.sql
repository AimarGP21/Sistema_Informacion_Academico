DROP TABLE IF EXISTS propiedad_intelectual CASCADE;
DROP TABLE IF EXISTS autores_articulos CASCADE;
DROP TABLE IF EXISTS articulos_publicados CASCADE;
DROP TABLE IF EXISTS proyectos_investigacion CASCADE;
DROP TABLE IF EXISTS revistas_indexadas CASCADE;

-- Modulo 7 Investigacion y Produccion Cientifica.

-- 1. Revistas Indexadas
CREATE TABLE revistas_indexadas (
    id_revista SERIAL PRIMARY KEY,
    issn VARCHAR(20) NOT NULL,
    nombre_revista VARCHAR(150) NOT NULL,
    indexacion VARCHAR(50) NOT NULL,
    pais_revista VARCHAR(60),
    sitio_web VARCHAR(255),
    CONSTRAINT uq_revistas_issn UNIQUE (issn),
) ;

-- 2. Proyectos de Investigacion
CREATE TABLE proyectos_investigacion (
    id_proyecto SERIAL PRIMARY KEY,
    codigo_proyecto VARCHAR(30) NOT NULL,
    titulo_proyecto VARCHAR(255) NOT NULL,
    resumen_ejecutivo TEXT,
    origen_financiamiento VARCHAR(50) NOT NULL,
    monto_financiado DECIMAL(12,2) NOT NULL,
    estatus VARCHAR(20) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    CONSTRAINT uq_proyectos_codigo UNIQUE (codigo_proyecto),
    CONSTRAINT check_proyectos_origen CHECK (origen_financiamiento IN ('INTERNO_UDG', 'CONAHCYT', 'PRODEP', 'INDUSTRIA', 'RECURSOS_PROPIOS')),
    CONSTRAINT check_proyectos_monto CHECK (monto_financiado >= 0),
    CONSTRAINT check_proyectos_estatus CHECK (estatus IN ('EN_REVISION', 'APROBADO', 'EN_EJECUCION', 'CONCLUIDO', 'CANCELADO')),
    CONSTRAINT check_proyectos_fechas CHECK (fecha_fin >= fecha_inicio),
    id_profesor_resp INT NOT NULL,
        CONSTRAINT fk_proyectos_profesores
        FOREIGN KEY (id_profesor_resp)
        REFERENCES profesores (id_profesor)
        ON DELETE RESTRICT,
    id_departamento INT NOT NULL,
        CONSTRAINT fk_proyectos_departamentos
        FOREIGN KEY (id_departamento)
        REFERENCES departamentos (id_departamento)
        ON DELETE RESTRICT
) ;

-- 3. Articulos Publicados
CREATE TABLE articulos_publicados (
    id_articulo SERIAL PRIMARY KEY,
    doi VARCHAR(100) NOT NULL,
    titulo_articulo VARCHAR(255) NOT NULL,
    abstract TEXT,
    anio_publicacion INT NOT NULL,
    cuartil VARCHAR(2),
    factor_impacto DECIMAL(5,3),
    afiliacion_udg BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT uq_articulos_doi UNIQUE (doi),
    CONSTRAINT check_articulos_anio CHECK (anio_publicacion BETWEEN 1900 AND 2100),
    CONSTRAINT check_articulos_cuartil CHECK (cuartil IN ('Q1', 'Q2', 'Q3', 'Q4', 'NA')),
    id_revista INT NOT NULL,
        CONSTRAINT fk_articulos_revistas
        FOREIGN KEY (id_revista)
        REFERENCES revistas_indexadas (id_revista)
        ON DELETE RESTRICT,
    id_proyecto INT,
        CONSTRAINT fk_articulos_proyectos
        FOREIGN KEY (id_proyecto)
        REFERENCES proyectos_investigacion (id_proyecto)
        ON DELETE SET NULL
) ;

-- 4. Autores de Articulos
CREATE TABLE autores_articulos (
    id_articulo INT NOT NULL,
    orden_autoria INT NOT NULL,
    tipo_autor VARCHAR(20) NOT NULL,
    codigo_udg VARCHAR(20),
    nombre_autor_externo VARCHAR(150),
    filiacion_externa VARCHAR(150),
    es_autor_correspondencia BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT pk_autores_articulos PRIMARY KEY (id_articulo, orden_autoria),
    CONSTRAINT check_autores_tipo CHECK (tipo_autor IN ('PROFESOR_CUCEI', 'ALUMNO_PREGRADO', 'ALUMNO_POSGRADO', 'EXTERNO')),
    CONSTRAINT fk_autores_articulos
        FOREIGN KEY (id_articulo)
        REFERENCES articulos_publicados (id_articulo)
        ON DELETE CASCADE
) ;

-- 5. Propiedad Intelectual
CREATE TABLE propiedad_intelectual (
    id_propiedad SERIAL PRIMARY KEY,
    numero_registro VARCHAR(50) NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    tipo_propiedad VARCHAR(30) NOT NULL,
    estatus VARCHAR(20) NOT NULL,
    fecha_concesion DATE,
    CONSTRAINT uq_propiedad_registro UNIQUE (numero_registro),
    CONSTRAINT check_propiedad_tipo CHECK (tipo_propiedad IN ('PATENTE', 'MODELO_UTILIDAD', 'SOFTWARE_INDAUTOR', 'DISENO_INDUSTRIAL')),
    CONSTRAINT check_propiedad_estatus CHECK (estatus IN ('SOLICITADO', 'EN_EXAMEN', 'OTORGADO', 'RECHAZADO')),
    id_proyecto INT,
        CONSTRAINT fk_propiedad_proyectos
        FOREIGN KEY (id_proyecto)
        REFERENCES proyectos_investigacion (id_proyecto)
        ON DELETE SET NULL
) ;