-- ============================================================================
-- DML MÓDULO 1: AUTENTICACIÓN Y CONTROL DE ACCESO BASADO EN ROLES (RBAC)
-- ============================================================================

-- 1. Inserción en tabla roles
INSERT INTO roles (nombre_rol, descripcion) VALUES ('Administrador', 'Control total de la plataforma, configuración de seguridad y gestión de usuarios.');
INSERT INTO roles (nombre_rol, descripcion) VALUES ('Profesor_Investigador', 'Gestión de proyectos de investigación, publicación de artículos, propiedad intelectual y docencia.');
INSERT INTO roles (nombre_rol, descripcion) VALUES ('Estudiante', 'Consulta de calificaciones, kardex, inscripción a materias y participación en proyectos.');
INSERT INTO roles (nombre_rol, descripcion) VALUES ('Coordinador_Academico', 'Supervisión de planes de estudio, asignación de carga horaria y validación departamental.');
INSERT INTO roles (nombre_rol, descripcion) VALUES ('Control_Escolar', 'Administración de matrículas, expedientes estudiantiles, actas de evaluación y certificados.');

-- 2. Inserción en tabla permisos
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('usuarios.crear', 'Modulo_1_RBAC');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('usuarios.editar', 'Modulo_1_RBAC');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('usuarios.bloquear', 'Modulo_1_RBAC');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('roles.asignar_permisos', 'Modulo_1_RBAC');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('auditoria.consultar_accesos', 'Modulo_1_RBAC');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('estudiantes.consultar_expediente', 'Modulo_2_Estudiantes');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('estudiantes.modificar_estatus', 'Modulo_2_Estudiantes');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('academico.ofertar_cursos', 'Modulo_3_Academico');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('academico.capturar_calificaciones', 'Modulo_3_Academico');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('academico.emitir_kardex', 'Modulo_3_Academico');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('rh.consultar_plantilla_docente', 'Modulo_4_Recursos_Humanos');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('finanzas.autorizar_presupuesto', 'Modulo_5_Finanzas');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('proyectos.registrar_convocatoria', 'Modulo_7_Investigacion');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('proyectos.aprobar_financiamiento', 'Modulo_7_Investigacion');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('publicaciones.registrar_doi', 'Modulo_7_Investigacion');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('publicaciones.validar_autoria', 'Modulo_7_Investigacion');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('propiedad_intelectual.registrar_patente', 'Modulo_7_Investigacion');
INSERT INTO permisos (nombre_permiso, modulo) VALUES ('propiedad_intelectual.dictaminar_estatus', 'Modulo_7_Investigacion');

