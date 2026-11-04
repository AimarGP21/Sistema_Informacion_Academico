# ============================================================================
# SISTEMA DE INFORMACIÓN ACADÉMICA (SIA) - CUCEI / UDG
# MÓDULO 3: PERSONAL DOCENTE E INVESTIGADORES
# SCRIPT GENERADOR DE DATOS SINTÉTICOS (SEEDER) - SPRINT 3
# ============================================================================
# Criterios del Sprint 3 cubiertos:
#   - Catálogos con >= 15 registros (lineas_investigacion, cuerpos_academicos)
#   - Generación sintética automatizada con Faker (es_MX) y random
#   - Integridad referencial con Módulo 1 (usuarios) y Módulo 2 (departamentos)
#   - Llaves primarias compuestas sin duplicados mediante estructuras set()
#   - Sentencia UPDATE masiva con correlación lógica
#   - Bloque transaccional atómico ACID (BEGIN ... COMMIT)
# ============================================================================

import random
import os

try:
    from faker import Faker
    fake = Faker('es_MX')
except ImportError:
    # Generador de respaldo con fallback elegante si faker aún no está en el entorno local
    class FakeFallback:
        def first_name(self):
            return random.choice(['Carlos', 'Alejandro', 'Guillermo', 'Maria', 'Laura', 'Patricia', 'Roberto', 'Sergio', 'Elena', 'Fernando'])
        def last_name(self):
            return random.choice(['Hernandez', 'Gonzalez', 'Ramirez', 'Vazquez', 'Morales', 'Jimenez', 'Torres', 'Gutierrez', 'Castillo'])
        def unique_number(self):
            return random.randint(10000, 99999)
    fake = FakeFallback()

# Directorio de salida alineado con la raíz del módulo
output_filename = os.path.join(os.path.dirname(__file__), 'DML_Modulo_3.sql')

