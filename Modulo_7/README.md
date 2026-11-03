# Módulo 7: Investigación y Producción Científica (MongoDB)

Este directorio contiene la implementación completa del **Módulo 7** del Sistema de Información Académica (SIA) bajo una arquitectura de **Persistencia Políglota (Polyglot Persistence)**, migrando las 5 tablas relacionales originales (`revistas_indexadas`, `proyectos_investigacion`, `articulos_publicados`, `autores_articulos`, `propiedad_intelectual`) hacia **3 colecciones documentales desnormalizadas en MongoDB**.

---

## Estructura del Proyecto

```text
Modulo_7/
├── package.json
├── package-lock.json
├── run_modulo7.ps1                         # Script automatizado de despliegue en PowerShell
├── Modulo_7_MongoDB.js                     # Esquema $jsonSchema, índices y vistas analíticas (mongosh)
├── src/
│   ├── config/
│   │   └── database.js                     # Configuración y cliente de conexión a MongoDB
│   ├── seeders/
│   │   ├── seed_modulo_7.js                # Orquestador de semillas (exporta JSON e insertMany)
│   │   └── generators/
│   │       ├── articulos.generator.js      # Generador de artículos con revista embebida y autores polimórficos
│   │       ├── estudiantes.generator.js    # Generador base de referencia para perfiles estudiantiles
│   │       ├── propiedad.generator.js      # Generador de patentes, software y modelos de utilidad
│   │       └── proyectos.generator.js      # Generador de proyectos con referencias híbridas SQL
│   └── queries/
│       └── kpi_investigacion.queries.js    # Consultas a vistas analíticas y agregaciones NoSQL
└── README.md
```

---

## Colecciones Documentales y Modelo de Datos

1. **`proyectos_investigacion`**:
   - Valida `origen_financiamiento` (`INTERNO_UDG`, `CONAHCYT`, `PRODEP`, `INDUSTRIA`, `RECURSOS_PROPIOS`), `estatus` y `monto_financiado >= 0`.
   - Mantiene referencias híbridas enteras hacia PostgreSQL (`id_profesor_resp_sql` e `id_departamento_sql`).
2. **`articulos_publicados`**:
   - Consolida en un solo documento el artículo, el subdocumento embebido `revista` (`issn`, `nombre_revista`, `indexacion`, `pais_revista`, `sitio_web`) y el arreglo polimórfico `autores` (`PROFESOR_CUCEI`, `ALUMNO_PREGRADO`, `ALUMNO_POSGRADO`, `EXTERNO`).
3. **`propiedad_intelectual`**:
   - Registra invenciones y obras (`PATENTE`, `MODELO_UTILIDAD`, `SOFTWARE_INDAUTOR`, `DISENO_INDUSTRIAL`) vinculadas mediante `id_proyecto` (`ObjectId`).

---

## Ejecución Rápida

### Opción 1: Script Automatizado (PowerShell)
```powershell
cd Modulo_7
.\run_modulo7.ps1
```

### Opción 2: Comandos Manuales NPM
```bash
cd Modulo_7

# 1. Instalar dependencias
npm install

# 2. Generar los archivos JSON (proyectos.json, articulos.json, propiedad.json)
npm run seed

# 3. Crear colecciones, validaciones $jsonSchema, índices y vistas en mongosh
mongosh "mongodb://127.0.0.1:27017/cucei_investigacion_db" --file Modulo_7_MongoDB.js

# 4. Insertar documentos directamente en MongoDB y ejecutar consultas KPI
npm run seed:mongo
npm run queries
```

