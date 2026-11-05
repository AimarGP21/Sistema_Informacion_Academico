-- DML Módulo 4: Alumnos y matrícula (generado con seeder_modulo_4.py)
-- Ejecutar después de los Módulos 1 y 2, sobre tablas recién creadas

-- 1. cohortes
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2016-A', 2016);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2016-B', 2016);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2017-A', 2017);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2017-B', 2017);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2018-A', 2018);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2018-B', 2018);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2019-A', 2019);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2019-B', 2019);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2020-A', 2020);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2020-B', 2020);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2021-A', 2021);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2021-B', 2021);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2022-A', 2022);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2022-B', 2022);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2023-A', 2023);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2023-B', 2023);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2024-A', 2024);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2024-B', 2024);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2025-A', 2025);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2025-B', 2025);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2026-A', 2026);
INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('2026-B', 2026);

-- 2. estudiantes
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('223983043', 'Salma', 'Fuentes Medrano', 'activo', 1, 2, 15);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('223716362', 'Beatriz', 'Samaniego Villareal', 'activo', 7, 30, 15);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225116502', 'Alfredo', 'Gil Ontiveros', 'activo', 8, 18, 19);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225557580', 'Adalberto', 'Toro Villa', 'activo', 10, 29, 20);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225330879', 'Reina', 'Benavides Reyna', 'baja_definitiva', 11, 3, 19);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225867863', 'Blanca', 'Anaya Rangel', 'activo', 12, 15, 20);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('224696135', 'Javier', 'Trujillo Rodríguez', 'activo', 13, 26, 17);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('223938288', 'Octavio', 'Carrillo Lira', 'activo', 14, 4, 16);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('219083288', 'Serafín', 'Galindo Carranza', 'egresado', 15, 18, 7);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('226233582', 'Adela', 'Urbina Santacruz', 'activo', 16, 28, 22);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225623748', 'Itzel', 'Sotelo Salcido', 'activo', 17, 3, 19);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('224112452', 'Carmen', 'Tapia Razo', 'activo', 18, 1, 18);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('224568111', 'Zeferino', 'Durán Peña', 'activo', 20, 24, 17);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225644905', 'Manuel', 'Corrales Zayas', 'activo', 21, 3, 19);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('220172090', 'Mario', 'Arce Tejada', 'egresado', 22, 12, 9);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('219153285', 'Abigail', 'Salcedo Sierra', 'egresado', 25, 3, 8);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('226439168', 'Alberto', 'Segura Montoya', 'activo', 26, 7, 22);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('222482685', 'Isabel', 'Olivárez Quesada', 'activo', 27, 28, 14);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('226841638', 'Julio', 'Gurule Solís', 'activo', 28, 2, 22);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('221999518', 'Alberto', 'Soto Rico', 'egresado', 29, 2, 12);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('223683664', 'Luz', 'Garibay Ureña', 'activo', 32, 12, 15);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225521641', 'Wilfrido', 'Quesada Arenas', 'activo', 33, 13, 20);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('223303293', 'Fernando', 'Sarabia Cardenas', 'egresado', 34, 4, 15);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('219185059', 'Ana Luisa', 'Puente Cintrón', 'baja_definitiva', 35, 26, 8);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225186049', 'Magdalena', 'Adame Holguín', 'activo', 37, 1, 20);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('224236552', 'Perla', 'Nieto Barajas', 'egresado', 39, 32, 18);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225935551', 'Joaquín', 'Bétancourt Nazario', 'activo', 41, 33, 19);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225218292', 'Zacarías', 'Pedraza Guajardo', 'activo', 43, 6, 20);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('222177994', 'Estefanía', 'Garica de Jesús', 'egresado', 44, 31, 13);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('223670481', 'Felix', 'Loya García', 'activo', 47, 27, 15);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225535273', 'Salma', 'Olivares Bustos', 'baja_definitiva', 48, 1, 20);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('224103355', 'Noemí', 'Villanueva Tafoya', 'activo', 49, 27, 17);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('222295137', 'Gerónimo', 'Toledo Olvera', 'egresado', 51, 12, 13);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('221146713', 'Eugenio', 'Valladares Valdés', 'egresado', 59, 2, 11);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('224690457', 'Rebeca', 'Véliz Hernandes', 'activo', 60, 21, 17);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225034824', 'Fidel', 'Pantoja Ferrer', 'activo', 61, 30, 19);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('222139174', 'Norma', 'Marrero Zepeda', 'egresado', 62, 3, 13);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('222818180', 'Susana', 'Gracia Madrigal', 'egresado', 65, 23, 13);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('224760432', 'Úrsula', 'Toro Figueroa', 'activo', 66, 31, 17);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('226605228', 'Abigail', 'Robles Valadez', 'baja_definitiva', 67, 19, 22);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('226262820', 'Lilia', 'Aparicio Briseño', 'baja_temporal', 68, 16, 22);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225764495', 'Joaquín', 'Abreu Madrid', 'activo', 69, 20, 20);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('223643335', 'Alfonso', 'Ruiz de León', 'baja_definitiva', 73, 6, 16);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('221009319', 'Gerardo', 'Ortega López', 'egresado', 75, 20, 12);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('226834388', 'Vicente', 'de Anda Alarcón', 'activo', 76, 27, 22);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('223660886', 'Héctor', 'Jaime Adame', 'activo', 77, 1, 16);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('224929804', 'Cornelio', 'Laboy Ulibarri', 'activo', 79, 6, 17);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('223558626', 'Estela', 'Rivero Irizarry', 'activo', 80, 1, 16);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('226706809', 'Graciela', 'Concepción Caldera', 'activo', 81, 24, 22);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('220124863', 'Estela', 'Osorio Lara', 'egresado', 82, 15, 10);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('223278371', 'Jorge Luis', 'López Peralta', 'activo', 83, 1, 16);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225379167', 'Daniel', 'Alvarez Loya', 'activo', 86, 3, 20);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('225732395', 'Leonel', 'Muñiz Esquivel', 'baja_temporal', 88, 1, 19);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('220254167', 'Ramón', 'Rincón Montes', 'egresado', 90, 28, 10);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('222311885', 'Julio César', 'Varela Godoy', 'baja_definitiva', 91, 18, 13);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('222036264', 'Adán', 'Aguayo Matías', 'activo', 94, 26, 14);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('219076653', 'Adela', 'Medina Almonte', 'egresado', 96, 18, 8);
INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) VALUES ('224289082', 'Juan', 'Estrada Caldera', 'activo', 97, 6, 18);

