# Seeder del Módulo 4 (Alumnos y matrícula). Genera DML_Modulo_4.sql
# Uso: pip install faker && python seeder_modulo_4.py
# Requiere cargados los usuarios del Módulo 1 y los programas del Módulo 2.

import os
import random
from datetime import date
from faker import Faker

SEMILLA = 20261104
Faker.seed(SEMILLA)
random.seed(SEMILLA)
fake = Faker('es_MX')

output_filename = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'DML_Modulo_4.sql')

# Los semestres se cuentan como anio * 2 + (0 para A, 1 para B). El actual es 2026-B
SEMESTRE_ACTUAL = 2026 * 2 + 1
ANIO_INICIAL = 2016

# Usuarios con rol Estudiante en DML_Modulo_1 que el Módulo 3 no usa como profesores.
# El último se reserva para la transacción del final.
USUARIOS_ESTUDIANTES = [
    1, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 20, 21, 22, 25, 26, 27, 28, 29,
    32, 33, 34, 35, 37, 39, 41, 43, 44, 47, 48, 49, 51, 59, 60, 61, 62, 65, 66, 67,
    68, 69, 73, 75, 76, 77, 79, 80, 81, 82, 83, 86, 88, 90, 91, 94, 96, 97, 98,
]
USUARIO_TRANSACCION = USUARIOS_ESTUDIANTES.pop()

# Programas de CUCEI del Módulo 2 (id_programa) y su peso de matrícula
PROGRAMAS_LIC = [1, 2, 3, 6, 7, 9, 12, 15, 18, 20, 21, 24, 26, 27, 28, 30, 31]
PESOS_LIC = [14, 10, 9, 6, 4, 2, 2, 3, 3, 6, 4, 8, 6, 5, 4, 5, 3]
PROGRAMAS_MAESTRIA = [4, 8, 10, 13, 16, 19, 22, 25, 29, 32, 33]
PROGRAMAS_DOCTORADO = [5, 11, 14, 17, 23, 34]

# nivel -> (semestres del plan, créditos del plan)
PLAN = {'Licenciatura': (9, 400), 'Maestria': (4, 100), 'Doctorado': (8, 160)}

# nombre de la beca -> porcentajes posibles
BECAS = {
    'Beca de Excelencia Académica': [50, 75, 100],
    'Beca de Manutención': [25, 50],
    'Beca de Transporte': [10, 15, 20],
    'Beca de Movilidad Estudiantil': [30, 50, 80],
    'Beca Deportiva': [20, 40],
    'Beca Cultural': [20, 40],
    'Beca Alimentaria': [15, 25],
    'Beca de Inclusión Educativa': [50, 100],
    'Beca de Posgrado': [50, 75, 100],
}
PESOS_BECAS = [14, 20, 14, 8, 6, 5, 10, 8, 15]


def esc(texto):
    return texto.replace("'", "''")


def id_cohorte(anio, ciclo):
    return (anio - ANIO_INICIAL) * 2 + (1 if ciclo == 'B' else 0) + 1


def inicio_semestre(semestre):
    anio, ciclo = divmod(semestre, 2)
    return date(anio, 8 if ciclo else 2, 1)


def fin_semestre(semestre):
    anio, ciclo = divmod(semestre, 2)
    return date(anio, 12, 31) if ciclo else date(anio, 6, 30)


matriculas_usadas = set()


def nueva_matricula(anio):
    while True:
        matricula = f"2{anio % 100:02d}{random.randint(0, 999999):06d}"
        if matricula not in matriculas_usadas:
            matriculas_usadas.add(matricula)
            return matricula


def nombre_completo():
    return fake.first_name(), f"{fake.last_name()} {fake.last_name()}"


cohortes = [(f"{anio}-{ciclo}", anio) for anio in range(ANIO_INICIAL, 2027) for ciclo in 'AB']

estudiantes = []
expedientes = []

