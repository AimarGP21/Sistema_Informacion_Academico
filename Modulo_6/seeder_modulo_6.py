# Seeder del Módulo 6 (Evaluaciones y Calificaciones). Genera DML_Modulo_6.sql
# Uso: python seeder_modulo_6.py
# Requiere cargados Módulo 4 (estudiantes) y Módulo 5 (grupos_clase, inscripciones_materias)

import os
import random
from datetime import date

SEMILLA = 20261106
random.seed(SEMILLA)

output_filename = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'DML_Modulo_6.sql')

# 1. Catálogo de tipos de evaluación
TIPOS_EVALUACION = [
    ('Primer Parcial', 'Evaluación teórica/práctica del primer tercio del curso'),
    ('Segundo Parcial', 'Evaluación teórica/práctica del segundo tercio del curso'),
    ('Examen Final', 'Evaluación integral ordinaria al cierre del ciclo'),
    ('Tareas y Proyectos', 'Evaluación continua de entregables, prácticas y tareas'),
    ('Examen Extraordinario', 'Evaluación de recuperación para estudiantes no acreditados')
]

# Parámetros simulación basados en Módulo 5 (180 grupos en total distribuidos en 6 ciclos)
TOTAL_GRUPOS = 180
TOTAL_ESTUDIANTES = 58

COMENTARIOS_EVAL_DOCENTE = [
    'Excelente explicacion y dominio de los temas.',
    'Puntual y siempre aclara dudas en clase.',
    'El ritmo de la clase fue algo acelerado pero buen material.',
    'Muy buen docente, evalua con justicia.',
    'Falta mejorar la retroalimentacion de las tareas.',
    'Clases muy practicas y dinámicas.'
]

