// ============================================================================
// MÓDULO 7: INVESTIGACIÓN Y PRODUCCIÓN CIENTÍFICA (MIGRACIÓN A MONGODB)
// Script ejecutable en mongosh - Arquitectura Híbrida (Polyglot Persistence)
// ============================================================================

// Limpieza previa de colecciones y vistas en caso de re-ejecución
db.vw_kpi_financiamiento_proyectos.drop();
db.vw_kpi_produccion_cientifica_cuartil.drop();
db.propiedad_intelectual.drop();
db.articulos_publicados.drop();
db.proyectos_investigacion.drop();

// ============================================================================
// 1. CREACIÓN DE COLECCIONES CON VALIDACIÓN $jsonSchema
// ============================================================================

// 1.1 Colección: proyectos_investigacion
db.createCollection("proyectos_investigacion", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [
        "codigo_proyecto",
        "titulo_proyecto",
        "origen_financiamiento",
        "monto_financiado",
        "estatus",
        "fecha_inicio",
        "id_profesor_resp_sql",
        "id_departamento_sql"
      ],
      properties: {
        _id: {
          bsonType: "objectId",
          description: "Identificador único del documento en MongoDB"
        },
        codigo_proyecto: {
          bsonType: "string",
          maxLength: 30,
          description: "Código único del proyecto de investigación (VARCHAR(30) NOT NULL)"
        },
        titulo_proyecto: {
          bsonType: "string",
          maxLength: 255,
          description: "Título oficial del proyecto (VARCHAR(255) NOT NULL)"
        },
        resumen_ejecutivo: {
          bsonType: ["string", "null"],
          description: "Resumen ejecutivo del proyecto (TEXT NULL)"
        },
        origen_financiamiento: {
          bsonType: "string",
          enum: [
            "INTERNO_UDG",
            "CONAHCYT",
            "PRODEP",
            "INDUSTRIA",
            "RECURSOS_PROPIOS"
          ],
          description: "Fuente de financiamiento restringida al catálogo institucional"
        },
        monto_financiado: {
          bsonType: ["double", "decimal", "int", "long"],
          minimum: 0,
          description: "Monto financiado mayor o igual a 0 (DECIMAL(12,2) >= 0)"
        },
        estatus: {
          bsonType: "string",
          enum: [
            "EN_REVISION",
            "APROBADO",
            "EN_EJECUCION",
            "CONCLUIDO",
            "CANCELADO"
          ],
          description: "Estado actual del proyecto de investigación"
        },
        fecha_inicio: {
          bsonType: "date",
          description: "Fecha de inicio del proyecto (DATE NOT NULL)"
        },
        fecha_fin: {
          bsonType: ["date", "null"],
          description: "Fecha de conclusión estimada o real del proyecto (DATE NULL)"
        },
        id_profesor_resp_sql: {
          bsonType: "int",
          minimum: 1,
          description: "Referencia entera (Polyglot FK) hacia profesores.id_profesor en PostgreSQL"
        },
        id_departamento_sql: {
          bsonType: "int",
          minimum: 1,
          description: "Referencia entera (Polyglot FK) hacia departamentos.id_departamento en PostgreSQL"
        }
      }
    }
  },
  validationLevel: "strict",
  validationAction: "error"
});

