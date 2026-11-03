import { ObjectId } from 'mongodb';
import { fakerES_MX as faker } from '@faker-js/faker';

export function generarPropiedadIntelectual(proyectosDocs, cantidad = 20) {
  const registrosPropiedad = [];
  const tiposPropiedad = [
    'PATENTE',
    'MODELO_UTILIDAD',
    'SOFTWARE_INDAUTOR',
    'DISENO_INDUSTRIAL'
  ];
  const estatusPropiedad = [
    'SOLICITADO',
    'EN_EXAMEN',
    'OTORGADO',
    'RECHAZADO'
  ];
  const prefijosInvencion = [
    'Sistema Automatizado de Monitoreo Espectral para',
    'Dispositivo Mecatrónico Reconfigurable de',
    'Motor Algorítmico de Cifrado Homomórfico para',
    'Biorreactor Modular de Flujo Continuo Aplicado a',
    'Interfaz Cerebral No Invasiva para Control de'
  ];

  for (let i = 0; i < cantidad; i++) {
    const proyecto = proyectosDocs[i % proyectosDocs.length];
    const tipoPropiedad = faker.helpers.arrayElement(tiposPropiedad);
    const estatus = faker.helpers.arrayElement(estatusPropiedad);
    const organismo = tipoPropiedad === 'SOFTWARE_INDAUTOR' ? 'INDAUTOR' : 'IMPI';
    const prefijo = prefijosInvencion[i % prefijosInvencion.length];

    registrosPropiedad.push({
      _id: new ObjectId(),
      numero_registro: `MX/${organismo}/2025/${String(50000 + i)}`,
      titulo: `${prefijo} ${faker.company.buzzNoun()} (${tipoPropiedad})`,
      tipo_propiedad: tipoPropiedad,
      estatus,
      fecha_concesion: estatus === 'OTORGADO' ? faker.date.past({ years: 1 }) : null,
      id_proyecto: proyecto._id
    });
  }

  return registrosPropiedad;
}

