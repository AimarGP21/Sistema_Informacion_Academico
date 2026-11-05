-- DML Módulo 6: Evaluaciones y Calificaciones (generado con seeder_modulo_6.py)
-- Ejecutar después de los Módulos 1, 2, 3, 4 y 5

-- 1. tipos_evaluacion
INSERT INTO tipos_evaluacion (nombre, descripcion) VALUES ('Primer Parcial', 'Evaluación teórica/práctica del primer tercio del curso');
INSERT INTO tipos_evaluacion (nombre, descripcion) VALUES ('Segundo Parcial', 'Evaluación teórica/práctica del segundo tercio del curso');
INSERT INTO tipos_evaluacion (nombre, descripcion) VALUES ('Examen Final', 'Evaluación integral ordinaria al cierre del ciclo');
INSERT INTO tipos_evaluacion (nombre, descripcion) VALUES ('Tareas y Proyectos', 'Evaluación continua de entregables, prácticas y tareas');
INSERT INTO tipos_evaluacion (nombre, descripcion) VALUES ('Examen Extraordinario', 'Evaluación de recuperación para estudiantes no acreditados');

-- 2. esquemas_evaluacion (Muestra representativa de inserción por grupos)
INSERT INTO esquemas_evaluacion (id_grupo, id_tipo_evaluacion, porcentaje, fecha_evaluacion) VALUES (1, 1, 30.00, '2026-03-15');
INSERT INTO esquemas_evaluacion (id_grupo, id_tipo_evaluacion, porcentaje, fecha_evaluacion) VALUES (1, 2, 30.00, '2026-04-20');
INSERT INTO esquemas_evaluacion (id_grupo, id_tipo_evaluacion, porcentaje, fecha_evaluacion) VALUES (1, 4, 40.00, '2026-05-20');
INSERT INTO esquemas_evaluacion (id_grupo, id_tipo_evaluacion, porcentaje, fecha_evaluacion) VALUES (2, 1, 30.00, '2026-03-15');
INSERT INTO esquemas_evaluacion (id_grupo, id_tipo_evaluacion, porcentaje, fecha_evaluacion) VALUES (2, 2, 30.00, '2026-04-20');
INSERT INTO esquemas_evaluacion (id_grupo, id_tipo_evaluacion, porcentaje, fecha_evaluacion) VALUES (2, 4, 40.00, '2026-05-20');

-- 3. calificaciones_evaluacion
INSERT INTO calificaciones_evaluacion (id_estudiante, id_grupo, id_esquema, calificacion, fecha_registro) VALUES (1, 1, 1, 8.50, '2026-05-25');
INSERT INTO calificaciones_evaluacion (id_estudiante, id_grupo, id_esquema, calificacion, fecha_registro) VALUES (1, 1, 2, 9.00, '2026-05-25');
INSERT INTO calificaciones_evaluacion (id_estudiante, id_grupo, id_esquema, calificacion, fecha_registro) VALUES (1, 1, 3, 9.50, '2026-05-25');
INSERT INTO calificaciones_evaluacion (id_estudiante, id_grupo, id_esquema, calificacion, fecha_registro) VALUES (2, 1, 1, 7.00, '2026-05-25');
INSERT INTO calificaciones_evaluacion (id_estudiante, id_grupo, id_esquema, calificacion, fecha_registro) VALUES (2, 1, 2, 6.50, '2026-05-25');
INSERT INTO calificaciones_evaluacion (id_estudiante, id_grupo, id_esquema, calificacion, fecha_registro) VALUES (2, 1, 3, 8.00, '2026-05-25');

-- 4. actas_calificaciones
INSERT INTO actas_calificaciones (id_grupo, fecha_cierre, estatus_acta, observaciones) VALUES (1, '2026-05-30 18:00:00', 'cerrada', 'Acta ordinaria validada por departamento');
INSERT INTO actas_calificaciones (id_grupo, fecha_cierre, estatus_acta, observaciones) VALUES (2, '2026-05-30 18:00:00', 'cerrada', 'Acta ordinaria validada por departamento');
INSERT INTO actas_calificaciones (id_grupo, fecha_cierre, estatus_acta, observaciones) VALUES (151, '2026-08-15 10:00:00', 'borrador', 'Captura de calificaciones en proceso');

-- 5. evaluaciones_docentes
INSERT INTO evaluaciones_docentes (id_estudiante, id_grupo, puntaje_dominio_materia, puntaje_pedagogia, puntaje_puntualidad, comentarios, fecha_evaluacion) 
VALUES (1, 1, 5, 5, 5, 'Excelente explicacion y dominio de los temas.', '2026-05-28');
INSERT INTO evaluaciones_docentes (id_estudiante, id_grupo, puntaje_dominio_materia, puntaje_pedagogia, puntaje_puntualidad, comentarios, fecha_evaluacion) 
VALUES (2, 1, 4, 4, 5, 'Puntual y siempre aclara dudas en clase.', '2026-05-28');

-- 6. Transacción: Registro de calificación extraordinaria y cierre oficial de acta extemporánea
BEGIN;

INSERT INTO esquemas_evaluacion (id_grupo, id_tipo_evaluacion, porcentaje, fecha_evaluacion)
VALUES (151, 5, 100.00, '2026-06-10');

INSERT INTO calificaciones_evaluacion (id_estudiante, id_grupo, id_esquema, calificacion, fecha_registro)
SELECT 1, 151, currval('esquemas_evaluacion_id_esquema_seq'), 8.50, '2026-06-11';

UPDATE actas_calificaciones
SET estatus_acta = 'extemporanea',
    observaciones = 'Acta cerrada con resolucion de examen extraordinario'
WHERE id_grupo = 151;

COMMIT;