// 1.2 Colección: articulos_publicados (Desnormaliza articulos_publicados, revistas_indexadas y autores_articulos)
db.createCollection("articulos_publicados", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [
        "doi",
        "titulo_articulo",
        "anio_publicacion",
        "afiliacion_udg",
        "revista",
        "autores"
      ],
      properties: {
        _id: {
          bsonType: "objectId",
          description: "Identificador único del artículo en MongoDB"
        },
        doi: {
          bsonType: "string",
          maxLength: 100,
          description: "Digital Object Identifier único del artículo (VARCHAR(100) NOT NULL)"
        },
        titulo_articulo: {
          bsonType: "string",
          maxLength: 255,
          description: "Título completo del artículo publicado (VARCHAR(255) NOT NULL)"
        },
        abstract: {
          bsonType: ["string", "null"],
          description: "Resumen o abstract del artículo (TEXT NULL)"
        },
        anio_publicacion: {
          bsonType: "int",
          minimum: 1900,
          maximum: 2100,
          description: "Año de publicación entre 1900 y 2100"
        },
        cuartil: {
          bsonType: ["string", "null"],
          enum: ["Q1", "Q2", "Q3", "Q4", "NA", null],
          description: "Cuartil de impacto de la publicación"
        },
        factor_impacto: {
          bsonType: ["double", "decimal", "int", "null"],
          minimum: 0,
          description: "Factor de impacto de la publicación (DECIMAL(5,3))"
        },
        afiliacion_udg: {
          bsonType: "bool",
          description: "Indica si cuenta con afiliación oficial de la Universidad de Guadalajara"
        },
        id_proyecto: {
          bsonType: ["objectId", "null"],
          description: "Referencia opcional ObjectId hacia proyectos_investigacion._id"
        },
        revista: {
          bsonType: "object",
          required: ["issn", "nombre_revista", "indexacion"],
          properties: {
            issn: {
              bsonType: "string",
              maxLength: 20,
              description: "ISSN de la revista indexada (VARCHAR(20) NOT NULL)"
            },
            nombre_revista: {
              bsonType: "string",
              maxLength: 150,
              description: "Nombre oficial de la revista (VARCHAR(150) NOT NULL)"
            },
            indexacion: {
              bsonType: "string",
              maxLength: 50,
              description: "Base de datos o índice al que pertenece (Scopus, WoS, CONAHCYT, Latindex, etc.)"
            },
            pais_revista: {
              bsonType: ["string", "null"],
              maxLength: 60,
              description: "País de edición de la revista"
            },
            sitio_web: {
              bsonType: ["string", "null"],
              maxLength: 255,
              description: "URL del sitio oficial de la revista"
            }
          }
        },
        autores: {
          bsonType: "array",
          minItems: 1,
          description: "Arreglo polimórfico de autores del artículo",
          items: {
            bsonType: "object",
            required: [
              "orden_autoria",
              "tipo_autor",
              "es_autor_correspondencia"
            ],
            properties: {
              orden_autoria: {
                bsonType: "int",
                minimum: 1,
                description: "Posición del autor en la firma del artículo"
              },
              tipo_autor: {
                bsonType: "string",
                enum: [
                  "PROFESOR_CUCEI",
                  "ALUMNO_PREGRADO",
                  "ALUMNO_POSGRADO",
                  "EXTERNO"
                ],
                description: "Categoría institucional o externa del autor"
              },
              codigo_udg: {
                bsonType: ["string", "null"],
                maxLength: 20,
                description: "Código UDG para autores internos (PROFESOR_CUCEI, ALUMNO_PREGRADO, ALUMNO_POSGRADO)"
              },
              nombre_autor_externo: {
                bsonType: ["string", "null"],
                maxLength: 150,
                description: "Nombre completo cuando tipo_autor es EXTERNO"
              },
              filiacion_externa: {
                bsonType: ["string", "null"],
                maxLength: 150,
                description: "Institución de procedencia cuando tipo_autor es EXTERNO"
              },
              es_autor_correspondencia: {
                bsonType: "bool",
                description: "Indica si es el autor de correspondencia (corresponding author)"
              }
            }
          }
        }
      }
    }
  },
  validationLevel: "strict",
  validationAction: "error"
});

// 1.3 Colección: propiedad_intelectual
db.createCollection("propiedad_intelectual", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [
        "numero_registro",
        "titulo",
        "tipo_propiedad",
        "estatus"
      ],
      properties: {
        _id: {
          bsonType: "objectId",
          description: "Identificador único del registro de propiedad intelectual"
        },
        numero_registro: {
          bsonType: "string",
          maxLength: 50,
          description: "Número oficial de expediente o registro ante IMPI / INDAUTOR"
        },
        titulo: {
          bsonType: "string",
          maxLength: 255,
          description: "Título de la invención, obra o diseño (VARCHAR(255) NOT NULL)"
        },
        tipo_propiedad: {
          bsonType: "string",
          enum: [
            "PATENTE",
            "MODELO_UTILIDAD",
            "SOFTWARE_INDAUTOR",
            "DISENO_INDUSTRIAL"
          ],
          description: "Clasificación legal de la propiedad intelectual"
        },
        estatus: {
          bsonType: "string",
          enum: [
            "SOLICITADO",
            "EN_EXAMEN",
            "OTORGADO",
            "RECHAZADO"
          ],
          description: "Estado del trámite de registro"
        },
        fecha_concesion: {
          bsonType: ["date", "null"],
          description: "Fecha oficial de otorgamiento o concesión (DATE NULL)"
        },
        id_proyecto: {
          bsonType: ["objectId", "null"],
          description: "Referencia opcional ObjectId hacia proyectos_investigacion._id"
        }
      }
    }
  },
  validationLevel: "strict",
  validationAction: "error"
});

