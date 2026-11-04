# Módulo 3: Personal Docente e Investigadores (PostgreSQL)

Este directorio contiene la implementación del **Módulo 3** del Sistema de Información Académica (SIA) para el **Sprint 3**, enfocado en la gestión del personal académico, adscripción departamental, Líneas de Generación y Aplicación del Conocimiento (LGAC) y Cuerpos Académicos reconocidos por PRODEP y la Universidad de Guadalajara (CUCEI).

---

## Estructura del Módulo

```text
Modulo_3/
├── Modulo_3_Personal_Docente.sql      # DDL: Creación de tablas, llaves PK/FK y restricciones CHECK
├── seeder_modulo_3.py                # Script en Python con Faker para generación de datos sintéticos
├── DML_Modulo_3.sql                  # DML: Semilla de datos generada (catálogos, profesores, LGAC, UPDATE, ACID)
├── Vistas_Analiticas_Modulo_3.sql    # DDL/Views: 3 vistas analíticas con JOINs para reportes
└── README.md                         # Documentación técnica del módulo
```

---

## Cumplimiento Estricto de Criterios del Sprint 3

| Requisito Oficial | Cumplimiento | Archivo |
| :--- | :---: | :--- |
| **Script DDL compatible PostgreSQL** | **100%** | `Modulo_3_Personal_Docente.sql` (SERIAL, constraints, FKs) |
| **Script Generador Python (Faker)** | **100%** | `seeder_modulo_3.py` (librería Faker `es_MX`) |
| **Catálogos con 15+ registros** | **100%** | 17 en `lineas_investigacion` y 16 en `cuerpos_academicos` |
| **Poblado de datos docentes** | **100%** | 30 profesores y 68 asignaciones en `profesores_linea` |
| **Datos Semilla DML** | **100%** | `DML_Modulo_3.sql` con UPDATE masivo y transacción `BEGIN...COMMIT` |
| **Vistas SQL (Al menos 3 con JOINs)** | **100%** | `Vistas_Analiticas_Modulo_3.sql` |

---

## Vistas Analíticas Desarrolladas

1. **`vw_kpi_profesores_por_departamento_categoria`**:
   - Monitorea la distribución docente por departamento y categoría, evaluando la tasa de cuentas activas en la plataforma.
2. **`vw_kpi_cobertura_lineas_investigacion`**:
   - Mide la multidisciplinariedad y grado de titulación de cada LGAC, contabilizando departamentos participantes e investigadores adscritos.
3. **`vw_kpi_cuerpos_academicos_madurez`**:
   - Diagnóstico del porcentaje de madurez científica institucional de los cuerpos académicos acreditados ante PRODEP.

---

## Instrucciones de Ejecución en PostgreSQL

```sql
-- 1. Crear estructura de tablas
\i Modulo_3/Modulo_3_Personal_Docente.sql

-- 2. Cargar datos semilla
\i Modulo_3/DML_Modulo_3.sql

-- 3. Crear vistas analíticas de KPIs
\i Modulo_3/Vistas_Analiticas_Modulo_3.sql
```