for id_usuario in USUARIOS_ESTUDIANTES:
    if random.random() < 0.85:
        nivel = 'Licenciatura'
        id_programa = random.choices(PROGRAMAS_LIC, weights=PESOS_LIC)[0]
        anio = random.choices(range(2019, 2027), weights=[4, 6, 8, 10, 12, 14, 16, 10])[0]
    else:
        nivel = random.choices(['Maestria', 'Doctorado'], weights=[70, 30])[0]
        id_programa = random.choice(PROGRAMAS_MAESTRIA if nivel == 'Maestria' else PROGRAMAS_DOCTORADO)
        anio = random.choices(range(2022, 2027), weights=[2, 4, 6, 8, 6])[0]
    ciclo = 'B' if random.random() < (0.7 if anio == 2026 else 0.5) else 'A'

    semestres_plan, creditos_plan = PLAN[nivel]
    ingreso = anio * 2 + (1 if ciclo == 'B' else 0)
    transcurridos = SEMESTRE_ACTUAL - ingreso + 1

    if transcurridos > semestres_plan:
        estatus = random.choices(['egresado', 'baja_definitiva', 'activo'], weights=[80, 10, 10])[0]
    else:
        estatus = random.choices(['activo', 'baja_temporal', 'baja_definitiva'], weights=[85, 8, 7])[0]

    if estatus == 'activo':
        ultimo = SEMESTRE_ACTUAL
        completados = min(transcurridos - 1, semestres_plan)
    elif estatus == 'egresado':
        ultimo = ingreso + semestres_plan - 1
        completados = semestres_plan
    else:
        completados = random.randint(0, max(0, min(transcurridos, semestres_plan) - 1))
        ultimo = ingreso + completados

    if estatus == 'egresado':
        creditos = creditos_plan
    else:
        creditos = round(creditos_plan * min(1, completados / semestres_plan) * random.uniform(0.9, 1.0))
    promedio = 0 if creditos == 0 else round(min(10, max(6.5, random.gauss(8.5, 0.6))), 2)

    nombre, apellido = nombre_completo()
    estudiantes.append({
        'matricula': nueva_matricula(anio), 'nombre': nombre, 'apellido': apellido,
        'estatus': estatus, 'id_usuario': id_usuario, 'id_programa': id_programa,
        'id_cohorte': id_cohorte(anio, ciclo), 'nivel': nivel, 'ingreso': ingreso, 'ultimo': ultimo,
    })
    expedientes.append((creditos, promedio))

# Becas: varias por estudiante a lo largo de sus semestres. Algunas de estudiantes que ya no
# están activos se dejan sin fecha_fin (sin cierre capturado) para que el UPDATE masivo las cierre.
NUM_BECAS = 130
becas = []
claves_usadas = set()
while len(becas) < NUM_BECAS:
    id_estudiante = random.randint(1, len(estudiantes))
    est = estudiantes[id_estudiante - 1]
    nombres = list(BECAS)
    pesos = list(PESOS_BECAS)
    pesos[nombres.index('Beca de Posgrado')] = 0 if est['nivel'] == 'Licenciatura' else 60
    if expedientes[id_estudiante - 1][1] < 8.5:
        pesos[nombres.index('Beca de Excelencia Académica')] = 0
    nombre_beca = random.choices(nombres, weights=pesos)[0]
    inicio = random.randint(est['ingreso'], est['ultimo'])
    fin = min(inicio + random.choice([1, 2, 2, 3]) - 1, est['ultimo'])
    if (id_estudiante, nombre_beca, inicio) in claves_usadas:
        continue
    claves_usadas.add((id_estudiante, nombre_beca, inicio))
    if est['estatus'] == 'activo':
        fecha_fin = None if fin >= SEMESTRE_ACTUAL else fin_semestre(fin)
    else:
        fecha_fin = None if random.random() < 0.15 else fin_semestre(fin)
    becas.append((id_estudiante, nombre_beca, random.choice(BECAS[nombre_beca]), inicio_semestre(inicio), fecha_fin))
becas.sort(key=lambda b: (b[0], b[3]))

nombre_t, apellido_t = nombre_completo()
matricula_t = nueva_matricula(2026)

assert len(cohortes) >= 15 and len(becas) >= 100

