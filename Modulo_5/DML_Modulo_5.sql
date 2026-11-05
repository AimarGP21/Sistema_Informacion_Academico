-- DML Módulo 5: Oferta Curricular (generado con seeder_modulo_5.py)
-- Ejecutar después de los Módulos 1, 2, 3 y 4

-- 1. materias
INSERT INTO materias (clave_materia, nombre, creditos, horas_teoria, horas_practica, id_programa) VALUES ('CC100', 'Introducción a la Computación', 8, 4, 2, 1);
INSERT INTO materias (clave_materia, nombre, creditos, horas_teoria, horas_practica, id_programa) VALUES ('CC101', 'Programación Estructurada', 10, 4, 4, 1);
INSERT INTO materias (clave_materia, nombre, creditos, horas_teoria, horas_practica, id_programa) VALUES ('CC102', 'Estructuras de Datos', 10, 4, 4, 1);
INSERT INTO materias (clave_materia, nombre, creditos, horas_teoria, horas_practica, id_programa) VALUES ('CC103', 'Programación Orientada a Objetos', 10, 4, 4, 1);
INSERT INTO materias (clave_materia, nombre, creditos, horas_teoria, horas_practica, id_programa) VALUES ('CC200', 'Bases de Datos', 8, 3, 3, 1);
INSERT INTO materias (clave_materia, nombre, creditos, horas_teoria, horas_practica, id_programa) VALUES ('CC201', 'Sistemas Operativos', 8, 4, 2, 1);
INSERT INTO materias (clave_materia, nombre, creditos, horas_teoria, horas_practica, id_programa) VALUES ('CC202', 'Redes de Computadoras', 8, 3, 3, 1);
INSERT INTO materias (clave_materia, nombre, creditos, horas_teoria, horas_practica, id_programa) VALUES ('CC203', 'Ingeniería de Software', 10, 4, 2, 1);

-- 2. prerrequisitos
INSERT INTO prerrequisitos (id_materia, id_materia_prerrequisito, tipo_prerrequisito) VALUES (2, 1, 'obligatorio');
INSERT INTO prerrequisitos (id_materia, id_materia_prerrequisito, tipo_prerrequisito) VALUES (3, 2, 'obligatorio');
INSERT INTO prerrequisitos (id_materia, id_materia_prerrequisito, tipo_prerrequisito) VALUES (4, 2, 'obligatorio');
INSERT INTO prerrequisitos (id_materia, id_materia_prerrequisito, tipo_prerrequisito) VALUES (5, 3, 'obligatorio');

-- 3. ciclos_escolares
INSERT INTO ciclos_escolares (nombre_ciclo, fecha_inicio, fecha_fin, estatus) VALUES ('2024-A', '2024-01-16', '2024-05-31', 'concluido');
INSERT INTO ciclos_escolares (nombre_ciclo, fecha_inicio, fecha_fin, estatus) VALUES ('2024-B', '2024-08-12', '2024-12-15', 'concluido');
INSERT INTO ciclos_escolares (nombre_ciclo, fecha_inicio, fecha_fin, estatus) VALUES ('2025-A', '2025-01-15', '2025-05-30', 'concluido');
INSERT INTO ciclos_escolares (nombre_ciclo, fecha_inicio, fecha_fin, estatus) VALUES ('2025-B', '2025-08-11', '2025-12-16', 'concluido');
INSERT INTO ciclos_escolares (nombre_ciclo, fecha_inicio, fecha_fin, estatus) VALUES ('2026-A', '2026-01-15', '2026-05-29', 'concluido');
INSERT INTO ciclos_escolares (nombre_ciclo, fecha_inicio, fecha_fin, estatus) VALUES ('2026-B', '2026-08-10', '2026-12-18', 'activo');

-- 4. grupos_clase y 5. inscripciones_materias (generados en el archivo completo DML_Modulo_5.sql)

-- 6. Transacción: Apertura de un nuevo grupo e inscripción de un estudiante
BEGIN;

INSERT INTO grupos_clase (id_materia, id_profesor, id_ciclo, clave_grupo, aula, cupo_maximo)
VALUES (1, 1, 6, 'D09', 'Lab-CC3', 30);

INSERT INTO inscripciones_materias (id_estudiante, id_grupo, fecha_inscripcion, estatus)
SELECT 1, currval('grupos_clase_id_grupo_seq'), '2026-08-15', 'inscrito';

COMMIT;