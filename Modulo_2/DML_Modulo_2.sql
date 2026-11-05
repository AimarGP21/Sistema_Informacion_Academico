-- DML Módulo 2: Estructura organizacional (generado con seeder_modulo_2.py)
-- Ejecutar sobre tablas recién creadas con Modulo_2_Estructura.sql

-- 1. campus
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de Ciencias Exactas e Ingenierías (CUCEI)', 'Corredor Zacatecas 036 Edif. 089 , Depto. 917', 'Guadalajara', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de Ciencias de la Salud (CUCS)', 'Pasaje Cruz 731 Edif. 443 , Depto. 158', 'Guadalajara', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de Ciencias Económico Administrativas (CUCEA)', 'Diagonal Norte Marroquín 632 930', 'Zapopan', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de Ciencias Sociales y Humanidades (CUCSH)', 'Periférico Sur Segura 766 Interior 338', 'Guadalajara', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de Arte, Arquitectura y Diseño (CUAAD)', 'Privada Sur Ureña 601 Interior 815', 'Guadalajara', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de Ciencias Biológicas y Agropecuarias (CUCBA)', 'Privada Albania 951 Interior 215', 'Zapopan', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de los Altos (CUAltos)', NULL, 'Tepatitlán de Morelos', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de la Ciénega (CUCiénega)', NULL, 'Ocotlán', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de la Costa (CUCosta)', 'Cerrada Norte Garica 143 619', 'Puerto Vallarta', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de la Costa Sur (CUCSur)', NULL, 'Autlán de Navarro', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de los Lagos (CULagos)', NULL, 'Lagos de Moreno', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario del Norte (CUNorte)', NULL, 'Colotlán', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario del Sur (CUSur)', NULL, 'Ciudad Guzmán', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de Tonalá (CUTonalá)', 'Boulevard Norte Carbajal 394 Interior 934', 'Tonalá', 'Jalisco');
INSERT INTO campus (nombre, direccion, ciudad, estado) VALUES ('Centro Universitario de los Valles (CUValles)', NULL, 'Ameca', 'Jalisco');

-- 2. facultades
INSERT INTO facultades (id_campus, nombre) VALUES (1, 'División de Electrónica y Computación');
INSERT INTO facultades (id_campus, nombre) VALUES (1, 'División de Ciencias Básicas');
INSERT INTO facultades (id_campus, nombre) VALUES (1, 'División de Ingenierías');
INSERT INTO facultades (id_campus, nombre) VALUES (2, 'División de Disciplinas Clínicas');
INSERT INTO facultades (id_campus, nombre) VALUES (2, 'División de Disciplinas Básicas para la Salud');
INSERT INTO facultades (id_campus, nombre) VALUES (2, 'División de Disciplinas para el Desarrollo, Promoción y Preservación de la Salud');
INSERT INTO facultades (id_campus, nombre) VALUES (3, 'División de Economía y Sociedad');
INSERT INTO facultades (id_campus, nombre) VALUES (3, 'División de Gestión Empresarial');
INSERT INTO facultades (id_campus, nombre) VALUES (4, 'División de Estudios Históricos y Humanos');
INSERT INTO facultades (id_campus, nombre) VALUES (4, 'División de Estudios de la Cultura');
INSERT INTO facultades (id_campus, nombre) VALUES (4, 'División de Estudios Jurídicos y Sociales');
INSERT INTO facultades (id_campus, nombre) VALUES (5, 'División de Arquitectura y Urbanismo');
INSERT INTO facultades (id_campus, nombre) VALUES (5, 'División de Arte y Diseño');
INSERT INTO facultades (id_campus, nombre) VALUES (6, 'División de Ciencias Biológicas');
INSERT INTO facultades (id_campus, nombre) VALUES (6, 'División de Ciencias Agropecuarias');
INSERT INTO facultades (id_campus, nombre) VALUES (7, 'División de Ciencias Agropecuarias e Ingenierías');
INSERT INTO facultades (id_campus, nombre) VALUES (7, 'División de Ciencias Sociales y Humanidades');
INSERT INTO facultades (id_campus, nombre) VALUES (8, 'División de Desarrollo Biotecnológico');
INSERT INTO facultades (id_campus, nombre) VALUES (8, 'División de Desarrollo Regional');
INSERT INTO facultades (id_campus, nombre) VALUES (9, 'División de Ingenierías');
INSERT INTO facultades (id_campus, nombre) VALUES (9, 'División de Ciencias Sociales y Económico-Administrativas');
INSERT INTO facultades (id_campus, nombre) VALUES (10, 'División de Desarrollo Regional');
INSERT INTO facultades (id_campus, nombre) VALUES (10, 'División de Ciencias Sociales');
INSERT INTO facultades (id_campus, nombre) VALUES (11, 'División de Ciencias Económicas y Sociales');
INSERT INTO facultades (id_campus, nombre) VALUES (11, 'División de Ingeniería y Tecnología');
INSERT INTO facultades (id_campus, nombre) VALUES (12, 'División de Ciencias Sociales y Humanidades');
INSERT INTO facultades (id_campus, nombre) VALUES (12, 'División de Ciencias Exactas y Naturales');
INSERT INTO facultades (id_campus, nombre) VALUES (13, 'División de Ciencias Sociales y Humanidades');
INSERT INTO facultades (id_campus, nombre) VALUES (13, 'División de Ciencias Naturales y Exactas');
INSERT INTO facultades (id_campus, nombre) VALUES (14, 'División de Ingenierías');
INSERT INTO facultades (id_campus, nombre) VALUES (14, 'División de Ciencias Sociales y Administrativas');
INSERT INTO facultades (id_campus, nombre) VALUES (15, 'División de Estudios Científicos y Tecnológicos');
INSERT INTO facultades (id_campus, nombre) VALUES (15, 'División de Estudios Sociales y Económicos');

