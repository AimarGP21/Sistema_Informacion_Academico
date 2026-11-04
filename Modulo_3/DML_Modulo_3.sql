-- ============================================================================
-- DML MÓDULO 3: PERSONAL DOCENTE E INVESTIGADORES
-- SISTEMA DE INFORMACIÓN ACADÉMICA (SIA) - CUCEI / UDG
-- Generado automáticamente mediante seeder_modulo_3.py (Sprint 3)
-- ============================================================================

-- ============================================================================
-- 1. Inserción en tabla lineas_investigacion (17 registros de catálogo LGAC)
-- ============================================================================
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Inteligencia Artificial y Aprendizaje Profundo', 'Investigación en redes neuronales convolucionales, LLMs aplicados a ciencias y visión computacional.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Ciberseguridad y Criptografía Aplicada', 'Protocolos criptográficos post-cuánticos, seguridad en redes industriales e infraestructura crítica.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Ciencia de Datos y Computación Distribuida', 'Procesamiento de flujos masivos de datos con clústeres Spark, Hadoop y modelos predictivos.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Sistemas Embebidos e Internet de las Cosas (IoT)', 'Desarrollo de sensores inteligentes de bajo consumo, nodos inalámbricos y firmware en tiempo real.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Ingeniería de Software y Arquitecturas Cloud', 'Patrones de microservicios, DevOps, observabilidad y resiliencia en sistemas cloud-native.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Nanotecnología y Materiales Avanzados', 'Síntesis de nanopartículas, grafeno y caracterización de biomateriales de alta conductividad.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Energías Renovables y Redes Inteligentes (Smart Grids)', 'Modelado de microrredes fotovoltaicas, almacenamiento cinético y optimización energética.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Robótica Móvil y Automatización Industrial', 'Navegación autónoma con LiDAR, brazos robóticos colaborativos (cobots) y control cinemático.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Biotecnología Molecular y Bioinformática', 'Alineamiento genómico, diseño computacional de fármacos y enzimas para biorremediación.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Física Cuántica y Óptica No Lineal', 'Fotónica de pulsos ultracortos, metrología cuántica y láseres de estado sólido.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Matemáticas Aplicadas y Optimización Estocástica', 'Ecuaciones diferenciales estocásticas, teoría de grafos y logística multimodal.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Procesamiento de Señales y Telecomunicaciones 5G/6G', 'Modulaciones espaciales MIMO masivo, codificación de canal y redes de ondas milimétricas.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Mecatrónica y Tecnologías de Manufactura Avanzada', 'Modelado numérico en elementos finitos (FEA), impresión aditiva 3D en aleaciones de titanio.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Procesos Químicos Sustentables y Catálisis', 'Catálisis heterogénea para captura y revalorización de CO2 en biocombustibles.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Sistemas de Información Geográfica y Teledetección', 'Procesamiento de imágenes satelitales multiespectrales para monitoreo hidrológico y ambiental.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Química Médica y Farmacogenómica', 'Síntesis de derivados heterocíclicos de impacto oncológico y perfiles de resistencia farmacológica.');
INSERT INTO lineas_investigacion (nombre_linea, descripcion) VALUES ('Computación Gráfica y Realidad Extendida (XR)', 'Renderizado neural en tiempo real, entornos inmersivos para telemetría y gemelos digitales.');

-- ============================================================================
-- 2. Inserción en tabla cuerpos_academicos (16 registros de catálogo PRODEP)
-- ============================================================================
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-700 Sistemas Inteligentes y Computación Ubicua', 'Consolidado');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-715 Ciberseguridad e Infraestructura Digital Segura', 'En Consolidación');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-730 Ingeniería de Software y Ciencia de Datos', 'Consolidado');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-745 Nanomateriales y Dispositivos Optoelectrónicos', 'Consolidado');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-760 Energías Limpias y Gestión Eficiente de Recursos', 'En Consolidación');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-775 Robótica Autónoma y Sistemas Mecatrónicos', 'En Consolidación');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-790 Biología Computacional y Ciencias Genómicas', 'En Formación');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-805 Física Aplicada y Procesos de Alta Energía', 'Consolidado');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-820 Optimización Matemática y Logística de Sistemas', 'En Consolidación');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-835 Telecomunicaciones de Alta Frecuencia y Microondas', 'En Formación');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-850 Materiales Poliméricos y Sustentabilidad', 'Consolidado');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-865 Ingeniería Química y Reactores Catalíticos', 'Consolidado');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-880 Automatización y Control de Procesos Complejos', 'En Formación');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-895 Geotecnología, Riesgo Sísmico y Recursos Hídricos', 'En Consolidación');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-910 Computación Cuántica y Algoritmos Complejos', 'En Formación');
INSERT INTO cuerpos_academicos (nombre_cuerpo, grado_consolidacion) VALUES ('UDG-CA-925 Bioingeniería y Dispositivos Médicos de Rehabilitación', 'En Consolidación');

