import { ObjectId } from 'mongodb';
import { fakerES_MX as faker } from '@faker-js/faker';

export function generarArticulosPublicados(proyectosDocs, cantidad = 60) {
  const articulos = [];
  const catalogoRevistas = [
    {
      issn: '2169-3536',
      nombre_revista: 'IEEE Access',
      indexacion: 'Scopus / Web of Science (JCR)',
      pais_revista: 'Estados Unidos',
      sitio_web: 'https://ieeeaccess.ieee.org'
    },
    {
      issn: '0957-4174',
      nombre_revista: 'Expert Systems with Applications',
      indexacion: 'Web of Science (JCR)',
      pais_revista: 'Reino Unido',
      sitio_web: 'https://www.sciencedirect.com/journal/expert-systems-with-applications'
    },
    {
      issn: '1424-8220',
      nombre_revista: 'Sensors',
      indexacion: 'Scopus / PubMed',
      pais_revista: 'Suiza',
      sitio_web: 'https://www.mdpi.com/journal/sensors'
    },
    {
      issn: '1405-5546',
      nombre_revista: 'Computación y Sistemas',
      indexacion: 'CONAHCYT / Scopus',
      pais_revista: 'México',
      sitio_web: 'https://www.cys.cic.ipn.mx'
    },
    {
      issn: '1665-2738',
      nombre_revista: 'Revista Mexicana de Ingeniería Química',
      indexacion: 'CONAHCYT / Web of Science',
      pais_revista: 'México',
      sitio_web: 'http://rmiq.org'
    },
    {
      issn: '0167-739X',
      nombre_revista: 'Future Generation Computer Systems',
      indexacion: 'Web of Science (JCR)',
      pais_revista: 'Países Bajos',
      sitio_web: 'https://www.sciencedirect.com/journal/future-generation-computer-systems'
    }
  ];

  const cuartilesCatalogo = ['Q1', 'Q2', 'Q3', 'Q4', 'NA'];
  const tiposAutorCatalogo = [
    'PROFESOR_CUCEI',
    'ALUMNO_PREGRADO',
    'ALUMNO_POSGRADO',
    'EXTERNO'
  ];
  const institucionesExternas = [
    'CINVESTAV Unidad Guadalajara',
    'Instituto Politécnico Nacional (IPN)',
    'Universidad Nacional Autónoma de México (UNAM)',
    'Tecnológico de Monterrey (ITESM)',
    'Universitat Politècnica de Catalunya (UPC)',
    'Centro de Investigación en Matemáticas (CIMAT)'
  ];

  for (let i = 0; i < cantidad; i++) {
    const proyecto = proyectosDocs[i % proyectosDocs.length];
    const revistaSeleccionada = catalogoRevistas[i % catalogoRevistas.length];
    const cuartil = faker.helpers.arrayElement(cuartilesCatalogo);
    const anioPublicacion = faker.number.int({ min: 2020, max: 2026 });

    const factorImpacto = cuartil === 'NA'
      ? 0.45
      : parseFloat(faker.number.float({ min: 1.25, max: 9.85, fractionDigits: 3 }));

    const numAutores = faker.number.int({ min: 2, max: 5 });
    const autores = [];

    for (let orden = 1; orden <= numAutores; orden++) {
      const tipoAutor = orden === 1
        ? 'PROFESOR_CUCEI'
        : faker.helpers.arrayElement(tiposAutorCatalogo);

      const esInternoUDG = tipoAutor !== 'EXTERNO';
      const prefijoCodigo = tipoAutor === 'PROFESOR_CUCEI' ? 'PROF' : 'ALU';

      autores.push({
        orden_autoria: orden,
        tipo_autor: tipoAutor,
        codigo_udg: esInternoUDG
          ? `${prefijoCodigo}-${faker.number.int({ min: 2100000, max: 2999999 })}`
          : null,
        nombre_autor_externo: esInternoUDG ? null : faker.person.fullName(),
        filiacion_externa: esInternoUDG
          ? null
          : faker.helpers.arrayElement(institucionesExternas),
        es_autor_correspondencia: orden === 1
      });
    }

    articulos.push({
      _id: new ObjectId(),
      doi: `10.1109/CUCEI.${anioPublicacion}.${String(100000 + i)}`,
      titulo_articulo: `${faker.hacker.ingverb()} ${faker.hacker.adjective()} ${faker.hacker.noun()} en arquitecturas de ${faker.company.buzzNoun()} (#${i + 1})`,
      abstract: faker.lorem.paragraph(3),
      anio_publicacion: anioPublicacion,
      cuartil,
      factor_impacto: factorImpacto,
      afiliacion_udg: faker.datatype.boolean({ probability: 0.9 }),
      id_proyecto: faker.datatype.boolean({ probability: 0.85 }) ? proyecto._id : null,
      revista: {
        issn: revistaSeleccionada.issn,
        nombre_revista: revistaSeleccionada.nombre_revista,
        indexacion: revistaSeleccionada.indexacion,
        pais_revista: revistaSeleccionada.pais_revista,
        sitio_web: revistaSeleccionada.sitio_web
      },
      autores
    });
  }

  return articulos;
}

