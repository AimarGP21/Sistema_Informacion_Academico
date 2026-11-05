# Seeder del Módulo 5 (Oferta Curricular). Genera DML_Modulo_5.sql
# Uso: python seeder_modulo_5.py
# Requiere cargados Módulo 2 (programas), Módulo 3 (profesores) y Módulo 4 (estudiantes).

import os
import random
from datetime import date

SEMILLA = 20261105
random.seed(SEMILLA)

output_filename = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'DML_Modulo_5.sql')

# Catálogo de materias de cómputo y matemáticas
MATERIAS_BASE = [
    ('CC100', 'Introducción a la Computación', 8, 4, 2, 1),
    ('CC101', 'Programación Estructurada', 10, 4, 4, 1),
    ('CC102', 'Estructuras de Datos', 10, 4, 4, 1),
    ('CC103', 'Programación Orientada a Objetos', 10, 4, 4, 1),
    ('CC200', 'Bases de Datos', 8, 3, 3, 1),
    ('CC201', 'Sistemas Operativos', 8, 4, 2, 1),
    ('CC202', 'Redes de Computadoras', 8, 3, 3, 1),
    ('CC203', 'Ingeniería de Software', 10, 4, 2, 1),
    ('CC300', 'Inteligencia Artificial', 8, 4, 2, 1),
    ('CC301', 'Desarrollo Web Integral', 8, 2, 4, 1),
    ('CC302', 'Arquitectura de Computadoras', 8, 4, 2, 1),
    ('CC303', 'Seguridad de la Información', 8, 3, 3, 1),
    ('MT101', 'Cálculo Diferencial e Integral', 9, 5, 1, 2),
    ('MT102', 'Álgebra Lineal', 8, 4, 2, 2),
    ('MT201', 'Probabilidad y Estadística', 8, 4, 2, 2),
]

PRERREQUISITOS_BASE = [
    (2, 1, 'obligatorio'),  # Programación Estructurada -> Intro Computación
    (3, 2, 'obligatorio'),  # Estructuras de Datos -> Prog Estructurada
    (4, 2, 'obligatorio'),  # POO -> Prog Estructurada
    (5, 3, 'obligatorio'),  # Bases de Datos -> Estructuras de Datos
    (8, 4, 'obligatorio'),  # Ing. Software -> POO
    (9, 3, 'recomendado'),  # IA -> Estructuras de Datos
    (10, 5, 'recomendado'), # Dev Web -> Bases de Datos
    (15, 13, 'obligatorio'),# Probabilidad -> Cálculo
]

CICLOS = [
    ('2024-A', '2024-01-16', '2024-05-31', 'concluido'),
    ('2024-B', '2024-08-12', '2024-12-15', 'concluido'),
    ('2025-A', '2025-01-15', '2025-05-30', 'concluido'),
    ('2025-B', '2025-08-11', '2025-12-16', 'concluido'),
    ('2026-A', '2026-01-15', '2026-05-29', 'concluido'),
    ('2026-B', '2026-08-10', '2026-12-18', 'activo'),
]

AULAS = ['Beta-01', 'Beta-04', 'Alfa-10', 'Lab-CC1', 'Lab-CC2', 'Modulo-D01', 'Modulo-D05']

grupos = []
for id_ciclo, ciclo in enumerate(CICLOS, start=1):
    for id_materia in range(1, len(MATERIAS_BASE) + 1):
        num_grupos = random.choice([1, 2])
        for g in range(num_grupos):
            clave_grupo = f"D0{g+1}"
            id_profesor = random.randint(1, 4)
            aula = random.choice(AULAS)
            cupo = random.choice([25, 30, 35, 40])
            grupos.append((id_materia, id_profesor, id_ciclo, clave_grupo, aula, cupo))

inscripciones = []
estudiantes_ids = list(range(1, 59))
for g_id, g in enumerate(grupos, start=1):
    id_ciclo = g[2]
    num_inscritos = random.randint(10, g[5] - 5)
    est_seleccionados = random.sample(estudiantes_ids, min(num_inscritos, len(estudiantes_ids)))
    
    for est_id in est_seleccionados:
        if id_ciclo < 6:
            estatus = random.choices(['acreditado', 'no_acreditado', 'baja_voluntaria'], weights=[85, 10, 5])[0]
            f_insc = f"202{3 + (id_ciclo//2)}-01-20"
        else:
            estatus = 'inscrito'
            f_insc = '2026-08-12'
        inscripciones.append((est_id, g_id, f_insc, estatus))

with open(output_filename, 'w', encoding='utf-8') as f:
    f.write("-- DML Módulo 5: Oferta Curricular (generado con seeder_modulo_5.py)\n")
    f.write("-- Ejecutar después de los Módulos 1, 2, 3 y 4\n\n")

    f.write("-- 1. materias\n")
    for clave, nombre, cred, ht, hp, id_prog in MATERIAS_BASE:
        f.write(f"INSERT INTO materias (clave_materia, nombre, creditos, horas_teoria, horas_practica, id_programa) VALUES ('{clave}', '{nombre}', {cred}, {ht}, {hp}, {id_prog});\n")
    f.write("\n")

    f.write("-- 2. prerrequisitos\n")
    for id_m, id_pre, tipo in PRERREQUISITOS_BASE:
        f.write(f"INSERT INTO prerrequisitos (id_materia, id_materia_prerrequisito, tipo_prerrequisito) VALUES ({id_m}, {id_pre}, '{tipo}');\n")
    f.write("\n")

    f.write("-- 3. ciclos_escolares\n")
    for nom, fi, ff, est in CICLOS:
        f.write(f"INSERT INTO ciclos_escolares (nombre_ciclo, fecha_inicio, fecha_fin, estatus) VALUES ('{nom}', '{fi}', '{ff}', '{est}');\n")
    f.write("\n")

    f.write("-- 4. grupos_clase\n")
    for id_m, id_p, id_c, clave, aula, cupo in grupos:
        f.write(f"INSERT INTO grupos_clase (id_materia, id_profesor, id_ciclo, clave_grupo, aula, cupo_maximo) VALUES ({id_m}, {id_p}, {id_c}, '{clave}', '{aula}', {cupo});\n")
    f.write("\n")

    f.write("-- 5. inscripciones_materias\n")
    for est_id, g_id, f_insc, est in inscripciones:
        f.write(f"INSERT INTO inscripciones_materias (id_estudiante, id_grupo, fecha_inscripcion, estatus) VALUES ({est_id}, {g_id}, '{f_insc}', '{est}');\n")
    f.write("\n")

    f.write("-- 6. Transacción: Apertura de un nuevo grupo e inscripción de un estudiante\n")
    f.write(
        "BEGIN;\n\n"
        "INSERT INTO grupos_clase (id_materia, id_profesor, id_ciclo, clave_grupo, aula, cupo_maximo)\n"
        "VALUES (1, 1, 6, 'D09', 'Lab-CC3', 30);\n\n"
        "INSERT INTO inscripciones_materias (id_estudiante, id_grupo, fecha_inscripcion, estatus)\n"
        "SELECT 1, currval('grupos_clase_id_grupo_seq'), '2026-08-15', 'inscrito';\n\n"
        "COMMIT;\n"
    )

print(f"Archivo generado: {output_filename}")