-- 3. expedientes_academicos (uno por estudiante)
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (280, 9.01, 1);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (307, 7.89, 2);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (122, 8.39, 3);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (47, 8.99, 4);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (43, 9.74, 5);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (82, 8.18, 6);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (210, 8.59, 7);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (91, 9.01, 8);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 8.69, 9);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (0, 0.00, 10);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (121, 8.39, 11);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (171, 8.16, 12);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (207, 8.19, 13);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (132, 8.49, 14);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 8.47, 15);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 9.21, 16);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (0, 0.00, 17);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (345, 7.66, 18);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (0, 0.00, 19);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 7.68, 20);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (283, 7.40, 21);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (48, 8.18, 22);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (100, 7.68, 23);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (0, 0.00, 24);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (86, 8.84, 25);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (100, 8.62, 26);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (71, 8.33, 27);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (80, 8.92, 28);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 9.94, 29);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (305, 9.02, 30);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (42, 8.37, 31);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (205, 9.16, 32);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 7.94, 33);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 8.37, 34);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (200, 7.65, 35);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (128, 9.30, 36);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 9.40, 37);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (160, 7.76, 38);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (200, 8.13, 39);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (0, 0.00, 40);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (0, 0.00, 41);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (82, 8.64, 42);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (43, 8.77, 43);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 8.61, 44);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (0, 0.00, 45);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (246, 9.10, 46);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (215, 8.41, 47);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (250, 7.45, 48);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (0, 0.00, 49);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 7.75, 50);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (262, 8.82, 51);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (86, 7.75, 52);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (42, 7.79, 53);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 8.26, 54);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (211, 8.19, 55);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (340, 8.63, 56);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (400, 8.27, 57);
INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) VALUES (164, 8.34, 58);