// ============================================================================
// 2. CREACIÓN DE ÍNDICES (UNICIDAD Y CONSULTAS INTER-MÓDULO)
// ============================================================================

// Índices únicos equivalentes a las restricciones UNIQUE de SQL
db.proyectos_investigacion.createIndex(
  { codigo_proyecto: 1 },
  { unique: true, name: "uq_proyectos_codigo_proyecto" }
);

db.articulos_publicados.createIndex(
  { doi: 1 },
  { unique: true, name: "uq_articulos_doi" }
);

db.propiedad_intelectual.createIndex(
  { numero_registro: 1 },
  { unique: true, name: "uq_propiedad_numero_registro" }
);

// Índices simples para acelerar joins híbridos con PostgreSQL y búsquedas por autor UDG
db.proyectos_investigacion.createIndex(
  { id_profesor_resp_sql: 1 },
  { name: "idx_proyectos_id_profesor_resp_sql" }
);

db.proyectos_investigacion.createIndex(
  { id_departamento_sql: 1 },
  { name: "idx_proyectos_id_departamento_sql" }
);

db.articulos_publicados.createIndex(
  { "autores.codigo_udg": 1 },
  { name: "idx_articulos_autores_codigo_udg" }
);

// ============================================================================
// 3. VISTAS ANALÍTICAS NOSQL (AGGREGATION PIPELINES)
// ============================================================================

// 3.1 Vista: vw_kpi_financiamiento_proyectos
// Monto total financiado, promedio de presupuesto y total de proyectos agrupados por origen_financiamiento y estatus
db.createView(
  "vw_kpi_financiamiento_proyectos",
  "proyectos_investigacion",
  [
    {
      $group: {
        _id: {
          origen_financiamiento: "$origen_financiamiento",
          estatus: "$estatus"
        },
        total_proyectos: { $sum: 1 },
        monto_total_financiado: { $sum: "$monto_financiado" },
        promedio_presupuesto: { $avg: "$monto_financiado" },
        monto_minimo: { $min: "$monto_financiado" },
        monto_maximo: { $max: "$monto_financiado" }
      }
    },
    {
      $project: {
        _id: 0,
        origen_financiamiento: "$_id.origen_financiamiento",
        estatus: "$_id.estatus",
        total_proyectos: 1,
        monto_total_financiado: { $round: ["$monto_total_financiado", 2] },
        promedio_presupuesto: { $round: ["$promedio_presupuesto", 2] },
        monto_minimo: { $round: ["$monto_minimo", 2] },
        monto_maximo: { $round: ["$monto_maximo", 2] }
      }
    },
    {
      $sort: {
        origen_financiamiento: 1,
        monto_total_financiado: -1
      }
    }
  ]
);

// 3.2 Vista: vw_kpi_produccion_cientifica_cuartil
// Total de artículos publicados, factor de impacto promedio y desglose por revista.indexacion y cuartil
db.createView(
  "vw_kpi_produccion_cientifica_cuartil",
  "articulos_publicados",
  [
    {
      $group: {
        _id: {
          indexacion: "$revista.indexacion",
          cuartil: "$cuartil"
        },
        total_articulos: { $sum: 1 },
        factor_impacto_promedio: { $avg: "$factor_impacto" },
        factor_impacto_maximo: { $max: "$factor_impacto" },
        articulos_con_afiliacion_udg: {
          $sum: {
            $cond: [{ $eq: ["$afiliacion_udg", true] }, 1, 0]
          }
        }
      }
    },
    {
      $project: {
        _id: 0,
        indexacion: "$_id.indexacion",
        cuartil: "$_id.cuartil",
        total_articulos: 1,
        articulos_con_afiliacion_udg: 1,
        factor_impacto_promedio: { $round: ["$factor_impacto_promedio", 3] },
        factor_impacto_maximo: { $round: ["$factor_impacto_maximo", 3] }
      }
    },
    {
      $sort: {
        indexacion: 1,
        cuartil: 1
      }
    }
  ]
);

