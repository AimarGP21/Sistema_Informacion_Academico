import { ObjectId } from 'mongodb';
import { fakerES_MX as faker } from '@faker-js/faker';

export function generarProyectosInvestigacion(cantidad = 30) {
  const proyectos = [];
  const origenesFinanciamiento = [
    'INTERNO_UDG',
    'CONAHCYT',
    'PRODEP',
    'INDUSTRIA',
    'RECURSOS_PROPIOS'
  ];
  const estatusCatalogo = [
    'EN_REVISION',
    'APROBADO',
    'EN_EJECUCION',
    'CONCLUIDO',
    'CANCELADO'
  ];
  const lineasInvestigacion = [
    'Modelado Predictivo mediante Redes Neuronales Profundas para Diagnóstico Biomédico',
    'Optimización de Microredes Eléctricas Inteligentes con Integración Fotovoltaica',
    'Arquitecturas Distribuidas de Baja Latencia para Internet de las Cosas Industrial',
    'Síntesis de Nanomateriales Sustentables para Tratamiento de Aguas Residuales',
    'Criptografía Post-Cuántica Aplicada a Infraestructuras Financieras y Bancarias',
    'Visión Computacional Embarcada en Vehículos Autónomos No Tripulados',
    'Análisis Genómico Computacional de Cultivos Endémicos Resistentes a Sequía',
    'Plataforma de Gemelos Digitales para Manufactura Avanzada 4.0',
    'Detección Temprana de Intrusiones en Redes definidas por Software (SDN)',
    'Procesamiento de Lenguaje Natural para Lenguas Originarias de México'
  ];

  for (let i = 0; i < cantidad; i++) {
    const origen = faker.helpers.arrayElement(origenesFinanciamiento);
    const estatus = faker.helpers.arrayElement(estatusCatalogo);
    const fechaInicio = faker.date.past({ years: 3 });
    const diasDuracion = faker.number.int({ min: 180, max: 730 });
    const fechaFin = new Date(fechaInicio.getTime() + diasDuracion * 24 * 60 * 60 * 1000);
    const lineaBase = lineasInvestigacion[i % lineasInvestigacion.length];

    const montoFinanciado = origen === 'RECURSOS_PROPIOS'
      ? parseFloat(faker.number.float({ min: 0, max: 45000, fractionDigits: 2 }))
      : parseFloat(faker.number.float({ min: 85000, max: 2500000, fractionDigits: 2 }));

    proyectos.push({
      _id: new ObjectId(),
      codigo_proyecto: `PROY-CUCEI-${2024 + (i % 3)}-${String(1001 + i)}`,
      titulo_proyecto: `${lineaBase} - Fase ${faker.number.int({ min: 1, max: 3 })} (${faker.string.alpha({ length: 3, casing: 'upper' })})`,
      resumen_ejecutivo: faker.lorem.paragraphs(2),
      origen_financiamiento: origen,
      monto_financiado: montoFinanciado,
      estatus,
      fecha_inicio: fechaInicio,
      fecha_fin: estatus === 'EN_REVISION' ? null : fechaFin,
      id_profesor_resp_sql: faker.number.int({ min: 1, max: 25 }),
      id_departamento_sql: faker.number.int({ min: 1, max: 6 })
    });
  }

  return proyectos;
}