-- 4. becas_asignadas
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2024-02-01', '2024-12-31', 1);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Movilidad Estudiantil', 30, '2024-02-01', '2024-06-30', 1);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 40, '2024-08-01', '2024-12-31', 1);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2026-02-01', NULL, 1);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 40, '2024-08-01', '2025-12-31', 2);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 10, '2026-02-01', NULL, 2);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 15, '2025-02-01', '2026-06-30', 3);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2025-02-01', '2025-12-31', 3);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 20, '2025-08-01', '2025-12-31', 3);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Posgrado', 100, '2025-08-01', '2025-12-31', 4);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2025-08-01', '2026-06-30', 4);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Posgrado', 75, '2026-02-01', NULL, 4);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 20, '2026-08-01', NULL, 4);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2025-02-01', '2025-12-31', 5);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 10, '2025-08-01', NULL, 5);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 100, '2025-08-01', NULL, 5);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 20, '2026-02-01', NULL, 6);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 20, '2024-08-01', '2025-06-30', 7);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Movilidad Estudiantil', 30, '2024-08-01', '2025-12-31', 7);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2026-02-01', '2026-06-30', 8);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 20, '2023-02-01', NULL, 9);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2026-08-01', NULL, 10);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2026-08-01', NULL, 10);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 20, '2025-02-01', '2025-06-30', 11);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 100, '2025-08-01', '2026-06-30', 11);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 40, '2024-08-01', '2025-06-30', 12);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 100, '2025-02-01', '2026-06-30', 12);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 20, '2024-02-01', '2024-06-30', 13);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 40, '2024-08-01', '2025-06-30', 13);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2026-02-01', NULL, 13);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2026-08-01', NULL, 13);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 20, '2026-08-01', NULL, 13);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 40, '2026-02-01', NULL, 14);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2026-02-01', NULL, 14);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 20, '2021-02-01', '2021-12-31', 15);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 50, '2022-02-01', '2023-06-30', 15);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 20, '2022-08-01', NULL, 15);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 10, '2024-02-01', NULL, 15);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 20, '2023-08-01', NULL, 16);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 20, '2026-08-01', NULL, 17);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2026-08-01', NULL, 17);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2022-08-01', '2023-12-31', 18);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 15, '2025-02-01', '2025-12-31', 18);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2026-08-01', NULL, 19);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Movilidad Estudiantil', 80, '2026-08-01', NULL, 19);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 20, '2026-08-01', NULL, 19);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 20, '2026-08-01', NULL, 19);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2024-08-01', '2024-12-31', 20);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 100, '2024-08-01', '2025-06-30', 20);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 40, '2025-08-01', '2026-06-30', 21);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 40, '2026-02-01', NULL, 21);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2023-08-01', '2024-06-30', 23);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Movilidad Estudiantil', 80, '2019-08-01', '2019-12-31', 24);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 15, '2025-08-01', '2026-06-30', 25);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Excelencia Académica', 100, '2026-02-01', '2026-06-30', 25);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2024-08-01', '2025-06-30', 26);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 40, '2024-08-01', '2024-12-31', 26);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Posgrado', 50, '2025-08-01', '2026-06-30', 26);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 50, '2026-02-01', '2026-06-30', 26);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 40, '2025-08-01', '2025-12-31', 27);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2025-08-01', '2026-06-30', 28);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2026-02-01', NULL, 28);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 100, '2026-02-01', '2026-06-30', 28);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2022-08-01', '2023-06-30', 29);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2025-02-01', '2025-12-31', 29);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 50, '2023-08-01', '2024-06-30', 30);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Movilidad Estudiantil', 30, '2025-08-01', NULL, 31);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2026-02-01', '2026-06-30', 31);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 20, '2024-02-01', '2024-12-31', 32);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2024-02-01', '2024-06-30', 32);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 100, '2024-08-01', '2025-12-31', 32);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2025-02-01', '2025-06-30', 32);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 10, '2025-08-01', '2025-12-31', 32);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 40, '2025-08-01', NULL, 32);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2026-08-01', NULL, 32);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2025-08-01', '2026-06-30', 33);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 15, '2021-08-01', '2022-06-30', 34);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 10, '2024-02-01', '2025-06-30', 35);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2025-08-01', '2025-12-31', 35);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2026-02-01', NULL, 35);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 50, '2026-02-01', NULL, 35);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Movilidad Estudiantil', 80, '2025-02-01', '2025-12-31', 36);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 20, '2025-08-01', '2026-06-30', 36);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 50, '2026-08-01', NULL, 36);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2026-08-01', NULL, 36);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 20, '2024-02-01', NULL, 38);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Posgrado', 50, '2025-08-01', '2025-12-31', 38);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 15, '2026-08-01', NULL, 40);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2026-08-01', '2026-12-31', 40);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Posgrado', 75, '2026-08-01', '2026-12-31', 40);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 20, '2026-08-01', '2026-12-31', 41);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Posgrado', 75, '2026-08-01', '2026-12-31', 41);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Excelencia Académica', 100, '2025-08-01', NULL, 42);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 40, '2026-08-01', NULL, 42);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Excelencia Académica', 50, '2023-08-01', '2023-12-31', 43);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2024-02-01', '2024-06-30', 43);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 20, '2022-02-01', NULL, 44);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2026-08-01', NULL, 45);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 20, '2024-02-01', '2024-12-31', 46);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 10, '2024-08-01', '2024-12-31', 46);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 15, '2026-02-01', '2026-06-30', 46);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 10, '2026-02-01', '2026-06-30', 47);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2025-02-01', '2025-12-31', 48);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 20, '2025-02-01', '2025-12-31', 48);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 20, '2026-02-01', '2026-06-30', 48);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2026-02-01', '2026-06-30', 48);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2026-08-01', NULL, 48);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2026-08-01', NULL, 49);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 15, '2026-08-01', NULL, 49);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 15, '2026-08-01', NULL, 49);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 15, '2020-08-01', '2021-12-31', 50);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 20, '2023-02-01', '2023-12-31', 50);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2023-08-01', '2024-12-31', 50);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 50, '2026-08-01', NULL, 52);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 10, '2025-02-01', '2025-06-30', 53);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2025-02-01', '2025-12-31', 53);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 20, '2025-08-01', '2025-12-31', 53);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Movilidad Estudiantil', 50, '2025-08-01', '2025-12-31', 53);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2020-08-01', '2021-12-31', 54);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 20, '2021-08-01', '2022-06-30', 54);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 50, '2024-02-01', '2024-12-31', 55);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 10, '2024-08-01', '2024-12-31', 55);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Inclusión Educativa', 50, '2023-08-01', '2024-06-30', 56);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2023-08-01', '2024-06-30', 56);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 40, '2024-02-01', '2024-12-31', 56);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Deportiva', 20, '2022-08-01', '2023-12-31', 57);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Manutención', 25, '2025-02-01', '2026-06-30', 58);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca de Transporte', 15, '2025-02-01', '2025-12-31', 58);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Alimentaria', 25, '2026-02-01', NULL, 58);
INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) VALUES ('Beca Cultural', 40, '2026-08-01', NULL, 58);

-- 5. UPDATE masivo: cierra las becas abiertas de estudiantes que ya no están activos
UPDATE becas_asignadas b
SET fecha_fin = (b.fecha_inicio + INTERVAL '6 months')::date
WHERE b.fecha_fin IS NULL
  AND EXISTS (
      SELECT 1
      FROM estudiantes e
      WHERE e.id_estudiante = b.id_estudiante
        AND e.estatus_escolar IN ('baja_temporal', 'baja_definitiva', 'egresado')
  );

-- 6. Transacción: alta de un estudiante de nuevo ingreso con su expediente y su beca
BEGIN;

INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte)
SELECT '226924034', 'Juan Carlos', 'Mojica Hidalgo', 'activo', u.id_usuario, 1, c.id_cohorte
FROM usuarios u
CROSS JOIN cohortes c
WHERE u.id_usuario = 98
  AND c.nombre_cohorte = '2026-B';

INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante)
SELECT 0, 0, e.id_estudiante
FROM estudiantes e
WHERE e.matricula = '226924034';

INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante)
SELECT 'Beca de Manutención', 50, DATE '2026-08-01', NULL, e.id_estudiante
FROM estudiantes e
WHERE e.matricula = '226924034';

COMMIT;
