from faker import Faker
import random
import hashlib

fake = Faker('es_MX')

# Importo las librerías de faker, random y hashlib con la localización es_MX

with open('DML_Modulo_1.sql', 'w', encoding='utf-8') as f:  # Abre el archivo DML_Modulo_1.sql en modo escritura con codificación utf-8

    f.write("-- ============================================================================\n")
    f.write("-- DML MÓDULO 1: AUTENTICACIÓN Y CONTROL DE ACCESO BASADO EN ROLES (RBAC)\n")
    f.write("-- ============================================================================\n\n")

    # 1. Tabla roles
    roles_definidos = [
        ('Administrador', 'Control total de la plataforma, configuración de seguridad y gestión de usuarios.'),
        ('Profesor_Investigador', 'Gestión de proyectos de investigación, publicación de artículos, propiedad intelectual y docencia.'),
        ('Estudiante', 'Consulta de calificaciones, kardex, inscripción a materias y participación en proyectos.'),
        ('Coordinador_Academico', 'Supervisión de planes de estudio, asignación de carga horaria y validación departamental.'),
        ('Control_Escolar', 'Administración de matrículas, expedientes estudiantiles, actas de evaluación y certificados.')
    ]

    # Defino de forma predefinida los roles institucionales

    f.write("-- 1. Inserción en tabla roles\n")
    for nombre_rol, descripcion in roles_definidos:
        nombre_rol_clean = nombre_rol.replace("'", "''")
        descripcion_clean = descripcion.replace("'", "''")
        f.write(
            f"INSERT INTO roles (nombre_rol, descripcion) "
            f"VALUES ('{nombre_rol_clean}', '{descripcion_clean}');\n"
        )

    f.write("\n")

    # 2. Tabla permisos
    permisos_definidos = [
        ('usuarios.crear', 'Modulo_1_RBAC'),
        ('usuarios.editar', 'Modulo_1_RBAC'),
        ('usuarios.bloquear', 'Modulo_1_RBAC'),
        ('roles.asignar_permisos', 'Modulo_1_RBAC'),
        ('auditoria.consultar_accesos', 'Modulo_1_RBAC'),
        ('estudiantes.consultar_expediente', 'Modulo_2_Estudiantes'),
        ('estudiantes.modificar_estatus', 'Modulo_2_Estudiantes'),
        ('academico.ofertar_cursos', 'Modulo_3_Academico'),
        ('academico.capturar_calificaciones', 'Modulo_3_Academico'),
        ('academico.emitir_kardex', 'Modulo_3_Academico'),
        ('rh.consultar_plantilla_docente', 'Modulo_4_Recursos_Humanos'),
        ('finanzas.autorizar_presupuesto', 'Modulo_5_Finanzas'),
        ('proyectos.registrar_convocatoria', 'Modulo_7_Investigacion'),
        ('proyectos.aprobar_financiamiento', 'Modulo_7_Investigacion'),
        ('publicaciones.registrar_doi', 'Modulo_7_Investigacion'),
        ('publicaciones.validar_autoria', 'Modulo_7_Investigacion'),
        ('propiedad_intelectual.registrar_patente', 'Modulo_7_Investigacion'),
        ('propiedad_intelectual.dictaminar_estatus', 'Modulo_7_Investigacion')
    ]

    # Defino los 18 permisos distribuidos en los módulos del sistema

    f.write("-- 2. Inserción en tabla permisos\n")
    for nombre_permiso, modulo in permisos_definidos:
        nombre_permiso_clean = nombre_permiso.replace("'", "''")
        modulo_clean = modulo.replace("'", "''")
        f.write(
            f"INSERT INTO permisos (nombre_permiso, modulo) "
            f"VALUES ('{nombre_permiso_clean}', '{modulo_clean}');\n"
        )

    f.write("\n")

    # 3. Tabla usuarios
    num_usuarios = 100  # Total de usuarios a generar

    f.write("-- 3. Inserción en tabla usuarios (100 registros con SHA-256)\n")
    for i in range(1, num_usuarios + 1):
        username = f"{fake.unique.user_name()}_{i}".replace("'", "''")[:50]
        email = fake.unique.email().replace("'", "''")
        raw_password = fake.password(length=14, special_chars=True, digits=True, upper_case=True, lower_case=True)
        password_hash = hashlib.sha256(raw_password.encode('utf-8')).hexdigest()
        estatus = random.choices(
            ['activo', 'inactivo', 'bloqueado'],
            weights=[80, 12, 8],
            k=1
        )[0]

        # Ir declarando qué datos con faker, random y hashlib se pondrán en cada atributo en un ciclo for

        f.write(
            f"INSERT INTO usuarios (username, email, password_hash, estatus) "
            f"VALUES ('{username}', '{email}', '{password_hash}', '{estatus}');\n"
        )

    f.write("\n")

    # 4. Tabla roles_permisos
    # Usamos un conjunto (set) para evitar duplicar llaves primarias compuestas (id_rol, id_permiso)
    roles_permisos_set = set()
    num_permisos = len(permisos_definidos)

    # El rol 1 (Administrador) tiene todos los permisos
    for id_permiso in range(1, num_permisos + 1):
        roles_permisos_set.add((1, id_permiso))

    # El rol 2 (Profesor_Investigador) tiene permisos académicos y todos los del Módulo 7
    for id_permiso in [6, 9, 13, 14, 15, 16, 17, 18]:
        roles_permisos_set.add((2, id_permiso))

    # El rol 3 (Estudiante) tiene permisos de consulta y participación
    for id_permiso in [6, 10, 15]:
        roles_permisos_set.add((3, id_permiso))

    # El rol 4 (Coordinador_Academico) tiene permisos académicos, RH y validación científica
    for id_permiso in [6, 8, 9, 11, 13, 14, 16]:
        roles_permisos_set.add((4, id_permiso))

    # El rol 5 (Control_Escolar) tiene permisos de gestión estudiantil y kardex
    for id_permiso in [1, 2, 6, 7, 9, 10]:
        roles_permisos_set.add((5, id_permiso))

    # Asignaciones aleatorias adicionales garantizando unicidad mediante set()
    while len(roles_permisos_set) < 42:
        id_rol_rand = random.randint(2, 5)
        id_permiso_rand = random.randint(1, num_permisos)
        roles_permisos_set.add((id_rol_rand, id_permiso_rand))

    f.write("-- 4. Inserción en tabla roles_permisos (llaves compuestas únicas)\n")
    for id_rol, id_permiso in sorted(roles_permisos_set):
        f.write(
            f"INSERT INTO roles_permisos (id_rol, id_permiso) "
            f"VALUES ({id_rol}, {id_permiso});\n"
        )

    f.write("\n")

    # 5. Tabla usuarios_roles
    # Usamos un conjunto (set) para evitar duplicar llaves primarias compuestas (id_usuario, id_rol)
    usuarios_roles_set = set()

    # Garantizar que cada uno de los 100 usuarios tenga al menos un rol asignado
    for id_usuario in range(1, num_usuarios + 1):
        id_rol_principal = random.choices(
            [1, 2, 3, 4, 5],
            weights=[5, 25, 55, 7, 8],
            k=1
        )[0]
        usuarios_roles_set.add((id_usuario, id_rol_principal))

    # Asignar un segundo rol a un subconjunto de usuarios (ej. Profesores que también son Coordinadores)
    while len(usuarios_roles_set) < 130:
        id_usuario_rand = random.randint(1, num_usuarios)
        id_rol_secundario = random.randint(1, 5)
        usuarios_roles_set.add((id_usuario_rand, id_rol_secundario))

    f.write("-- 5. Inserción en tabla usuarios_roles (llaves compuestas únicas)\n")
    for id_usuario, id_rol in sorted(usuarios_roles_set):
        f.write(
            f"INSERT INTO usuarios_roles (id_usuario, id_rol) "
            f"VALUES ({id_usuario}, {id_rol});\n"
        )

    f.write("\n")

    # 6. Sentencia de actualización masiva en SQL sobre el Módulo 1
    f.write("-- Sentencia UPDATE masiva: Reactivación de cuentas inactivas que pertenecen al rol Profesor_Investigador\n")
    f.write(
        "UPDATE usuarios u\n"
        "SET estatus = 'activo'\n"
        "WHERE u.estatus = 'inactivo'\n"
        "  AND EXISTS (\n"
        "      SELECT 1\n"
        "      FROM usuarios_roles ur\n"
        "      INNER JOIN roles r ON ur.id_rol = r.id_rol\n"
        "      WHERE ur.id_usuario = u.id_usuario\n"
        "        AND r.nombre_rol = 'Profesor_Investigador'\n"
        "  );\n"
    )

    # 7. Operación Transaccional Atómica (BEGIN ... COMMIT)
    hash_transaccional = hashlib.sha256("SeguridadUDG#2026!".encode('utf-8')).hexdigest()
    f.write("\n-- Operación Transaccional Atómica\n")
    f.write("-- El ROLLBACK procedería si el username/email ya existen o si alguno de los roles asignados viola la integridad referencial.\n")
    f.write(
        "BEGIN;\n\n"
        f"INSERT INTO usuarios (username, email, password_hash, estatus) "
        f"VALUES ('dr.roberto.castaneda', 'roberto.castaneda@academicos.udg.mx', '{hash_transaccional}', 'activo');\n\n"
        "INSERT INTO usuarios_roles (id_usuario, id_rol)\n"
        "SELECT u.id_usuario, r.id_rol\n"
        "FROM usuarios u\n"
        "CROSS JOIN roles r\n"
        "WHERE u.username = 'dr.roberto.castaneda'\n"
        "  AND r.nombre_rol IN ('Profesor_Investigador', 'Coordinador_Academico');\n\n"
        "COMMIT;\n"
    )