-- 3. Inserción en tabla usuarios (100 registros con SHA-256)
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('maria-joserivera_1', 'dario42@example.net', 'bed371148fbe59e2b998d262d76def561408846891327844bb65db1f7c76109b', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('sotomayte_2', 'bernabepaez@example.net', '7ea1bc647bde2f287282b4c05bfef6a483b703185f57a2d5a02dcaf9f4d39aeb', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('vallejosocorro_3', 'tmartinez@example.net', 'ea4ac0621ac41a62627e1a53479001593840c985da11c75fa4b08743db5ff632', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('asandoval_4', 'bernardo55@example.net', '60d2462ca5f8a8cb610a431eb11ce536cc894e7d68e1e6c1495b76f518e4effe', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('josenaranjo_5', 'de-la-cruzjose-carlos@example.net', 'b4c7334e37981b4c09c1768f2666544458c3ac2feff5ef22ddc016900f6bc7de', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('lserna_6', 'itzelvasquez@example.com', '7deaa28d17355598fefb7ce74b95a54046505dd6a62722ddd34e86489741f9b4', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('friasnatalia_7', 'omontez@example.org', '74d401497289a8f997bee36d193e2c347f3eb97178676d8d2fac64d9a7abff67', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('candelariajose-eduardo_8', 'virginia48@example.net', '03b1a2bad1ca92065c9ed6a0bdce8f2ca9e63c721d9d0b86b7edb4f976251104', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('rinconsergio_9', 'armendarizserafin@example.org', 'bdd2f914c4b01ec793f784146e2e4c5d4b21f985deeaf60835ef1f46967ff6c1', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('pilar95_10', 'ftirado@example.com', 'af8d82b5bf17556f214ed20b868e5189d2fad1e1c145e2ac1212072af8429fae', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('vadame_11', 'mmoreno@example.com', '1905a35cac495a64252fb8d3ebfbd9ff16e63f0d42be2c748df3c854c99de60f', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('camilacasas_12', 'bravoclara@example.net', '4daaa701c9560c86bf822361f9215d8b8ef128f4cf7c120ead31739299015c69', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('mduran_13', 'ncoronado@example.org', '53d8e299b794920b6b2d15b61a3b20fb39144ff3bc3171479fafaca26e7e4197', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('renato71_14', 'pilar57@example.com', '03d47ff5c2c7a755db79286aa6d3338ad419e61a2faf90e4f7ed5a7e7b9445f4', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('huertaclemente_15', 'polancofrancisco-javier@example.net', 'e30ae2f42ed331f24651fe6620e473d457f38e91d940d49b913d7f0578241e00', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('lgiron_16', 'wmoya@example.org', '34705995aca45e2d2447f209f9f673669560843a56e008feb88e8e5c96116f4e', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('raquelpadilla_17', 'samuelespinal@example.net', '0263f387bd627922a5db08a480c627ce79ceb2647a57fbc8ef620e405908537a', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('carla41_18', 'mariselafuentes@example.org', '2b2d7cddc0ab4539c5003f3068ddd43c371f80f19abddcc29f4a2e43512ec6d5', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('sotovioleta_19', 'rosamatias@example.net', '2d904f66b1af632d16f988e792aa68a6ff226ccf90469254e072ac1d0b7c9788', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('serafinriojas_20', 'oscarvera@example.net', '8928c5267b3788332c5d2faefcbe67eb966b73aa83c79b3fc4b4d8f223853544', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('leyvaarmando_21', 'paola39@example.com', 'c93db2bb8249d044074a813ba857bb0a8a51e8c88221152700e88567c078be39', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('saucedajavier_22', 'vvelez@example.com', '42bee0fb2d9836a7a758a707d510541ca9990503635fd59aa9d809ebb382add5', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jvelazquez_23', 'dtovar@example.org', '1a1fcc7f6249aa7c2ca61e40858c0b646249568c1ba026ba85341f7c95ef75d1', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('laura97_24', 'lorenzoferrer@example.net', '1f8884649638b1a4ab6569f0a26ade24c91165b415a869dfd9c39b3250cd493f', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jllamas_25', 'erichinojosa@example.net', 'd6aee018ae90666d68c21bc4e57d58387bf10ee5f1159b9e0930cfb9773c65a2', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('rosanazario_26', 'herediaolivia@example.com', 'dea43a159fb9523efa4e144dc4e3b1ecfd0d6a92d0da451b0447531ee9ffab36', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jaqueline19_27', 'santiagomora@example.com', '07fecaa87d9b33548d0947f2d78e35cc1c2c151ff80d622631c0ddcfa14f6bee', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('estherraya_28', 'linda78@example.org', 'a1bbdc29661dccce1dcb42babd6f602e486a7f8637d6055648b47f78d28d2d87', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('lebronveronica_29', 'qjaimes@example.com', 'c5852e0dd545813a9d1dc3a537d445b2887cbfecf30b93ed584ccd433f5d73de', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('yolanda19_30', 'guillermina17@example.org', 'f24e8b03030a8e85cafcd5378713746fb49832b2adafe397f66fca315e0fd346', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('aguilarleonel_31', 'borellana@example.org', 'c8c19ecf97a14c5450734385fe03b6a9a9d1ab82fc6d32de58ad780ed1857f3a', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('vcotto_32', 'ana-maria50@example.com', 'a2d6591efbc9afaa9611cfd3617c37a6cc2dddf06ce5fd684117cc16e4b07798', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('pizarroestela_33', 'mercedesrivero@example.org', '2153828432318ad887434a0454a055187f5a8da7e3c556e1a9ebf28d6ea1be5a', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('celia78_34', 'rochamaria-del-carmen@example.com', '42c6025abdd15677b9bd34e461e3e577f4a154dd6f71286c42e804fbbff858af', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('villagomezangela_35', 'jesus56@example.com', '46ceff3e623ba683e11eeef1d29f66b2304f802a970f47b2f1623b0ffa87bc3e', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('minervagodoy_36', 'florencia63@example.com', 'c2d129b67cb88a6d4c390e5b06f188a404d0cda9a7e0650ccb557c7e8972d1b3', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('lourdes89_37', 'patricioberrios@example.org', 'b7ebfa4ee3a4d6e90d9f3a21f7b8a04e5c2cb99e014ce8c39802cd0d5baf68d3', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('reynosorafael_38', 'gracielaresendez@example.net', '9dee408acf6d585c817fecc5a9bfd2a4052238193321be85901c655bfdda713f', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('carriontania_39', 'jalvarez@example.org', '9d17a6adc85aff3742d8e760953eac098e9ba652c436200c62ca9e5640e20591', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('monica12_40', 'rociomurillo@example.com', '16389569dc5a0c2cec8898cae14afa60cb60ef4daaf70c492e33b16f7eeaeb65', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('colmos_41', 'adalberto02@example.net', '44d797c664142dcfe4ca60c46a48257a81f2c8d2b4ebb87587f7c38c7b6d1996', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('serafinrodarte_42', 'alonsoceja@example.net', '0a6d05d9f8edb11d794018aef28c07a1cfb6e50c145918df8d54eb5bfea6fc1e', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('dulce44_43', 'xcarreon@example.net', 'a737249a38f099bceed458e3daffc1354b76281b4ea92799276885bbb9340bf7', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('amalia43_44', 'federico55@example.com', '90c86eea42662eecf298eceeb3af35143dde8971b20cfd014816f7f115590d47', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('mojicagabriel_45', 'yvanegas@example.net', 'aa381fc546cf38871ce51c93eaaadefc0d1851002575eaa374b0f0bc02da4f36', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jose-manuelcasas_46', 'reynanancy@example.org', '5ffcc8385c16310c38f2676feae9b06aa0614d019b78b3a6a40c0c2f85c06d16', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('lapodaca_47', 'eveliochavez@example.com', '02e762f0f7c91e0e4806d4d25a2816055d5dee7384b85079baf59edf4db3b908', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('tejadazoe_48', 'dalcaraz@example.com', 'b446ad30644c5a08bb999dcbd10836ab5c01df561f8abbb84fa7bcf28e367bab', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('maria-cristina25_49', 'dsoria@example.org', 'a3eec801dccae61e082592c405c5f17514773fe828411872fe11582dbf24363d', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('lsuarez_50', 'zmontenegro@example.org', 'c45952d4fa72d327d02f283d9c0624db441de58fbc59839ac98688b5ac859616', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('arturorazo_51', 'alejandra57@example.com', '16fc10e8c589bf7688b90185401efaac2bb9641197a8f0317d96f3aae5c0a9f5', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('pinanayeli_52', 'jarevalo@example.net', '325d7a3ad0e70e8ac96c3098a6673f721145d0a8ea4cf8188a4ffeb5d8d46c53', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('gironmarisela_53', 'virginiapedraza@example.org', '87c07a8d11ded7719ae833d849807543c95b0fe66d82b556a18ca5009add5eca', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('cuellarsamuel_54', 'olivia15@example.com', '8b3efcc331521827df315a78cdf7eed41a568183a6bc05d6dde8b5f189d32564', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('hugo10_55', 'josefina66@example.com', '1cb1bc845cbce4b5c0ae4979308097519decc30e45e999c03ddd71f1005c5c52', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('miguelcarreon_56', 'ytrevino@example.com', '50cc2277239a9599af982e3d8c1b1905a550417449b3bcb055c730a278897044', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('lesparza_57', 'davidbaez@example.org', 'cdb156b076123a2c9c854252dfec7bd53c58ae7108ff0e3a45c5467c754d1b09', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('carrascoalonso_58', 'concepcionalcaraz@example.org', 'b372eb5fcf6897fcc037329daa5e1d55fcd9c15908163f4f3c03a0b13d51ed60', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ngil_59', 'menanatividad@example.net', '740f962edf206534e1e5deb2bd04d04d51c01bfa5fe8d0204c899f98601ea016', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('antonialaureano_60', 'quintanaevelio@example.com', 'f5a4b65117024bcf901efa0d42a82768c5020c643bd8154866542dc56d411188', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('eroldan_61', 'gastelumjose-carlos@example.net', '2149e6e8dde53c8def5b31c1517f08cc89d909e5946602b5de7fa51cc80a1065', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('dulce-mariaalva_62', 'sriojas@example.com', '0c152adac716bd046d53ada77f2d110f7a6ac4f8c72518692155f8566d882c36', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('diegoguerra_63', 'alfredomarin@example.org', '1038e3f75d8fc07db263e355748cd7c2c17b065621749844a6ae835c762544d9', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ballesterosantonia_64', 'enriquequinones@example.com', 'e2752a025a88c4f0bdff26cf200880aedee390b4a262b18a252cb4083f0dffb0', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('floreznorma_65', 'violetaloya@example.net', 'ee9d433af9410416ee343388fc91651284a1d45e431859d04bb05ac7afdf8165', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('leonor55_66', 'pedrozacarlos@example.com', '346bd4cd5cbe1197171d1a14d26fe4a29798b4ecaf1086e28506b7c6165dca94', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('diegoposada_67', 'zapatajose-maria@example.org', '2d69ae500a0e5e7a7839a840b838f6d7b5c5b627a924e6cc44ae7ef1b4d1e393', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('solisjuan_68', 'juanahenriquez@example.com', '4492462c637965d556c9073ab58a7bedcb34857e3a98338e5a518f4ca872d8e9', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('alejandromontanez_69', 'ferrerjuana@example.com', '639bebc19c30badcc49b6fe00f17cbe0fb2608339941ddebe33c5403f86a9074', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('virginialeal_70', 'augusto59@example.org', '0c8739a46e738a741178aa46693ac4c8e11be13a5d4f59e542f7c8a8397c0137', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ugil_71', 'crivas@example.net', 'b0b098f46c511d0359909bd8f6b79dc80ebe2d26347a4c421243f223c2bb3f3f', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('anagranados_72', 'rflores@example.net', '75e7e663feedb9823c6d534fc454931f98bbb109ac2a4be58493bed0f653c23e', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('luciofelix_73', 'martinezcarolina@example.net', 'cf83a6b5f4ab47e051599661464e42cc531ecc314ad4e1680d15ab2d285b6207', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('nmateo_74', 'arevaloemilia@example.org', 'a57c028b86b39d5228d7574469e37a7bf5cfb3a0686e2c58e55e2dd7d27fe6db', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('suribe_75', 'cbenitez@example.com', 'a32335535eed53595812797390c1285775a1990e5d175a301ae7538f298ec588', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('deliamedina_76', 'eolivarez@example.com', '27fa816fab7caf1b93d49cf6c8d651ef325d5cc014d600e9277b50dec7c6609a', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('lemusluis-manuel_77', 'uburgos@example.net', 'd4063f1c92bd96dcf6ca960f36a8e0bfd41b0f4f1c8562b68fdfbc62d59ffd56', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('irizarryalejandra_78', 'trinidad12@example.net', 'be9d3a25356d89617d0c47cc81cf62a9de02bc895c332e940ba6ed8205dbd8e0', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jsantana_79', 'jose-mariacorral@example.com', '1c981776ae73f5cfc46a659f1a3492b7741ca1a78d70ed4bbb476e5a46613ca8', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('julioocampo_80', 'de-la-rosapaola@example.org', '287e1e14508cc316b827a0c95889d2f05993bd2e4123d1444a5d7ff7f33de7ae', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('hector45_81', 'nataliadelgado@example.net', '4ab853e5bb396437f0067ec4d103d7cff831cb283aae1d22fad43b0dce0b234c', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('magdalena32_82', 'cabandiana@example.com', 'bbe89b975e313fab417931869c0b0f28e60eebe78a9974f8bab51bd9440fe620', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('dsepulveda_83', 'marisol06@example.com', '5b7a3c5a251cb3424e241d764d022395f144eeb133ce5da2f8d0a90b40d00f4f', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('fzedillo_84', 'camila75@example.org', '85abdf311c2c2c1046e4190fd0f58b90376365e2c2a3083b34cd5551cf0866a2', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('moraeloy_85', 'elviasanabria@example.com', 'decde43cc7101dd6d020d01d816839091b850b4317c89f4aacdeaa60a38dacff', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('estevezlorena_86', 'diego66@example.com', '9fdbcce03cff11660aaaf2c758f3b04b91adab320504e1db0ef70ddbd9b191a7', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jos25_87', 'rene65@example.net', 'd825c39a7e799570e8910ae4fb90f92792e246fa4b218fa9b5e7e6f73867ff5f', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('raquel27_88', 'ignacio44@example.com', '69a295dfabaf20b42269d49a0134f616ee539ace8d29f9cccb0b57bf41cdac11', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('colladooscar_89', 'gloria45@example.org', '462c4d481c0944c5b88f948fa5b2f9fe722d00160e4c42f42caf008db2d39462', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('yuridiacolunga_90', 'tvillegas@example.org', '7011611158fb75ea96007985dc13789c669be01ccafcbea01b530d3aaeaf4355', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jacintomata_91', 'jose38@example.org', '9f46c8e04a000ef567870003e7bbce2945114d710d833d87a71ef89c441f6eff', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ibaez_92', 'verduzconorma@example.org', '15e89edbe00bf71953579483c5ceff8312e347eddf5022280e15e88dbe12823f', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('marcelaojeda_93', 'jholguin@example.org', '1186daa74c84801d0d4347adcbcd25d4e8c4693262c88be337ab72b6e9919f70', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('gilberto20_94', 'benavidesariadna@example.org', '418787490694020171cc080d05dbd5339c074b4473a74c0bc36e853908866480', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('uriel76_95', 'iulibarri@example.net', 'cfe0ed6016a13efb1064f80a6badf5ce7214023c607f141038cb08c065c7031e', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('esparta33_96', 'carlos03@example.net', '46b7ddde42e27b90e273ad271c07da2a98ca8cc969fbca545ea7051784236a2c', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ireneteran_97', 'tcaban@example.com', '160ca79ca4e665e2f843e1189e473560e50a287589fb0cf97fb378e113814188', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('paezmicaela_98', 'cvelazquez@example.net', 'b3e93fd958cd0c70d74035252711c30d753ddf7fd0d14ff59bfb7aedb631d53b', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('kflores_99', 'ortaalonso@example.org', 'ddb2760c0bce272c207070ca6314343ec497b0a0f2ee419a813a63c291bb7983', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ricardorincon_100', 'clara33@example.net', '12504eb6705b6029e66ac0df925fb1aacd5ab8ff1a5c2c7d4f57a37dd475ebd8', 'bloqueado');

-- 4. Inserción en tabla roles_permisos (llaves compuestas únicas)
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 1);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 2);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 3);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 4);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 5);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 6);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 7);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 8);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 9);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 10);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 11);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 12);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 13);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 14);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 15);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 16);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 17);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (1, 18);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (2, 6);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (2, 9);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (2, 13);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (2, 14);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (2, 15);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (2, 16);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (2, 17);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (2, 18);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (3, 6);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (3, 10);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (3, 15);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (4, 6);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (4, 8);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (4, 9);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (4, 11);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (4, 13);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (4, 14);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (4, 16);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (5, 1);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (5, 2);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (5, 6);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (5, 7);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (5, 9);
INSERT INTO roles_permisos (id_rol, id_permiso) VALUES (5, 10);

-- 5. Inserción en tabla usuarios_roles (llaves compuestas únicas)
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (1, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (2, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (2, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (3, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (4, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (5, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (5, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (6, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (7, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (8, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (8, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (9, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (10, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (11, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (12, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (12, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (13, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (14, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (15, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (16, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (17, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (18, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (19, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (20, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (21, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (22, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (23, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (23, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (24, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (25, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (26, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (27, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (27, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (28, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (29, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (30, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (31, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (32, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (33, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (34, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (35, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (35, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (36, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (37, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (38, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (39, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (40, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (40, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (41, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (42, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (43, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (44, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (45, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (46, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (46, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (46, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (47, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (48, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (49, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (50, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (51, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (52, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (53, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (54, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (55, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (56, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (57, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (57, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (58, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (58, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (59, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (59, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (59, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (60, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (60, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (61, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (62, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (62, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (63, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (63, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (64, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (65, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (66, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (67, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (68, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (68, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (69, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (69, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (70, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (71, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (71, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (72, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (72, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (73, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (74, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (74, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (75, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (76, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (76, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (77, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (78, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (78, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (78, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (79, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (80, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (81, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (82, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (83, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (83, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (84, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (85, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (86, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (87, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (88, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (88, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (88, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (89, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (90, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (90, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (91, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (92, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (93, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (94, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (95, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (96, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (96, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (97, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (98, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (99, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (100, 4);

-- Sentencia UPDATE masiva: Reactivación de cuentas inactivas que pertenecen al rol Profesor_Investigador
UPDATE usuarios u
SET estatus = 'activo'
WHERE u.estatus = 'inactivo'
  AND EXISTS (
      SELECT 1
      FROM usuarios_roles ur
      INNER JOIN roles r ON ur.id_rol = r.id_rol
      WHERE ur.id_usuario = u.id_usuario
        AND r.nombre_rol = 'Profesor_Investigador'
  );

-- Operación Transaccional Atómica
-- El ROLLBACK procedería si el username/email ya existen o si alguno de los roles asignados viola la integridad referencial.
BEGIN;

INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('dr.roberto.castaneda', 'roberto.castaneda@academicos.udg.mx', '2ba24bef936df676b60d4d6af12944b1524177362ea0c2d6005b5dae1b33e694', 'activo');

INSERT INTO usuarios_roles (id_usuario, id_rol)
SELECT u.id_usuario, r.id_rol
FROM usuarios u
CROSS JOIN roles r
WHERE u.username = 'dr.roberto.castaneda'
  AND r.nombre_rol IN ('Profesor_Investigador', 'Coordinador_Academico');

COMMIT;