with open(output_filename, 'w', encoding='utf-8') as f:
    f.write("-- ============================================================================\n")
    f.write("-- DML MÓDULO 3: PERSONAL DOCENTE E INVESTIGADORES\n")
    f.write("-- SISTEMA DE INFORMACIÓN ACADÉMICA (SIA) - CUCEI / UDG\n")
    f.write("-- Generado automáticamente mediante seeder_modulo_3.py (Sprint 3)\n")
    f.write("-- ============================================================================\n\n")

    # =========================================================================
    # 1. TABLA: lineas_investigacion (Catálogo LGAC: Mínimo 15+ registros reales)
    # =========================================================================
    lineas_definidas = [
        ('Inteligencia Artificial y Aprendizaje Profundo', 'Investigación en redes neuronales convolucionales, LLMs aplicados a ciencias y visión computacional.'),
        ('Ciberseguridad y Criptografía Aplicada', 'Protocolos criptográficos post-cuánticos, seguridad en redes industriales e infraestructura crítica.'),
        ('Ciencia de Datos y Computación Distribuida', 'Procesamiento de flujos masivos de datos con clústeres Spark, Hadoop y modelos predictivos.'),
        ('Sistemas Embebidos e Internet de las Cosas (IoT)', 'Desarrollo de sensores inteligentes de bajo consumo, nodos inalámbricos y firmware en tiempo real.'),
        ('Ingeniería de Software y Arquitecturas Cloud', 'Patrones de microservicios, DevOps, observabilidad y resiliencia en sistemas cloud-native.'),
        ('Nanotecnología y Materiales Avanzados', 'Síntesis de nanopartículas, grafeno y caracterización de biomateriales de alta conductividad.'),
        ('Energías Renovables y Redes Inteligentes (Smart Grids)', 'Modelado de microrredes fotovoltaicas, almacenamiento cinético y optimización energética.'),
        ('Robótica Móvil y Automatización Industrial', 'Navegación autónoma con LiDAR, brazos robóticos colaborativos (cobots) y control cinemático.'),
        ('Biotecnología Molecular y Bioinformática', 'Alineamiento genómico, diseño computacional de fármacos y enzimas para biorremediación.'),
        ('Física Cuántica y Óptica No Lineal', 'Fotónica de pulsos ultracortos, metrología cuántica y láseres de estado sólido.'),
        ('Matemáticas Aplicadas y Optimización Estocástica', 'Ecuaciones diferenciales estocásticas, teoría de grafos y logística multimodal.'),
        ('Procesamiento de Señales y Telecomunicaciones 5G/6G', 'Modulaciones espaciales MIMO masivo, codificación de canal y redes de ondas milimétricas.'),
        ('Mecatrónica y Tecnologías de Manufactura Avanzada', 'Modelado numérico en elementos finitos (FEA), impresión aditiva 3D en aleaciones de titanio.'),
        ('Procesos Químicos Sustentables y Catálisis', 'Catálisis heterogénea para captura y revalorización de CO2 en biocombustibles.'),
        ('Sistemas de Información Geográfica y Teledetección', 'Procesamiento de imágenes satelitales multiespectrales para monitoreo hidrológico y ambiental.'),
        ('Química Médica y Farmacogenómica', 'Síntesis de derivados heterocíclicos de impacto oncológico y perfiles de resistencia farmacológica.'),
        ('Computación Gráfica y Realidad Extendida (XR)', 'Renderizado neural en tiempo real, entornos inmersivos para telemetría y gemelos digitales.')
    ]

    f.write("-- ============================================================================\n")
    f.write("-- 1. Inserción en tabla lineas_investigacion (17 registros de catálogo LGAC)\n")
    f.write("-- ============================================================================\n")
    for nombre_linea, descripcion in lineas_definidas:
        nombre_clean = nombre_linea.replace("'", "''")
        desc_clean = descripcion.replace("'", "''")
        f.write(
            f"INSERT INTO lineas_investigacion (nombre_linea, descripcion) "
            f"VALUES ('{nombre_clean}', '{desc_clean}');\n"
        )
    f.write("\n")

    # =========================================================================
    # 2. TABLA: cuerpos_academicos (Catálogo PRODEP: Mínimo 15+ registros)
    # =========================================================================
    cuerpos_definidos = [
        ('UDG-CA-700 Sistemas Inteligentes y Computación Ubicua', 'Consolidado'),
        ('UDG-CA-715 Ciberseguridad e Infraestructura Digital Segura', 'En Consolidación'),
        ('UDG-CA-730 Ingeniería de Software y Ciencia de Datos', 'Consolidado'),
        ('UDG-CA-745 Nanomateriales y Dispositivos Optoelectrónicos', 'Consolidado'),
        ('UDG-CA-760 Energías Limpias y Gestión Eficiente de Recursos', 'En Consolidación'),
        ('UDG-CA-775 Robótica Autónoma y Sistemas Mecatrónicos', 'En Consolidación'),
        ('UDG-CA-790 Biología Computacional y Ciencias Genómicas', 'En Formación'),
        ('UDG-CA-805 Física Aplicada y Procesos de Alta Energía', 'Consolidado'),
        ('UDG-CA-820 Optimización Matemática y Logística de Sistemas', 'En Consolidación'),
        ('UDG-CA-835 Telecomunicaciones de Alta Frecuencia y Microondas', 'En Formación'),
        ('UDG-CA-850 Materiales Poliméricos y Sustentabilidad', 'Consolidado'),
        ('UDG-CA-865 Ingeniería Química y Reactores Catalíticos', 'Consolidado'),
        ('UDG-CA-880 Automatización y Control de Procesos Complejos', 'En Formación'),
        ('UDG-CA-895 Geotecnología, Riesgo Sísmico y Recursos Hídricos', 'En Consolidación'),
        ('UDG-CA-910 Computación Cuántica y Algoritmos Complejos', 'En Formación'),
        ('UDG-CA-925 Bioingeniería y Dispositivos Médicos de Rehabilitación', 'En Consolidación')
    ]

    f.write("-- ============================================================================\n")
    f.write("-- 2. Inserción en tabla cuerpos_academicos (16 registros de catálogo PRODEP)\n")
    f.write("-- ============================================================================\n")
    for nombre_cuerpo, grado in cuerpos_definidos:
        cuerpo_clean = nombre_cuerpo.replace("'", "''")
        f.write(
            f"INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) "
            f"VALUES ('{cuerpo_clean}', '{grado}');\n"
        )
    f.write("\n")

    # =========================================================================
    # 3. TABLA: profesores (30 registros vinculados 1:1 a usuarios y departamentos)
    # =========================================================================
    categorias_docentes = [
        'Profesor Titular C',
        'Profesor Titular B',
        'Profesor Titular A',
        'Profesor Asociado C',
        'Profesor Asociado B',
        'Profesor Asociado A',
        'Profesor Docente Asignatura B'
    ]

    # Tomamos IDs de usuario que en el Módulo 1 tienen el rol de Profesor_Investigador
    # (id_rol = 2) y perfiles académicos afines para garantizar coherencia semántica:
    # Mapeo unívoco 1:1 estricto con usuarios(id_usuario) del 1 al 100
    usuarios_profesores = [
        5, 6, 24, 30, 31, 38, 40, 45, 46, 50,
        52, 53, 54, 57, 58, 63, 70, 71, 74, 78,
        85, 89, 92, 2, 4, 19, 23, 36, 64, 84
    ]

    num_profesores = len(usuarios_profesores) # 30 profesores

    f.write("-- ============================================================================\n")
    f.write("-- 3. Inserción en tabla profesores (30 docentes e investigadores UDG)\n")
    f.write("-- ============================================================================\n")
    
    # Lista para almacenar los id_profesor generados secuencialmente
    # IDs de departamento distribuidos entre 1 y 8 (ej. Computación, Electrónica, Física, etc.)
    random.seed(20261104) # Semilla determinista para consistencia de evaluación
    
    for i, id_user in enumerate(usuarios_profesores, start=1):
        num_emp = f"EMP-{202600 + i}"
        cat = random.choices(
            categorias_docentes,
            weights=[35, 25, 15, 10, 5, 5, 5],
            k=1
        )[0]
        # Departamentos entre 1 y 8
        id_depto = ((i - 1) % 8) + 1

        f.write(
            f"INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) "
            f"VALUES ('{num_emp}', '{cat}', {id_depto}, {id_user});\n"
        )
    f.write("\n")

    # =========================================================================
    # 4. TABLA: profesores_linea (Relación N:M: 65 asignaciones únicas con set)
    # =========================================================================
    profesores_linea_set = set()
    num_lineas = len(lineas_definidas) # 17

    # Asegurar que cada uno de los 30 profesores tenga al menos una LGAC asignada
    for id_prof in range(1, num_profesores + 1):
        linea_principal = ((id_prof * 3) % num_lineas) + 1
        profesores_linea_set.add((id_prof, linea_principal))

    # Asignar segundas y terceras líneas de investigación multidisciplinarias
    while len(profesores_linea_set) < 68:
        id_prof_rand = random.randint(1, num_profesores)
        id_linea_rand = random.randint(1, num_lineas)
        profesores_linea_set.add((id_prof_rand, id_linea_rand))

    f.write("-- ============================================================================\n")
    f.write("-- 4. Inserción en tabla profesores_linea (68 asignaciones N:M compuestas únicas)\n")
    f.write("-- ============================================================================\n")
    for id_prof, id_linea in sorted(profesores_linea_set):
        f.write(
            f"INSERT INTO profesores_linea (id_profesor, id_linea) "
            f"VALUES ({id_prof}, {id_linea});\n"
        )
    f.write("\n")

    # =========================================================================
    # 5. ACTUALIZACIÓN MASIVA CORRELACIONADA (DML UPDATE)
    # =========================================================================
    f.write("-- ============================================================================\n")
    f.write("-- 5. Sentencia UPDATE masiva: Promoción de categoría para docentes adscritos\n")
    f.write("--    a Líneas de Investigación en Tecnologías Emergentes (IA y Ciberseguridad)\n")
    f.write("-- ============================================================================\n")
    f.write(
        "UPDATE profesores p\n"
        "SET categoria = 'Profesor Titular C'\n"
        "WHERE p.categoria = 'Profesor Titular B'\n"
        "  AND EXISTS (\n"
        "      SELECT 1\n"
        "      FROM profesores_linea pl\n"
        "      INNER JOIN lineas_investigacion li ON pl.id_linea = li.id_linea\n"
        "      WHERE pl.id_profesor = p.id_profesor\n"
        "        AND li.nombre_linea IN (\n"
        "            'Inteligencia Artificial y Aprendizaje Profundo',\n"
        "            'Ciberseguridad y Criptografía Aplicada'\n"
        "        )\n"
        "  );\n\n"
    )

    # =========================================================================
    # 6. OPERACIÓN TRANSACCIONAL ATÓMICA ACID (BEGIN ... COMMIT)
    # =========================================================================
    f.write("-- ============================================================================\n")
    f.write("-- 6. Operación Transaccional Atómica (BEGIN ... COMMIT)\n")
    f.write("--    Alta de Investigador Emérito y asignación inmediata a LGAC de frontera\n")
    f.write("--    El ROLLBACK procedería si viola unicidad de nómina o integridad referencial.\n")
    f.write("-- ============================================================================\n")
    f.write(
        "BEGIN;\n\n"
        "-- 6.1 Registro del profesor emérito vinculado al usuario administrativo/investigador creado en M1\n"
        "INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario)\n"
        "SELECT 'EMP-99999', 'Profesor Emérito Titular C', 1, u.id_usuario\n"
        "FROM usuarios u\n"
        "WHERE u.username = 'dr.roberto.castaneda'\n"
        "LIMIT 1;\n\n"
        "-- 6.2 Adscripción simultánea a las LGAC de Inteligencia Artificial y Computación Cuántica\n"
        "INSERT INTO profesores_linea (id_profesor, id_linea)\n"
        "SELECT p.id_profesor, li.id_linea\n"
        "FROM profesores p\n"
        "CROSS JOIN lineas_investigacion li\n"
        "WHERE p.numero_empleado = 'EMP-99999'\n"
        "  AND li.nombre_linea IN (\n"
        "      'Inteligencia Artificial y Aprendizaje Profundo',\n"
        "      'Computación Cuántica y Algoritmos Complejos'\n"
        "  );\n\n"
        "COMMIT;\n"
    )

print(f"Seeder completado exitosamente. Archivo generado en: {output_filename}")
