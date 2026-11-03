import { connectToDatabase, closeDatabaseConnection, DB_NAME } from '../config/database.js';

/**
 * Ejecuta consultas analíticas y de negocio sobre las colecciones y vistas del Módulo 7.
 */
export async function ejecutarConsultasModulo7() {
  try {
    const { db } = await connectToDatabase();
    console.log('===================================================================');
    console.log(` CONSULTAS Y KPIs ANALÍTICOS DEL MÓDULO 7 (${DB_NAME})`);
    console.log('===================================================================\n');

    // 1. Consulta a la Vista Analítica: vw_kpi_financiamiento_proyectos
    console.log('1. [Vista Analítica] Financiamiento de Proyectos por Origen y Estatus:');
    const kpiFinanciamiento = await db
      .collection('vw_kpi_financiamiento_proyectos')
      .find({})
      .limit(10)
      .toArray();
    console.table(kpiFinanciamiento);

    // 2. Consulta a la Vista Analítica: vw_kpi_produccion_cientifica_cuartil
    console.log('\n2. [Vista Analítica] Producción Científica por Indexación y Cuartil:');
    const kpiProduccion = await db
      .collection('vw_kpi_produccion_cientifica_cuartil')
      .find({})
      .limit(10)
      .toArray();
    console.table(kpiProduccion);

    // 3. Pipeline de Agregación: Top 5 Departamentos SQL con mayor presupuesto en ejecución/aprobado
    console.log('\n3. [Agregación Híbrida SQL-NoSQL] Presupuesto por id_departamento_sql:');
    const topDepartamentos = await db
      .collection('proyectos_investigacion')
      .aggregate([
        {
          $match: {
            estatus: { $in: ['APROBADO', 'EN_EJECUCION', 'CONCLUIDO'] }
          }
        },
        {
          $group: {
            _id: '$id_departamento_sql',
            proyectos_activos: { $sum: 1 },
            presupuesto_acumulado: { $sum: '$monto_financiado' }
          }
        },
        {
          $project: {
            _id: 0,
            id_departamento_sql: '$_id',
            proyectos_activos: 1,
            presupuesto_acumulado: { $round: ['$presupuesto_acumulado', 2] }
          }
        },
        { $sort: { presupuesto_acumulado: -1 } },
        { $limit: 5 }
      ])
      .toArray();
    console.table(topDepartamentos);

    // 4. Resumen de Propiedad Intelectual por Tipo y Estatus
    console.log('\n4. [Agregación] Resumen de Propiedad Intelectual (IMPI / INDAUTOR):');
    const resumenPropiedad = await db
      .collection('propiedad_intelectual')
      .aggregate([
        {
          $group: {
            _id: {
              tipo_propiedad: '$tipo_propiedad',
              estatus: '$estatus'
            },
            total_registros: { $sum: 1 }
          }
        },
        {
          $project: {
            _id: 0,
            tipo_propiedad: '$_id.tipo_propiedad',
            estatus: '$_id.estatus',
            total_registros: 1
          }
        },
        { $sort: { tipo_propiedad: 1, total_registros: -1 } }
      ])
      .toArray();
    console.table(resumenPropiedad);
  } finally {
    await closeDatabaseConnection();
  }
}

ejecutarConsultasModulo7().catch(err => {
  console.error('Error al ejecutar las consultas del Módulo 7:', err.message);
  process.exit(1);
});