with open(output_filename, 'w', encoding='utf-8') as f:
    f.write("-- DML Módulo 4: Alumnos y matrícula (generado con seeder_modulo_4.py)\n")
    f.write("-- Ejecutar después de los Módulos 1 y 2, sobre tablas recién creadas\n\n")

    f.write("-- 1. cohortes\n")
    for nombre, anio in cohortes:
        f.write(f"INSERT INTO cohortes (nombre_cohorte, anio_ingreso) VALUES ('{nombre}', {anio});\n")
    f.write("\n")

    f.write("-- 2. estudiantes\n")
    for e in estudiantes:
        f.write(
            f"INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte) "
            f"VALUES ('{e['matricula']}', '{esc(e['nombre'])}', '{esc(e['apellido'])}', '{e['estatus']}', "
            f"{e['id_usuario']}, {e['id_programa']}, {e['id_cohorte']});\n"
        )
    f.write("\n")

    f.write("-- 3. expedientes_academicos (uno por estudiante)\n")
    for id_estudiante, (creditos, promedio) in enumerate(expedientes, start=1):
        f.write(
            f"INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante) "
            f"VALUES ({creditos}, {promedio:.2f}, {id_estudiante});\n"
        )
    f.write("\n")

    f.write("-- 4. becas_asignadas\n")
    for id_estudiante, nombre_beca, porcentaje, fecha_inicio, fecha_fin in becas:
        fin_sql = 'NULL' if fecha_fin is None else f"'{fecha_fin.isoformat()}'"
        f.write(
            f"INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante) "
            f"VALUES ('{esc(nombre_beca)}', {porcentaje}, '{fecha_inicio.isoformat()}', {fin_sql}, {id_estudiante});\n"
        )
    f.write("\n")

    f.write("-- 5. UPDATE masivo: cierra las becas abiertas de estudiantes que ya no están activos\n")
    f.write(
        "UPDATE becas_asignadas b\n"
        "SET fecha_fin = (b.fecha_inicio + INTERVAL '6 months')::date\n"
        "WHERE b.fecha_fin IS NULL\n"
        "  AND EXISTS (\n"
        "      SELECT 1\n"
        "      FROM estudiantes e\n"
        "      WHERE e.id_estudiante = b.id_estudiante\n"
        "        AND e.estatus_escolar IN ('baja_temporal', 'baja_definitiva', 'egresado')\n"
        "  );\n\n"
    )

    f.write("-- 6. Transacción: alta de un estudiante de nuevo ingreso con su expediente y su beca\n")
    f.write(
        "BEGIN;\n\n"
        "INSERT INTO estudiantes (matricula, nombre, apellido, estatus_escolar, id_usuario, id_programa, id_cohorte)\n"
        f"SELECT '{matricula_t}', '{esc(nombre_t)}', '{esc(apellido_t)}', 'activo', u.id_usuario, 1, c.id_cohorte\n"
        "FROM usuarios u\n"
        "CROSS JOIN cohortes c\n"
        f"WHERE u.id_usuario = {USUARIO_TRANSACCION}\n"
        "  AND c.nombre_cohorte = '2026-B';\n\n"
        "INSERT INTO expedientes_academicos (creditos_cursados, promedio, id_estudiante)\n"
        "SELECT 0, 0, e.id_estudiante\n"
        "FROM estudiantes e\n"
        f"WHERE e.matricula = '{matricula_t}';\n\n"
        "INSERT INTO becas_asignadas (nombre_beca, porcentaje, fecha_inicio, fecha_fin, id_estudiante)\n"
        "SELECT 'Beca de Manutención', 50, DATE '2026-08-01', NULL, e.id_estudiante\n"
        "FROM estudiantes e\n"
        f"WHERE e.matricula = '{matricula_t}';\n\n"
        "COMMIT;\n"
    )

print(f"Archivo generado: {output_filename}")
print(f"cohortes: {len(cohortes)} | estudiantes: {len(estudiantes)} | "
      f"expedientes: {len(expedientes)} | becas: {len(becas)}")