with open(output_filename, 'w', encoding='utf-8') as f:
    f.write("-- DML Módulo 6: Evaluaciones y Calificaciones (generado con seeder_modulo_6.py)\n")
    f.write("-- Ejecutar después de los Módulos 1, 2, 3, 4 y 5\n\n")

    # 1. Insert Tipos de Evaluación
    f.write("-- 1. tipos_evaluacion\n")
    for nombre, desc in TIPOS_EVALUACION:
        f.write(f"INSERT INTO tipos_evaluacion (nombre, descripcion) VALUES ('{nombre}', '{desc}');\n")
    f.write("\n")

    # 2. Insert Esquemas de Evaluación por Grupo (Parcial 1: 30%, Parcial 2: 30%, Proyectos: 40%)
    f.write("-- 2. esquemas_evaluacion\n")
    id_esquema_count = 1
    esquemas_por_grupo = {}
    for g_id in range(1, TOTAL_GRUPOS + 1):
        esquemas_por_grupo[g_id] = []
        
        # Rubro 1: Primer Parcial (30%)
        f.write(f"INSERT INTO esquemas_evaluacion (id_grupo, id_tipo_evaluacion, porcentaje, fecha_evaluacion) VALUES ({g_id}, 1, 30.00, '2026-03-15');\n")
        esquemas_por_grupo[g_id].append(id_esquema_count)
        id_esquema_count += 1
        
        # Rubro 2: Segundo Parcial (30%)
        f.write(f"INSERT INTO esquemas_evaluacion (id_grupo, id_tipo_evaluacion, porcentaje, fecha_evaluacion) VALUES ({g_id}, 2, 30.00, '2026-04-20');\n")
        esquemas_por_grupo[g_id].append(id_esquema_count)
        id_esquema_count += 1

        # Rubro 3: Tareas y Proyectos (40%)
        f.write(f"INSERT INTO esquemas_evaluacion (id_grupo, id_tipo_evaluacion, porcentaje, fecha_evaluacion) VALUES ({g_id}, 4, 40.00, '2026-05-20');\n")
        esquemas_por_grupo[g_id].append(id_esquema_count)
        id_esquema_count += 1
    f.write("\n")

    # 3. Insert Calificaciones por Estudiante e Inscripción
    f.write("-- 3. calificaciones_evaluacion\n")
    for g_id in range(1, TOTAL_GRUPOS + 1):
        # Muestreo de estudiantes por grupo (simulando inscritos del Módulo 5)
        num_alumnos = random.randint(12, 25)
        alumnos_grupo = random.sample(range(1, TOTAL_ESTUDIANTES + 1), num_alumnos)
        
        for est_id in alumnos_grupo:
            for esq_id in esquemas_por_grupo[g_id]:
                calif = round(min(10.0, max(5.0, random.gauss(8.2, 1.3))), 2)
                f.write(
                    f"INSERT INTO calificaciones_evaluacion (id_estudiante, id_grupo, id_esquema, calificacion, fecha_registro) "
                    f"VALUES ({est_id}, {g_id}, {esq_id}, {calif}, '2026-05-25');\n"
                )
    f.write("\n")

    # 4. Insert Actas de Calificaciones
    f.write("-- 4. actas_calificaciones\n")
    for g_id in range(1, TOTAL_GRUPOS + 1):
        # Los grupos de ciclos pasados (1 a 150) están cerrados; ciclo activo (151 a 180) en borrador
        estatus = 'cerrada' if g_id <= 150 else 'borrador'
        obs = 'Acta ordinaria validada por departamento' if estatus == 'cerrada' else 'Captura de calificaciones en proceso'
        f.write(
            f"INSERT INTO actas_calificaciones (id_grupo, fecha_cierre, estatus_acta, observaciones) "
            f"VALUES ({g_id}, '2026-05-30 18:00:00', '{estatus}', '{obs}');\n"
        )
    f.write("\n")

    # 5. Insert Evaluaciones Docentes
    f.write("-- 5. evaluaciones_docentes\n")
    for g_id in range(1, 151): # Evaluaciones de grupos concluidos
        num_evals = random.randint(8, 15)
        alumnos_eval = random.sample(range(1, TOTAL_ESTUDIANTES + 1), num_evals)
        for est_id in alumnos_eval:
            p_dom = random.choices([3, 4, 5], weights=[10, 40, 50])[0]
            p_ped = random.choices([3, 4, 5], weights=[15, 45, 40])[0]
            p_pun = random.choices([3, 4, 5], weights=[5, 30, 65])[0]
            com = random.choice(COMENTARIOS_EVAL_DOCENTE)
            f.write(
                f"INSERT INTO evaluaciones_docentes (id_estudiante, id_grupo, puntaje_dominio_materia, puntaje_pedagogia, puntaje_puntualidad, comentarios, fecha_evaluacion) "
                f"VALUES ({est_id}, {g_id}, {p_dom}, {p_ped}, {p_pun}, '{com}', '2026-05-28');\n"
            )
    f.write("\n")

    # 6. Transacción: Apertura de evaluación extraordinaria y cierre de acta
    f.write(
        "-- 6. Transacción: Registro de calificación extraordinaria y cierre oficial de acta extemporánea\n"
        "BEGIN;\n\n"
        "INSERT INTO esquemas_evaluacion (id_grupo, id_tipo_evaluacion, porcentaje, fecha_evaluacion)\n"
        "VALUES (151, 5, 100.00, '2026-06-10');\n\n"
        "INSERT INTO calificaciones_evaluacion (id_estudiante, id_grupo, id_esquema, calificacion, fecha_registro)\n"
        "SELECT 1, 151, currval('esquemas_evaluacion_id_esquema_seq'), 8.50, '2026-06-11';\n\n"
        "UPDATE actas_calificaciones\n"
        "SET estatus_acta = 'extemporanea',\n"
        "    observaciones = 'Acta cerrada con resolucion de examen extraordinario'\n"
        "WHERE id_grupo = 151;\n\n"
        "COMMIT;\n"
    )

print(f"Archivo generado exitosamente: {output_filename}")