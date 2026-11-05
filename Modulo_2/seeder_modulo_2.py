# Seeder del Módulo 2 (Estructura organizacional). Genera DML_Modulo_2.sql
# Uso: pip install faker && python seeder_modulo_2.py
# Los departamentos 1..11 son de CUCEI: el Módulo 3 usa 1..8 y el Módulo 7 usa 1..6.

import os
from faker import Faker

Faker.seed(20261104)
fake = Faker('es_MX')

output_filename = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'DML_Modulo_2.sql')


# Convierte "L:Física" en ("Licenciatura en Física", "Licenciatura")
def prog(spec):
    clave, nombre = spec.split(':', 1)
    if clave == 'L':
        return (f"Licenciatura en {nombre}", 'Licenciatura')
    if clave == 'I':
        return (f"Ingeniería en {nombre}", 'Licenciatura')
    if clave == 'G':
        return (f"Ingeniería {nombre}", 'Licenciatura')
    if clave == 'M':
        return (f"Maestría en {nombre}", 'Maestria')
    if clave == 'D':
        return (f"Doctorado en {nombre}", 'Doctorado')
    raise ValueError(f"Clave de programa desconocida: {spec}")


# campus: (nombre, ciudad, estado, con_direccion, [(facultad, [(departamento, [programas])])])
# con_direccion=False deja la dirección en NULL (la corrige el UPDATE masivo)
ESTRUCTURA = [
    ('Centro Universitario de Ciencias Exactas e Ingenierías (CUCEI)', 'Guadalajara', 'Jalisco', True, [
        ('División de Electrónica y Computación', [
            ('Departamento de Ciencias Computacionales',
             ['I:Computación', 'G:Informática', 'I:Ciencia de Datos',
              'M:Ciencias de la Computación', 'D:Ciencias de la Computación']),
            ('Departamento de Electrónica',
             ['I:Comunicaciones y Electrónica', 'G:Biomédica', 'M:Ciencias en Ingeniería Electrónica']),
        ]),
        ('División de Ciencias Básicas', [
            ('Departamento de Física',
             ['L:Física', 'M:Ciencias en Física', 'D:Ciencias en Física']),
            ('Departamento de Matemáticas',
             ['L:Matemáticas', 'M:Matemáticas Aplicadas', 'D:Matemáticas Aplicadas']),
            ('Departamento de Química',
             ['L:Química', 'M:Ciencias en Química', 'D:Ciencias en Química']),
            ('Departamento de Farmacobiología',
             ['L:Químico Farmacobiólogo', 'M:Farmacología']),
        ]),
        ('División de Ingenierías', [
            ('Departamento de Ingeniería Química',
             ['G:Química', 'I:Alimentos y Biotecnología', 'M:Ciencias en Ingeniería Química',
              'D:Ciencias en Ingeniería Química']),
            ('Departamento de Ingeniería Industrial',
             ['G:Industrial', 'M:Ciencias en Ingeniería Industrial']),
            ('Departamento de Ingeniería Mecánica Eléctrica',
             ['G:Mecánica Eléctrica', 'I:Mecatrónica', 'I:Robótica', 'M:Ciencias en Ingeniería Mecánica']),
            ('Departamento de Ingeniería Civil y Topografía',
             ['G:Civil', 'G:Topográfica', 'M:Ciencias de la Ingeniería Civil']),
            ('Departamento de Ingeniería de Proyectos',
             ['M:Administración de Proyectos', 'D:Ingeniería de Proyectos']),
        ]),
    ]),
    ('Centro Universitario de Ciencias de la Salud (CUCS)', 'Guadalajara', 'Jalisco', True, [
        ('División de Disciplinas Clínicas', [
            ('Departamento de Clínicas Médicas', ['L:Médico Cirujano y Partero', 'M:Ciencias Médicas']),
            ('Departamento de Enfermería Clínica Aplicada', ['L:Enfermería', 'M:Ciencias de la Enfermería']),
        ]),
        ('División de Disciplinas Básicas para la Salud', [
            ('Departamento de Fisiología', ['L:Nutrición', 'M:Nutrición Clínica']),
            ('Departamento de Microbiología y Patología', ['M:Microbiología Médica', 'D:Ciencias Biomédicas']),
        ]),
        ('División de Disciplinas para el Desarrollo, Promoción y Preservación de la Salud', [
            ('Departamento de Salud Pública', ['L:Cultura Física y Deportes', 'M:Salud Pública', 'D:Salud Pública']),
            ('Departamento de Psicología Aplicada', ['L:Psicología', 'M:Psicología de la Salud']),
        ]),
    ]),
    ('Centro Universitario de Ciencias Económico Administrativas (CUCEA)', 'Zapopan', 'Jalisco', True, [
        ('División de Economía y Sociedad', [
            ('Departamento de Economía', ['L:Economía', 'M:Economía', 'D:Economía']),
            ('Departamento de Políticas Públicas', ['L:Gestión Pública', 'M:Políticas Públicas']),
        ]),
        ('División de Gestión Empresarial', [
            ('Departamento de Administración', ['L:Administración', 'M:Administración de Negocios',
                                                'D:Ciencias de la Administración']),
            ('Departamento de Mercadotecnia y Negocios Internacionales',
             ['L:Mercadotecnia', 'L:Negocios Internacionales']),
            ('Departamento de Contabilidad', ['L:Contaduría Pública', 'M:Finanzas']),
        ]),
    ]),
    ('Centro Universitario de Ciencias Sociales y Humanidades (CUCSH)', 'Guadalajara', 'Jalisco', True, [
        ('División de Estudios Históricos y Humanos', [
            ('Departamento de Historia', ['L:Historia', 'M:Historia de México']),
            ('Departamento de Letras', ['L:Letras Hispánicas', 'M:Literatura Mexicana']),
        ]),
        ('División de Estudios de la Cultura', [
            ('Departamento de Sociología', ['L:Sociología', 'D:Ciencias Sociales']),
            ('Departamento de Antropología', ['L:Antropología']),
        ]),
        ('División de Estudios Jurídicos y Sociales', [
            ('Departamento de Derecho', ['L:Derecho', 'M:Derecho']),
        ]),
    ]),
    ('Centro Universitario de Arte, Arquitectura y Diseño (CUAAD)', 'Guadalajara', 'Jalisco', True, [
        ('División de Arquitectura y Urbanismo', [
            ('Departamento de Proyectos Arquitectónicos', ['L:Arquitectura', 'M:Arquitectura']),
            ('Departamento de Urbanismo', ['L:Urbanismo', 'M:Diseño Urbano']),
        ]),
        ('División de Arte y Diseño', [
            ('Departamento de Diseño', ['L:Diseño Industrial', 'L:Diseño de Interiores']),
            ('Departamento de Artes Visuales', ['L:Artes Visuales']),
        ]),
    ]),
    ('Centro Universitario de Ciencias Biológicas y Agropecuarias (CUCBA)', 'Zapopan', 'Jalisco', True, [
        ('División de Ciencias Biológicas', [
            ('Departamento de Botánica y Zoología', ['L:Biología', 'M:Ciencias Biológicas']),
            ('Departamento de Ciencias Ambientales', ['L:Gestión Ambiental']),
        ]),
        ('División de Ciencias Agropecuarias', [
            ('Departamento de Producción Agrícola', ['I:Agronomía', 'M:Ciencias Agrícolas']),
            ('Departamento de Medicina Veterinaria y Zootecnia',
             ['L:Medicina Veterinaria y Zootecnia', 'M:Ciencias Veterinarias']),
        ]),
    ]),
    ('Centro Universitario de los Altos (CUAltos)', 'Tepatitlán de Morelos', 'Jalisco', False, [
        ('División de Ciencias Agropecuarias e Ingenierías', [
            ('Departamento de Ciencias Agrícolas y Pecuarias', ['L:Medicina Veterinaria y Zootecnia', 'I:Agronegocios']),
            ('Departamento de Ingenierías', ['I:Computación', 'G:Industrial']),
        ]),
        ('División de Ciencias Sociales y Humanidades', [
            ('Departamento de Ciencias Sociales', ['L:Psicología', 'L:Derecho']),
            ('Departamento de Estudios Económico-Administrativos', ['L:Administración', 'L:Contaduría Pública']),
        ]),
    ]),
    ('Centro Universitario de la Ciénega (CUCiénega)', 'Ocotlán', 'Jalisco', False, [
        ('División de Desarrollo Biotecnológico', [
            ('Departamento de Ciencias Naturales y Exactas', ['I:Nanotecnología', 'L:Química Farmacéutica']),
            ('Departamento de Ingenierías', ['I:Computación', 'I:Alimentos']),
        ]),
        ('División de Desarrollo Regional', [
            ('Departamento de Estudios Organizacionales', ['L:Administración', 'L:Contaduría Pública']),
            ('Departamento de Ciencias Sociales', ['L:Derecho', 'L:Psicología']),
        ]),
    ]),
    ('Centro Universitario de la Costa (CUCosta)', 'Puerto Vallarta', 'Jalisco', True, [
        ('División de Ingenierías', [
            ('Departamento de Ciencias Computacionales e Ingeniería', ['I:Telemática', 'I:Computación']),
            ('Departamento de Ciencias Exactas', ['L:Física', 'L:Matemáticas']),
        ]),
        ('División de Ciencias Sociales y Económico-Administrativas', [
            ('Departamento de Turismo', ['L:Turismo', 'M:Gestión Turística']),
            ('Departamento de Administración', ['L:Negocios Internacionales', 'L:Administración']),
        ]),
    ]),
    ('Centro Universitario de la Costa Sur (CUCSur)', 'Autlán de Navarro', 'Jalisco', False, [
        ('División de Desarrollo Regional', [
            ('Departamento de Ecología y Recursos Naturales', ['L:Biología', 'L:Gestión Ambiental']),
            ('Departamento de Producción Agrícola', ['I:Agronomía', 'L:Nutrición']),
        ]),
        ('División de Ciencias Sociales', [
            ('Departamento de Estudios Sociales', ['L:Derecho', 'L:Psicología']),
            ('Departamento de Administración', ['L:Administración', 'L:Turismo']),
        ]),
    ]),
    ('Centro Universitario de los Lagos (CULagos)', 'Lagos de Moreno', 'Jalisco', False, [
        ('División de Ciencias Económicas y Sociales', [
            ('Departamento de Ciencias Económicas', ['L:Economía', 'L:Contaduría Pública']),
            ('Departamento de Ciencias Sociales', ['L:Derecho', 'L:Psicología']),
        ]),
        ('División de Ingeniería y Tecnología', [
            ('Departamento de Ingeniería Industrial', ['G:Industrial', 'G:Mecánica Eléctrica']),
            ('Departamento de Computación', ['I:Computación', 'M:Tecnologías de la Información']),
        ]),
    ]),
    ('Centro Universitario del Norte (CUNorte)', 'Colotlán', 'Jalisco', False, [
        ('División de Ciencias Sociales y Humanidades', [
            ('Departamento de Ciencias Sociales', ['L:Trabajo Social', 'L:Derecho']),
            ('Departamento de Educación', ['L:Educación', 'M:Educación']),
        ]),
        ('División de Ciencias Exactas y Naturales', [
            ('Departamento de Ciencias Ambientales', ['L:Gestión Ambiental', 'L:Biología']),
            ('Departamento de Ingenierías', ['I:Computación', 'G:Industrial']),
        ]),
    ]),
    ('Centro Universitario del Sur (CUSur)', 'Ciudad Guzmán', 'Jalisco', False, [
        ('División de Ciencias Sociales y Humanidades', [
            ('Departamento de Ciencias Sociales', ['L:Derecho', 'L:Trabajo Social']),
            ('Departamento de Educación', ['L:Educación', 'M:Educación']),
        ]),
        ('División de Ciencias Naturales y Exactas', [
            ('Departamento de Ciencias Naturales', ['L:Biología', 'L:Química Farmacéutica']),
            ('Departamento de Ingeniería', ['I:Computación', 'G:Industrial']),
        ]),
    ]),
    ('Centro Universitario de Tonalá (CUTonalá)', 'Tonalá', 'Jalisco', True, [
        ('División de Ingenierías', [
            ('Departamento de Ingeniería Mecatrónica', ['I:Mecatrónica', 'I:Robótica']),
            ('Departamento de Computación', ['I:Computación', 'I:Ciencia de Datos']),
        ]),
        ('División de Ciencias Sociales y Administrativas', [
            ('Departamento de Administración', ['L:Administración', 'L:Mercadotecnia']),
            ('Departamento de Derecho', ['L:Derecho', 'M:Derecho']),
        ]),
    ]),
    ('Centro Universitario de los Valles (CUValles)', 'Ameca', 'Jalisco', False, [
        ('División de Estudios Científicos y Tecnológicos', [
            ('Departamento de Ciencias Computacionales', ['I:Computación', 'I:Telemática']),
            ('Departamento de Ciencias Naturales', ['L:Biología', 'L:Química']),
        ]),
        ('División de Estudios Sociales y Económicos', [
            ('Departamento de Estudios Económico-Administrativos', ['L:Administración', 'L:Contaduría Pública']),
            ('Departamento de Ciencias Sociales', ['L:Derecho', 'L:Psicología']),
        ]),
    ]),
]