-- 3. departamentos (los id 1 a 11 son de CUCEI; los usan los módulos 3 y 7)
INSERT INTO departamentos (id_facultad, nombre) VALUES (1, 'Departamento de Ciencias Computacionales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (1, 'Departamento de Electrónica');
INSERT INTO departamentos (id_facultad, nombre) VALUES (2, 'Departamento de Física');
INSERT INTO departamentos (id_facultad, nombre) VALUES (2, 'Departamento de Matemáticas');
INSERT INTO departamentos (id_facultad, nombre) VALUES (2, 'Departamento de Química');
INSERT INTO departamentos (id_facultad, nombre) VALUES (2, 'Departamento de Farmacobiología');
INSERT INTO departamentos (id_facultad, nombre) VALUES (3, 'Departamento de Ingeniería Química');
INSERT INTO departamentos (id_facultad, nombre) VALUES (3, 'Departamento de Ingeniería Industrial');
INSERT INTO departamentos (id_facultad, nombre) VALUES (3, 'Departamento de Ingeniería Mecánica Eléctrica');
INSERT INTO departamentos (id_facultad, nombre) VALUES (3, 'Departamento de Ingeniería Civil y Topografía');
INSERT INTO departamentos (id_facultad, nombre) VALUES (3, 'Departamento de Ingeniería de Proyectos');
INSERT INTO departamentos (id_facultad, nombre) VALUES (4, 'Departamento de Clínicas Médicas');
INSERT INTO departamentos (id_facultad, nombre) VALUES (4, 'Departamento de Enfermería Clínica Aplicada');
INSERT INTO departamentos (id_facultad, nombre) VALUES (5, 'Departamento de Fisiología');
INSERT INTO departamentos (id_facultad, nombre) VALUES (5, 'Departamento de Microbiología y Patología');
INSERT INTO departamentos (id_facultad, nombre) VALUES (6, 'Departamento de Salud Pública');
INSERT INTO departamentos (id_facultad, nombre) VALUES (6, 'Departamento de Psicología Aplicada');
INSERT INTO departamentos (id_facultad, nombre) VALUES (7, 'Departamento de Economía');
INSERT INTO departamentos (id_facultad, nombre) VALUES (7, 'Departamento de Políticas Públicas');
INSERT INTO departamentos (id_facultad, nombre) VALUES (8, 'Departamento de Administración');
INSERT INTO departamentos (id_facultad, nombre) VALUES (8, 'Departamento de Mercadotecnia y Negocios Internacionales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (8, 'Departamento de Contabilidad');
INSERT INTO departamentos (id_facultad, nombre) VALUES (9, 'Departamento de Historia');
INSERT INTO departamentos (id_facultad, nombre) VALUES (9, 'Departamento de Letras');
INSERT INTO departamentos (id_facultad, nombre) VALUES (10, 'Departamento de Sociología');
INSERT INTO departamentos (id_facultad, nombre) VALUES (10, 'Departamento de Antropología');
INSERT INTO departamentos (id_facultad, nombre) VALUES (11, 'Departamento de Derecho');
INSERT INTO departamentos (id_facultad, nombre) VALUES (12, 'Departamento de Proyectos Arquitectónicos');
INSERT INTO departamentos (id_facultad, nombre) VALUES (12, 'Departamento de Urbanismo');
INSERT INTO departamentos (id_facultad, nombre) VALUES (13, 'Departamento de Diseño');
INSERT INTO departamentos (id_facultad, nombre) VALUES (13, 'Departamento de Artes Visuales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (14, 'Departamento de Botánica y Zoología');
INSERT INTO departamentos (id_facultad, nombre) VALUES (14, 'Departamento de Ciencias Ambientales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (15, 'Departamento de Producción Agrícola');
INSERT INTO departamentos (id_facultad, nombre) VALUES (15, 'Departamento de Medicina Veterinaria y Zootecnia');
INSERT INTO departamentos (id_facultad, nombre) VALUES (16, 'Departamento de Ciencias Agrícolas y Pecuarias');
INSERT INTO departamentos (id_facultad, nombre) VALUES (16, 'Departamento de Ingenierías');
INSERT INTO departamentos (id_facultad, nombre) VALUES (17, 'Departamento de Ciencias Sociales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (17, 'Departamento de Estudios Económico-Administrativos');
INSERT INTO departamentos (id_facultad, nombre) VALUES (18, 'Departamento de Ciencias Naturales y Exactas');
INSERT INTO departamentos (id_facultad, nombre) VALUES (18, 'Departamento de Ingenierías');
INSERT INTO departamentos (id_facultad, nombre) VALUES (19, 'Departamento de Estudios Organizacionales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (19, 'Departamento de Ciencias Sociales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (20, 'Departamento de Ciencias Computacionales e Ingeniería');
INSERT INTO departamentos (id_facultad, nombre) VALUES (20, 'Departamento de Ciencias Exactas');
INSERT INTO departamentos (id_facultad, nombre) VALUES (21, 'Departamento de Turismo');
INSERT INTO departamentos (id_facultad, nombre) VALUES (21, 'Departamento de Administración');
INSERT INTO departamentos (id_facultad, nombre) VALUES (22, 'Departamento de Ecología y Recursos Naturales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (22, 'Departamento de Producción Agrícola');
INSERT INTO departamentos (id_facultad, nombre) VALUES (23, 'Departamento de Estudios Sociales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (23, 'Departamento de Administración');
INSERT INTO departamentos (id_facultad, nombre) VALUES (24, 'Departamento de Ciencias Económicas');
INSERT INTO departamentos (id_facultad, nombre) VALUES (24, 'Departamento de Ciencias Sociales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (25, 'Departamento de Ingeniería Industrial');
INSERT INTO departamentos (id_facultad, nombre) VALUES (25, 'Departamento de Computación');
INSERT INTO departamentos (id_facultad, nombre) VALUES (26, 'Departamento de Ciencias Sociales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (26, 'Departamento de Educación');
INSERT INTO departamentos (id_facultad, nombre) VALUES (27, 'Departamento de Ciencias Ambientales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (27, 'Departamento de Ingenierías');
INSERT INTO departamentos (id_facultad, nombre) VALUES (28, 'Departamento de Ciencias Sociales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (28, 'Departamento de Educación');
INSERT INTO departamentos (id_facultad, nombre) VALUES (29, 'Departamento de Ciencias Naturales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (29, 'Departamento de Ingeniería');
INSERT INTO departamentos (id_facultad, nombre) VALUES (30, 'Departamento de Ingeniería Mecatrónica');
INSERT INTO departamentos (id_facultad, nombre) VALUES (30, 'Departamento de Computación');
INSERT INTO departamentos (id_facultad, nombre) VALUES (31, 'Departamento de Administración');
INSERT INTO departamentos (id_facultad, nombre) VALUES (31, 'Departamento de Derecho');
INSERT INTO departamentos (id_facultad, nombre) VALUES (32, 'Departamento de Ciencias Computacionales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (32, 'Departamento de Ciencias Naturales');
INSERT INTO departamentos (id_facultad, nombre) VALUES (33, 'Departamento de Estudios Económico-Administrativos');
INSERT INTO departamentos (id_facultad, nombre) VALUES (33, 'Departamento de Ciencias Sociales');

-- 4. programas_academicos
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (1, 'Ingeniería en Computación', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (1, 'Ingeniería Informática', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (1, 'Ingeniería en Ciencia de Datos', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (1, 'Maestría en Ciencias de la Computación', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (1, 'Doctorado en Ciencias de la Computación', 'Doctorado');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (2, 'Ingeniería en Comunicaciones y Electrónica', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (2, 'Ingeniería Biomédica', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (2, 'Maestría en Ciencias en Ingeniería Electrónica', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (3, 'Licenciatura en Física', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (3, 'Maestría en Ciencias en Física', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (3, 'Doctorado en Ciencias en Física', 'Doctorado');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (4, 'Licenciatura en Matemáticas', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (4, 'Maestría en Matemáticas Aplicadas', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (4, 'Doctorado en Matemáticas Aplicadas', 'Doctorado');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (5, 'Licenciatura en Química', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (5, 'Maestría en Ciencias en Química', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (5, 'Doctorado en Ciencias en Química', 'Doctorado');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (6, 'Licenciatura en Químico Farmacobiólogo', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (6, 'Maestría en Farmacología', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (7, 'Ingeniería Química', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (7, 'Ingeniería en Alimentos y Biotecnología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (7, 'Maestría en Ciencias en Ingeniería Química', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (7, 'Doctorado en Ciencias en Ingeniería Química', 'Doctorado');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (8, 'Ingeniería Industrial', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (8, 'Maestría en Ciencias en Ingeniería Industrial', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (9, 'Ingeniería Mecánica Eléctrica', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (9, 'Ingeniería en Mecatrónica', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (9, 'Ingeniería en Robótica', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (9, 'Maestría en Ciencias en Ingeniería Mecánica', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (10, 'Ingeniería Civil', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (10, 'Ingeniería Topográfica', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (10, 'Maestría en Ciencias de la Ingeniería Civil', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (11, 'Maestría en Administración de Proyectos', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (11, 'Doctorado en Ingeniería de Proyectos', 'Doctorado');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (12, 'Licenciatura en Médico Cirujano y Partero', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (12, 'Maestría en Ciencias Médicas', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (13, 'Licenciatura en Enfermería', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (13, 'Maestría en Ciencias de la Enfermería', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (14, 'Licenciatura en Nutrición', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (14, 'Maestría en Nutrición Clínica', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (15, 'Maestría en Microbiología Médica', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (15, 'Doctorado en Ciencias Biomédicas', 'Doctorado');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (16, 'Licenciatura en Cultura Física y Deportes', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (16, 'Maestría en Salud Pública', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (16, 'Doctorado en Salud Pública', 'Doctorado');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (17, 'Licenciatura en Psicología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (17, 'Maestría en Psicología de la Salud', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (18, 'Licenciatura en Economía', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (18, 'Maestría en Economía', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (18, 'Doctorado en Economía', 'Doctorado');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (19, 'Licenciatura en Gestión Pública', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (19, 'Maestría en Políticas Públicas', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (20, 'Licenciatura en Administración', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (20, 'Maestría en Administración de Negocios', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (20, 'Doctorado en Ciencias de la Administración', 'Doctorado');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (21, 'Licenciatura en Mercadotecnia', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (21, 'Licenciatura en Negocios Internacionales', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (22, 'Licenciatura en Contaduría Pública', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (22, 'Maestría en Finanzas', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (23, 'Licenciatura en Historia', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (23, 'Maestría en Historia de México', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (24, 'Licenciatura en Letras Hispánicas', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (24, 'Maestría en Literatura Mexicana', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (25, 'Licenciatura en Sociología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (25, 'Doctorado en Ciencias Sociales', 'Doctorado');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (26, 'Licenciatura en Antropología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (27, 'Licenciatura en Derecho', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (27, 'Maestría en Derecho', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (28, 'Licenciatura en Arquitectura', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (28, 'Maestría en Arquitectura', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (29, 'Licenciatura en Urbanismo', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (29, 'Maestría en Diseño Urbano', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (30, 'Licenciatura en Diseño Industrial', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (30, 'Licenciatura en Diseño de Interiores', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (31, 'Licenciatura en Artes Visuales', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (32, 'Licenciatura en Biología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (32, 'Maestría en Ciencias Biológicas', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (33, 'Licenciatura en Gestión Ambiental', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (34, 'Ingeniería en Agronomía', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (34, 'Maestría en Ciencias Agrícolas', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (35, 'Licenciatura en Medicina Veterinaria y Zootecnia', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (35, 'Maestría en Ciencias Veterinarias', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (36, 'Licenciatura en Medicina Veterinaria y Zootecnia', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (36, 'Ingeniería en Agronegocios', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (37, 'Ingeniería en Computación', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (37, 'Ingeniería Industrial', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (38, 'Licenciatura en Psicología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (38, 'Licenciatura en Derecho', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (39, 'Licenciatura en Administración', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (39, 'Licenciatura en Contaduría Pública', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (40, 'Ingeniería en Nanotecnología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (40, 'Licenciatura en Química Farmacéutica', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (41, 'Ingeniería en Computación', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (41, 'Ingeniería en Alimentos', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (42, 'Licenciatura en Administración', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (42, 'Licenciatura en Contaduría Pública', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (43, 'Licenciatura en Derecho', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (43, 'Licenciatura en Psicología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (44, 'Ingeniería en Telemática', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (44, 'Ingeniería en Computación', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (45, 'Licenciatura en Física', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (45, 'Licenciatura en Matemáticas', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (46, 'Licenciatura en Turismo', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (46, 'Maestría en Gestión Turística', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (47, 'Licenciatura en Negocios Internacionales', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (47, 'Licenciatura en Administración', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (48, 'Licenciatura en Biología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (48, 'Licenciatura en Gestión Ambiental', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (49, 'Ingeniería en Agronomía', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (49, 'Licenciatura en Nutrición', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (50, 'Licenciatura en Derecho', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (50, 'Licenciatura en Psicología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (51, 'Licenciatura en Administración', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (51, 'Licenciatura en Turismo', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (52, 'Licenciatura en Economía', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (52, 'Licenciatura en Contaduría Pública', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (53, 'Licenciatura en Derecho', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (53, 'Licenciatura en Psicología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (54, 'Ingeniería Industrial', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (54, 'Ingeniería Mecánica Eléctrica', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (55, 'Ingeniería en Computación', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (55, 'Maestría en Tecnologías de la Información', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (56, 'Licenciatura en Trabajo Social', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (56, 'Licenciatura en Derecho', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (57, 'Licenciatura en Educación', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (57, 'Maestría en Educación', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (58, 'Licenciatura en Gestión Ambiental', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (58, 'Licenciatura en Biología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (59, 'Ingeniería en Computación', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (59, 'Ingeniería Industrial', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (60, 'Licenciatura en Derecho', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (60, 'Licenciatura en Trabajo Social', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (61, 'Licenciatura en Educación', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (61, 'Maestría en Educación', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (62, 'Licenciatura en Biología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (62, 'Licenciatura en Química Farmacéutica', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (63, 'Ingeniería en Computación', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (63, 'Ingeniería Industrial', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (64, 'Ingeniería en Mecatrónica', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (64, 'Ingeniería en Robótica', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (65, 'Ingeniería en Computación', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (65, 'Ingeniería en Ciencia de Datos', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (66, 'Licenciatura en Administración', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (66, 'Licenciatura en Mercadotecnia', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (67, 'Licenciatura en Derecho', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (67, 'Maestría en Derecho', 'Maestria');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (68, 'Ingeniería en Computación', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (68, 'Ingeniería en Telemática', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (69, 'Licenciatura en Biología', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (69, 'Licenciatura en Química', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (70, 'Licenciatura en Administración', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (70, 'Licenciatura en Contaduría Pública', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (71, 'Licenciatura en Derecho', 'Licenciatura');
INSERT INTO programas_academicos (id_departamento, nombre, nivel) VALUES (71, 'Licenciatura en Psicología', 'Licenciatura');

-- 5. UPDATE masivo: campus con facultades pero sin dirección capturada
UPDATE campus c
SET direccion = 'Dirección pendiente de captura - ' || c.ciudad
WHERE c.direccion IS NULL
  AND EXISTS (
      SELECT 1
      FROM facultades f
      WHERE f.id_campus = c.id_campus
  );

-- 6. Transacción: nueva división de CUCEI con su departamento y su posgrado
BEGIN;

INSERT INTO facultades (id_campus, nombre)
SELECT c.id_campus, 'División de Tecnologías Emergentes'
FROM campus c
WHERE c.nombre = 'Centro Universitario de Ciencias Exactas e Ingenierías (CUCEI)';

INSERT INTO departamentos (id_facultad, nombre)
SELECT f.id_facultad, 'Departamento de Inteligencia Artificial'
FROM facultades f
INNER JOIN campus c ON c.id_campus = f.id_campus
WHERE c.nombre = 'Centro Universitario de Ciencias Exactas e Ingenierías (CUCEI)'
  AND f.nombre = 'División de Tecnologías Emergentes';

INSERT INTO programas_academicos (id_departamento, nombre, nivel)
SELECT d.id_departamento, 'Maestría en Inteligencia Artificial', 'Maestria'
FROM departamentos d
INNER JOIN facultades f ON f.id_facultad = d.id_facultad
INNER JOIN campus c ON c.id_campus = f.id_campus
WHERE c.nombre = 'Centro Universitario de Ciencias Exactas e Ingenierías (CUCEI)'
  AND f.nombre = 'División de Tecnologías Emergentes'
  AND d.nombre = 'Departamento de Inteligencia Artificial';

COMMIT;