-- ============================================================================
-- 3. Inserción en tabla profesores (30 docentes e investigadores UDG)
-- ============================================================================
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202601', 'Profesor Titular A', 1, 5);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202602', 'Profesor Titular C', 2, 6);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202603', 'Profesor Titular B', 3, 24);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202604', 'Profesor Titular B', 4, 30);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202605', 'Profesor Titular C', 5, 31);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202606', 'Profesor Titular C', 6, 38);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202607', 'Profesor Asociado B', 7, 40);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202608', 'Profesor Titular B', 8, 45);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202609', 'Profesor Asociado A', 1, 46);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202610', 'Profesor Titular A', 2, 50);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202611', 'Profesor Titular C', 3, 52);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202612', 'Profesor Titular B', 4, 53);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202613', 'Profesor Titular C', 5, 54);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202614', 'Profesor Docente Asignatura B', 6, 57);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202615', 'Profesor Docente Asignatura B', 7, 58);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202616', 'Profesor Titular C', 8, 63);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202617', 'Profesor Titular B', 1, 70);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202618', 'Profesor Titular A', 2, 71);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202619', 'Profesor Asociado C', 3, 74);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202620', 'Profesor Asociado C', 4, 78);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202621', 'Profesor Titular C', 5, 85);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202622', 'Profesor Titular C', 6, 89);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202623', 'Profesor Titular C', 7, 92);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202624', 'Profesor Titular C', 8, 2);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202625', 'Profesor Asociado C', 1, 4);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202626', 'Profesor Titular C', 2, 19);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202627', 'Profesor Titular B', 3, 23);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202628', 'Profesor Titular B', 4, 36);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202629', 'Profesor Titular B', 5, 64);
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario) VALUES ('EMP-202630', 'Profesor Titular B', 6, 84);

-- ============================================================================
-- 4. Inserción en tabla profesores_linea (68 asignaciones N:M compuestas únicas)
-- ============================================================================
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (1, 4);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (2, 7);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (3, 6);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (3, 10);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (3, 12);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (3, 17);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (4, 10);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (4, 11);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (4, 13);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (4, 17);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (5, 8);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (5, 16);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (6, 2);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (7, 5);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (7, 8);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (8, 6);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (8, 8);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (8, 15);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (9, 11);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (10, 7);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (10, 14);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (11, 6);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (11, 17);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (12, 3);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (12, 16);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (13, 6);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (13, 14);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (14, 5);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (14, 9);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (15, 12);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (16, 15);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (17, 1);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (17, 15);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (18, 4);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (18, 8);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (18, 10);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (18, 15);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (19, 7);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (19, 9);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (20, 8);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (20, 10);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (20, 12);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (21, 2);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (21, 13);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (21, 14);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (22, 2);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (22, 8);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (22, 16);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (23, 2);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (24, 1);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (24, 5);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (24, 7);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (24, 14);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (24, 16);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (25, 4);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (25, 8);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (25, 14);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (26, 1);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (26, 4);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (26, 11);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (27, 14);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (27, 17);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (28, 9);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (28, 17);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (29, 3);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (29, 11);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (30, 6);
INSERT INTO profesores_linea (id_profesor, id_linea) VALUES (30, 10);

-- ============================================================================
-- 5. Sentencia UPDATE masiva: Promoción de categoría para docentes adscritos
--    a Líneas de Investigación en Tecnologías Emergentes (IA y Ciberseguridad)
-- ============================================================================
UPDATE profesores p
SET categoria = 'Profesor Titular C'
WHERE p.categoria = 'Profesor Titular B'
  AND EXISTS (
      SELECT 1
      FROM profesores_linea pl
      INNER JOIN lineas_investigacion li ON pl.id_linea = li.id_linea
      WHERE pl.id_profesor = p.id_profesor
        AND li.nombre_linea IN (
            'Inteligencia Artificial y Aprendizaje Profundo',
            'Ciberseguridad y Criptografía Aplicada'
        )
  );

-- ============================================================================
-- 6. Operación Transaccional Atómica (BEGIN ... COMMIT)
--    Alta de Investigador Emérito y asignación inmediata a LGAC de frontera
--    El ROLLBACK procedería si viola unicidad de nómina o integridad referencial.
-- ============================================================================
BEGIN;

-- 6.1 Registro del profesor emérito vinculado al usuario administrativo/investigador creado en M1
INSERT INTO profesores (numero_empleado, categoria, id_departamento, id_usuario)
SELECT 'EMP-99999', 'Profesor Emérito Titular C', 1, u.id_usuario
FROM usuarios u
WHERE u.username = 'dr.roberto.castaneda'
LIMIT 1;

-- 6.2 Adscripción simultánea a las LGAC de Inteligencia Artificial y Computación Cuántica
INSERT INTO profesores_linea (id_profesor, id_linea)
SELECT p.id_profesor, li.id_linea
FROM profesores p
CROSS JOIN lineas_investigacion li
WHERE p.numero_empleado = 'EMP-99999'
  AND li.nombre_linea IN (
      'Inteligencia Artificial y Aprendizaje Profundo',
      'Computación Cuántica y Algoritmos Complejos'
  );

COMMIT;