def esc(texto):
    return texto.replace("'", "''")


campus_rows = []
facultades_rows = []
departamentos_rows = []
programas_rows = []

# Los IDs coinciden con los que asigna SERIAL al insertar en este orden
id_facultad = id_departamento = id_programa = 0

for id_campus, (nombre_c, ciudad, estado, con_dir, facultades) in enumerate(ESTRUCTURA, start=1):
    direccion = fake.street_address() if con_dir else None
    campus_rows.append((id_campus, nombre_c, direccion, ciudad, estado))
    for nombre_f, departamentos in facultades:
        id_facultad += 1
        facultades_rows.append((id_facultad, id_campus, nombre_f))
        for nombre_d, programas in departamentos:
            id_departamento += 1
            departamentos_rows.append((id_departamento, id_facultad, nombre_d))
            for spec in programas:
                id_programa += 1
                nombre_p, nivel = prog(spec)
                programas_rows.append((id_programa, id_departamento, nombre_p, nivel))

assert min(len(campus_rows), len(facultades_rows), len(departamentos_rows), len(programas_rows)) >= 15
facultades_cucei = {r[0] for r in facultades_rows if r[1] == 1}
assert all(r[1] in facultades_cucei for r in departamentos_rows if r[0] <= 8)

with open(output_filename, 'w', encoding='utf-8') as f:
    f.write("-- DML Módulo 2: Estructura organizacional (generado con seeder_modulo_2.py)\n")
    f.write("-- Ejecutar sobre tablas recién creadas con Modulo_2_Estructura.sql\n\n")

    f.write("-- 1. campus\n")
    for _, nombre, direccion, ciudad, estado in campus_rows:
        dir_sql = "NULL" if direccion is None else f"'{esc(direccion)}'"
        f.write(
            f"INSERT INTO campus (nombre, direccion, ciudad, estado) "
            f"VALUES ('{esc(nombre)}', {dir_sql}, '{esc(ciudad)}', '{esc(estado)}');\n"
        )
    f.write("\n")

    f.write("-- 2. facultades\n")
    for _, id_c, nombre in facultades_rows:
        f.write(
            f"INSERT INTO facultades (id_campus, nombre) "
            f"VALUES ({id_c}, '{esc(nombre)}');\n"
        )
    f.write("\n")

    f.write("-- 3. departamentos (los id 1 a 11 son de CUCEI; los usan los módulos 3 y 7)\n")
    for _, id_f, nombre in departamentos_rows:
        f.write(
            f"INSERT INTO departamentos (id_facultad, nombre) "
            f"VALUES ({id_f}, '{esc(nombre)}');\n"
        )
    f.write("\n")

    f.write("-- 4. programas_academicos\n")
    for _, id_d, nombre, nivel in programas_rows:
        f.write(
            f"INSERT INTO programas_academicos (id_departamento, nombre, nivel) "
            f"VALUES ({id_d}, '{esc(nombre)}', '{nivel}');\n"
        )
    f.write("\n")

    f.write("-- 5. UPDATE masivo: campus con facultades pero sin dirección capturada\n")
    f.write(
        "UPDATE campus c\n"
        "SET direccion = 'Dirección pendiente de captura - ' || c.ciudad\n"
        "WHERE c.direccion IS NULL\n"
        "  AND EXISTS (\n"
        "      SELECT 1\n"
        "      FROM facultades f\n"
        "      WHERE f.id_campus = c.id_campus\n"
        "  );\n\n"
    )

    nombre_cucei = esc(campus_rows[0][1])
    f.write("-- 6. Transacción: nueva división de CUCEI con su departamento y su posgrado\n")
    f.write(
        "BEGIN;\n\n"
        "INSERT INTO facultades (id_campus, nombre)\n"
        "SELECT c.id_campus, 'División de Tecnologías Emergentes'\n"
        "FROM campus c\n"
        f"WHERE c.nombre = '{nombre_cucei}';\n\n"
        "INSERT INTO departamentos (id_facultad, nombre)\n"
        "SELECT f.id_facultad, 'Departamento de Inteligencia Artificial'\n"
        "FROM facultades f\n"
        "INNER JOIN campus c ON c.id_campus = f.id_campus\n"
        f"WHERE c.nombre = '{nombre_cucei}'\n"
        "  AND f.nombre = 'División de Tecnologías Emergentes';\n\n"
        "INSERT INTO programas_academicos (id_departamento, nombre, nivel)\n"
        "SELECT d.id_departamento, 'Maestría en Inteligencia Artificial', 'Maestria'\n"
        "FROM departamentos d\n"
        "INNER JOIN facultades f ON f.id_facultad = d.id_facultad\n"
        "INNER JOIN campus c ON c.id_campus = f.id_campus\n"
        f"WHERE c.nombre = '{nombre_cucei}'\n"
        "  AND f.nombre = 'División de Tecnologías Emergentes'\n"
        "  AND d.nombre = 'Departamento de Inteligencia Artificial';\n\n"
        "COMMIT;\n"
    )

print(f"Archivo generado: {output_filename}")
print(f"campus: {len(campus_rows)} | facultades: {len(facultades_rows)} | "
      f"departamentos: {len(departamentos_rows)} | programas: {len(programas_rows)}")
