-- ============================================================================
-- DML MÓDULO 1: AUTENTICACIÓN Y CONTROL DE ACCESO BASADO EN ROLES (RBAC)
-- Generado con seeder_modulo_1.py (Faker es_MX + Hashing Bcrypt $2b$12$)
-- Contraseña institucional por defecto para pruebas de Login: SIA_Udg2026!
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

-- 3. Inserción en tabla usuarios (100 registros con Bcrypt $2b$12$ y password default 'SIA_Udg2026!')
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('aidanevarez_1', 'bvillareal@example.org', '$2b$12$SYLTnBTX8NbivCqkUIld8.kjFt7mF7kwTL8LoCb/tli5Fb363EpUq', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('paguayo_2', 'reynablanca@example.org', '$2b$12$0WM.lnmZhXUa35pZKN0mROjZmwuF0q2YwoXHcwxMUcP1GbvxtRfmq', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jcruz_3', 'hgrijalva@example.com', '$2b$12$mWKprtrttN6.cbLwTW3YheWAsybw1UuJJu0lDI3gftSNM.L1z0G7S', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('manuel15_4', 'xsotelo@example.com', '$2b$12$fLCSsc2n/YQrDaYoaW469evNYQ/yeivSS9QogEQSUB91ikKaeDbzq', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ctapia_5', 'jose-eduardo63@example.org', '$2b$12$UQqVzA9DkaTYGfNc/DPQQ.dmNHZbcA0wAZDiDoiHbacmjQFCMU8dq', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('arturotejada_6', 'isabel80@example.net', '$2b$12$pSxextjllZhaeStDWB3EHeYAMj./ohXIsFq/bKdpsKRIovva8skaO', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('isabel66_7', 'oswaldosolis@example.org', '$2b$12$ReK5eLpkwcQawhNCABwGVuyGu7AUdXVRgRI4mrLXHIv1VjhZF5TJC', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('otejeda_8', 'victoria60@example.org', '$2b$12$VIfMS26o9TozqF54VF6eIOF8IbXoM4Tm9E.ZXrwnhTCV5gaJ13qai', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('montalvoelvia_9', 'magdalenaadame@example.com', '$2b$12$hgpXImnV7DuLsMxCIOTNVe99yBj0MlCy5tMM.jLX1ciYFdp4buoGO', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('cristian21_10', 'zacarias63@example.com', '$2b$12$upK3dsfuYVziC2H/BeShpOe0AaGtigo7GJSknAN0HQzNWlP3b81oe', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jesuscanales_11', 'martin61@example.net', '$2b$12$0ThLacuBK/OTpU2fqvVs4u2n27qXCJLVfYEU.LWSzlabWYtJjyaAu', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('toledocarmen_12', 'valladaressalma@example.net', '$2b$12$l.hGxR0Np0PcM7CgMZGcFeGX1hNQurCU/9Wwnr0cGDcdXaYYJUVa6', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('fidel63_13', 'paola34@example.net', '$2b$12$0yPoVAUibgXqiNizXVkEZeUvf1MfiqA5pyUTtEZvH2Us9npbduJsC', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('abigailrobles_14', 'brisenojoaquin@example.org', '$2b$12$42m9QFgLjXNuEdAo2nNQIeggvgz8kz6jwMeWIDoNIn8rJulvVYx0C', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('alfonso72_15', 'ortegasantiago@example.net', '$2b$12$9HPO5UR5OgUfwMOF2uHtp.pt.ym0haV/lHCUw5p9TBo6YxZdMPZly', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jesus02_16', 'abraham04@example.net', '$2b$12$1/mVN2XhIQDxJ4jVWNPMr.Mu7JpKflShW0Zgm/WdcR8XtPr2eF9S2', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('qrivero_17', 'tconcepcion@example.org', '$2b$12$sWdMxxN9g2QHyopa9hlbhuY/lqKgcfVGd8Tyj91YS8e8uStP2mXhy', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('rosorio_18', 'santiagoperalta@example.org', '$2b$12$qE9bCBw/agYMX4H81/G2cuKWAtV0ZQr5twu5xUVwh0YUsywL7Sftm', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('loyaleonel_19', 'julio47@example.com', '$2b$12$Dswrel7h6eKso4cm7.0cBe0dMcSR0qrOwlK9ZZrwqb5VK/YVNqmgO', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('mercedesgodoy_20', 'aguayoabril@example.com', '$2b$12$iT7LTW0TKK3XrDOe2hi/aup9M18bomNW3oKQIHNgsbKdRGiVTeWM2', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('alfredo33_21', 'espinozaamelia@example.com', '$2b$12$FCaRLyELBrOXPSK66NlIUODVUMJ6zfKCvTuSdaqzS9GpIGZHqajbe', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('mcortes_22', 'diegorosado@example.org', '$2b$12$KUHshsbUf0473P/Vw22ugO0ATUZrZTYFTihENFi/FGtKIGn/k0neu', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('esmeralda61_23', 'octavio63@example.net', '$2b$12$CAO71gEpkRD9ti3RDFa/NO0RSlZUu78upeMJ7mLPPRIu3Exh3EQ2S', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ferrermaria-jose_24', 'nancygurule@example.net', '$2b$12$pi61RlIMj0LRIzJnjKcSBe2pY6R.U4Jpj.n5u7V1jhVB/1tLnOSdO', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('salinasadalberto_25', 'andresenriquez@example.com', '$2b$12$qeaYxBrrZltjjdapjWLLjuVZVtxMnmE2rx3XZgu13v2vsS7nsHTs2', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('sessa46_26', 'montemayorjorge-luis@example.org', '$2b$12$oxjJJ3UBhLy5O7eD9Uj8.uQupdW824l5bl.K9MV7.Wi.GvL93nyga', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('susanaalfaro_27', 'bertavelasco@example.com', '$2b$12$4nolNqEmyyxgxU7Y19tqfe3IEKo.YPxdYYACqwJWlLWjDFEhXEshK', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('dbadillo_28', 'pablodiaz@example.com', '$2b$12$FTj47d.Tak0Be3UQAn2qGeoiFHBw53/MzkvbojgzAjr/dlSTgbTs6', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('molinaclara_29', 'becerramauricio@example.com', '$2b$12$7tPNBa1RnWy3T5TPv8niQebnpzn75QrDj4F/OTxN3x3sqzgIFxGPC', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('serafinrivero_30', 'roybalwilfrido@example.com', '$2b$12$.fwpPpZRFWo8peBSjTtKaO5qM4aSh3/L59/PyvKueRrUGBp59kEBa', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('noeminegrete_31', 'wotero@example.com', '$2b$12$4QO9iDy6WE9jkmcvEyZQ1elXA.mYwIsNkb1d9EbQrWF8cvvwtWpqu', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ibarraluis-manuel_32', 'abrahamaviles@example.org', '$2b$12$nHDF6Mk/kuREEq/MP3Qf/e29eOvXJPur9BIKjsCUYxXvoQ82kGNqy', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('cantujonas_33', 'partidaelsa@example.org', '$2b$12$O9nj45NiRb6KRUVR2QnVge3ulhhTD6F5IvWY6.6nVoLQkA3a0GDI2', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('abelardoroybal_34', 'silvia12@example.org', '$2b$12$RI6OatmbxHtDqEVt4P3ni.g70bqIGcFz4J5QTpG/M7m1qkiMaMJt2', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('andreareyna_35', 'rolandorios@example.net', '$2b$12$0/3kAgUbLkzd6axwdaAXG.tyfG57rsRM5zW2kh3V/Oz5eMaIMKNK2', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('nataliahuerta_36', 'martincalvillo@example.org', '$2b$12$2TIT5FDXS3NRwGwhDxXdgO/0Bly1EBrHgJmuqw3s6szKdFKjFPSki', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('rosalesdulce-maria_37', 'rafaelterrazas@example.com', '$2b$12$Pgvw3kiWnpU41AEsD/NdYeZPWYrz1UtJaUMD3L45Y6FyfQLeSs4f2', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('clara28_38', 'maria-del-carmencavazos@example.org', '$2b$12$KGZ.sk02AM6lCbcutY53NuptEHUeaMJBeFz0CjBejhaYeYE4zk1kG', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('rosario89_39', 'maytealfaro@example.net', '$2b$12$8/qR.zQMtfEbTfcdrk2i4uu5IAL3DXVtXyIjR8/f./Tx5gilDjh02', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('qcastaneda_40', 'mitzy64@example.net', '$2b$12$p30ybV6zdhA6upc3qseXeOfaSN4ySrvso/MqvNIEKK8nY3MVvTIRy', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('armando20_41', 'marco-antonio50@example.com', '$2b$12$54/ogPUeO9HknuUfLPh8j.0XPhB5c4TrgLCCZzomBNeQCsiuIf5MS', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('barriosguillermo_42', 'eserrano@example.com', '$2b$12$ZTXGrVqNvy1axeFc5NL8b.NQL0WROhaRAEHFdg4JCCj7UalHhLXBC', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('juarezmiriam_43', 'nochoa@example.org', '$2b$12$SImTykuEHFGlog956IwJ8..YMIJZsw/jgcCLGf7m9g1sRJYz0KZua', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('quirozhugo_44', 'aracelimelgar@example.net', '$2b$12$2zojjAYuamECkWT/bkZpj.DKA0RX5zgM0nTTbidZGemPaKKdlASGm', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('minerva34_45', 'velezrosalia@example.org', '$2b$12$FJiaE6LTSFNtd0blW8077.AEhipAfrS6Cdwh.cXi6kKW8Km9/Q6DW', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('luis-manuel07_46', 'cristianhenriquez@example.com', '$2b$12$IW6zKNorP/9AiFEKDLSCUu1L6Hr2pNVDb/ihK8wfEX4pVv0SIgMo2', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('asuncion12_47', 'rene30@example.com', '$2b$12$tlgbdhBINNB6aZ9.jY8sYuwyhhbX4c6Ptj5R73Q9LCiK3bpvN43lC', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('asuncion45_48', 'nayelimanzanares@example.org', '$2b$12$JCwjMA7F/AoFrNtOYkwT..YcX/n/18C1WikW8di7s9BEiblACrsju', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('riojaspilar_49', 'calvillomercedes@example.com', '$2b$12$xB13I48j7/37eNWhlpNUPeItPD0sKzhNb3nRYBPvdb6/KVCTG7sku', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('noeliacarrera_50', 'benavidesadan@example.com', '$2b$12$RgsVuhQW5fhvEt08mw.GYOJGb2J0RXMz.6ejfiSFtJpQIyaTom.3C', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('medranocesar_51', 'helena23@example.org', '$2b$12$NGy8KA0sctD/hs1eMc8Xauak3x2ocJ8GEIynQOj9fz61RP5XjH/gO', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('pinaasuncion_52', 'mariselasoliz@example.org', '$2b$12$lIiePZnaPW73sDetcw33ueE4f9V1g62xw63gOJuLaKBEMurFgqi/O', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('zpelayo_53', 'zcedillo@example.org', '$2b$12$M6A8hn6cU/oH5e/QTA7dXukg7jY0YfNgcuDODyE.iP5QNvUFaYDo2', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('fraya_54', 'gonzalo60@example.com', '$2b$12$ELUFG3QdphdNRrvKCE8Gp.9QvgFvCpuYO4Pr2bXKwlStNSVbna2wi', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('guadalupe96_55', 'tejadasocorro@example.net', '$2b$12$g3b3oNSYOcOpn4RosfF70uSt0qfQCYaVwWec.IeCDjVWLnTGq623i', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ortizmarisol_56', 'bgarrido@example.net', '$2b$12$P3xMTSbaiyiJbgQrzlozd.QKgzt0O0nyQeU/nZ0MNIMshie4QVdAC', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('grijalvamiriam_57', 'estevezjulia@example.org', '$2b$12$NMKnVVWVAxzjKT5ftiyJCeejU5gcfJsky1InU5TxuwewNDIdYd8YK', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('camilaurena_58', 'nalvarado@example.net', '$2b$12$7HKKFihgJdVMyP5283JB0eqce12XekOa6SYAtdv1.ZfpqS1phB2cm', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jaimesclara_59', 'armando94@example.com', '$2b$12$A9pOuiOVhrF.HHo1iH4TjemWQrhZHcK9vR7m8BsPj/lBzVT/XEwju', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ariadnaveliz_60', 'cardonalinda@example.com', '$2b$12$snm6xoO8OFzhu40J6/DUa.pjhfupbMqkcxxebS20QGL.XGGnmRjOW', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('anaurias_61', 'strejo@example.com', '$2b$12$udf1S8QF0TLQIJGA3orJTOgmTkMMa2g.5vPl0X3lDggodfwi6WitW', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('benavideselsa_62', 'agustinalonzo@example.org', '$2b$12$1pUUzkuP0e7NSDCIIPQUnOWZWEeC.HntZz9MmFAuqkyk/wHmMGnqW', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jdiaz_63', 'citlali58@example.org', '$2b$12$ql2DaWcvpqLWPwJ0DyJjHugLOJ18sC23Sf3uvsX4jDqMgAlIxR2XO', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jde-la-rosa_64', 'teodoro52@example.com', '$2b$12$ND7q2dXKzPRwdCn2xtWYf.DMY83CcuRapE4a.oO3YcNSvb/XAIEh.', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('lucas41_65', 'espinalmaria-luisa@example.org', '$2b$12$.0O915QI5InQGYiUvCVsCurxSjBpNWU1Si7yE7HswGgfT75s6c9Qm', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('imeza_66', 'rasconarcelia@example.net', '$2b$12$/9SqQHCfjMDwV2Ku691p/u2yGIWwfIX8IAQBHUFR6vz8Vi9HCNkki', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('felixbeltran_67', 'acunacelia@example.net', '$2b$12$a.6B/jQSGezfcnmgiTv8XuG0HYDIzAYS6uYfSG1zJfs/yvmhXCXQi', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('romoreina_68', 'marco-antonioleal@example.com', '$2b$12$oEslw07KPLldIBuMztgeH.2.yOIdYcXqC1FKS8ZU/is.jTUC8bQKS', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('nsandoval_69', 'gabinozarate@example.org', '$2b$12$OgZv8h8Y3EA2f8DKWf4ive2K9xHcj5vrzTjnlnkAaFnC2XpIPp7jW', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('pichardoisaac_70', 'juan-carlos82@example.org', '$2b$12$kYkUJ.677341RPDfrCZndu.CS6.Z4rp3iH44vJAz06xMvmcA57oc2', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('saldivarfernando_71', 'indira06@example.com', '$2b$12$G6LtrBvuPOsDcwLxnBrim.Yn2mXbyUeSmchIJ8vt0vYhsRSAtL8Iu', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('pleiva_72', 'kde-la-garza@example.net', '$2b$12$yBmgS94okPlh0GldTERbz.QWYI54NcknGlTiTVq4RWque2CbVMf5q', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('oswaldoriojas_73', 'aragonfrida@example.net', '$2b$12$PQkDzSwxaU3mulNNLFQZt.zvaypeeVw3/iLBDEhtUJno8rVw8leGq', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('mercedes70_74', 'aragonpedro@example.net', '$2b$12$PHjjoDxArG//2qaIRpt6P.3gNTpA5SdCNPzphNfa.TOunzVJH/MFG', 'bloqueado');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jeronimo12_75', 'josefinabonilla@example.com', '$2b$12$vEf.p79XYlQ5AD4a0vVx9OJKdHhI/bNDtTKYVfZboq.nWIBszbS9W', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('julibarri_76', 'miriamamador@example.net', '$2b$12$eiNWUfneFQ5OLNFg6rdhTOoFJwST.hfQ8YO990cmYwmxTdLTBt.N.', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('diana06_77', 'matasessa@example.com', '$2b$12$cUPXLRwJxLW2u5j8JGNt0.GcmIFU8XXnUPShuZht.kHM0fpi61tHG', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('maria-teresa55_78', 'gustavorodarte@example.org', '$2b$12$hVt//6No95mHnYyxiMv99OyXTyaW8HuL.BAY2ICszhp7XHMxpzUTq', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('hlira_79', 'anabel76@example.com', '$2b$12$IAHPDEO7Qs.HstkPORmQZOCn3Chm4Fez9LfePtQyThbO905qIQyxO', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('fernandezclaudia_80', 'nmuniz@example.com', '$2b$12$k1OJLF.Z73i1fsaXrumTCOieNC229MaV3WjmQu6QoOPi2LBnl9CVC', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('hugode-la-garza_81', 'adelacazares@example.com', '$2b$12$7LlKt/cEjuMf3/G/aNq0lukrUmfJQZkycimaeJzrJNztZ.HMDqY2W', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('gabrielavillasenor_82', 'aledesma@example.com', '$2b$12$swp.ev2cEKtyeRhojEQ1lOhiIqfdPekows0Bxy8BjWZvtnqYtsoJ2', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('serafinbaeza_83', 'benavidezmarisol@example.net', '$2b$12$mBrSO1Gy7KAKZ.VinjfR4OeYwrOEStI8Cq1PQbwbRmvsXdeM.8K0y', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('raquel11_84', 'padronmaria@example.net', '$2b$12$rgXMmCCQi2D1biB2nUCipef41ECHyTkIcs4jS1tK6clz8PUwkejOK', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('vmedrano_85', 'trinidadbarrios@example.org', '$2b$12$aE26kBXUK7xuetohsLD.Z.48t31PxtZSG5Wungh60zxWarEX3PmPW', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('joaquinrobledo_86', 'rodrigonajera@example.com', '$2b$12$lwMrEc9TwMoWWunXbs30FuhH3wLM5WDUw1gM76QGGITbup/3Zvxjy', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('esperanza70_87', 'yvillalobos@example.com', '$2b$12$/ViKToW9XfxDj1pMEIh9nOnvpOIwckxMz7Lck42XiInDG.Rk8lZLW', 'inactivo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('wcrespo_88', 'karla44@example.net', '$2b$12$S5YFr5iE5ULxtbI5QRALTOQz3LufgvfLwJcCXSy6h4sDt5bDYfu5K', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ortegasalvador_89', 'concepcionnava@example.org', '$2b$12$SQoEszTkb9cD1spfmfARIuzPIDyNisnKKl6dgGHD7l5Eimn2n0uLG', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('fridajuarez_90', 'umelgar@example.org', '$2b$12$.0Eg2goIjWvB0Nf.6m78oet6kNhndWP55Gr3hDbZz7Bg89VQ/nfKy', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('jsalgado_91', 'elias84@example.org', '$2b$12$Hh9F3HxVFJVn5nokrbV.C.y46iwHu5GMXEOQgdvVyiWmf0uorpT56', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('balderaslucas_92', 'monroymaria-cristina@example.org', '$2b$12$PufC/8Fpli33UTV.nJLkSO2Edu3nJpG0TSw8obk1Dt7kbmqxHpANa', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('mitzy17_93', 'kbarajas@example.net', '$2b$12$9r6X7Is3xr5qVD0M/QqhnOWzaPlM6lwUwohkxZCJwi4U9tfyVr626', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('zunigasilvia_94', 'saraaparicio@example.net', '$2b$12$lhzKGlOrGmbwQfNegkb6uuLVw1s3xQDqO9sXTajgiFFouMvjW8HVe', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('rosaliarivas_95', 'tapiasessa@example.net', '$2b$12$wcLMxs6w/m91C0jL40nr2.T2IpH4h46GeDC5ZBRKyMPa6gbey2PoC', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('espinalana-luisa_96', 'corneliorodrigez@example.org', '$2b$12$i7rA/YL7poByrMWQv3FEi.3sVdXYDkSxnL8vsXH66MSZ87s54J3aC', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('gonzalo90_97', 'rangelraquel@example.org', '$2b$12$80HxxpON74mLTNVSmw.o6uc0ghFsRuG/oNt6avbLcEs4dWu40Hc3y', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('ccorrea_98', 'mauricio74@example.net', '$2b$12$/l.l3.m8i6rmLL77TbP8YOGpMNyT3mTwtYJA0z1fe9IhtyBmcbCc.', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('lourdescotto_99', 'vestevez@example.com', '$2b$12$MSXGWLRsjUS2tbf/SFxKI.wUjtZ4mqpBjygwipJRF9GNHKtV7Japi', 'activo');
INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('soledadnavarro_100', 'carlos32@example.org', '$2b$12$zx7fuLlWhuA3s3tVmFk3XeYFUavhol2eBvCOPAspCfIWsoFLMDRxm', 'activo');

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
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (1, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (1, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (1, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (2, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (3, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (4, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (5, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (5, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (6, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (7, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (8, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (9, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (10, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (11, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (12, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (12, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (13, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (14, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (14, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (15, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (15, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (16, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (17, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (17, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (18, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (19, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (20, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (21, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (22, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (23, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (24, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (25, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (26, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (26, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (27, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (27, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (28, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (29, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (29, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (30, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (31, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (32, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (33, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (34, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (35, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (35, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (36, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (37, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (37, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (38, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (39, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (40, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (41, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (42, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (43, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (44, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (45, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (45, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (46, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (47, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (47, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (48, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (48, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (49, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (50, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (51, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (51, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (52, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (53, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (54, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (55, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (56, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (56, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (57, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (58, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (59, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (60, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (60, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (61, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (62, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (62, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (63, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (64, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (65, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (65, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (66, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (67, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (68, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (69, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (70, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (70, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (70, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (71, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (72, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (73, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (73, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (74, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (74, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (75, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (75, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (76, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (77, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (78, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (78, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (78, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (79, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (80, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (81, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (82, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (83, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (84, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (85, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (86, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (87, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (88, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (89, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (90, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (91, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (92, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (93, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (93, 5);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (94, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (95, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (95, 4);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (96, 1);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (97, 2);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (97, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (98, 3);
INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES (99, 2);
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

INSERT INTO usuarios (username, email, password_hash, estatus) VALUES ('dr.roberto.castaneda', 'roberto.castaneda@academicos.udg.mx', '$2b$12$zjIStNGiqp91Vyx/Cv8ftemqAufuRRAJngsCP83Z63UDdBydLHxle', 'activo');

INSERT INTO usuarios_roles (id_usuario, id_rol)
SELECT u.id_usuario, r.id_rol
FROM usuarios u
CROSS JOIN roles r
WHERE u.username = 'dr.roberto.castaneda'
  AND r.nombre_rol IN ('Profesor_Investigador', 'Coordinador_Academico');

COMMIT;
