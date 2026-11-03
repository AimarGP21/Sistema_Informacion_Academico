import { ObjectId } from 'mongodb';
import { fakerES_MX as faker } from '@faker-js/faker';

export function generarEstudiantes(carrerasDocs, centrosDocs, cantidad = 400) {
  const estudiantes = [];
  const catalogoIntereses = [
    'Ciencia de Datos',
    'Inteligencia Artificial',
    'Desarrollo Web Fullstack',
    'Seguridad Ofensiva',
    'Computacion en la Nube',
    'Robotica Movil',
    'Bioinformatica',
    'Finanzas Cuantitativas',
    'Arquitectura Sustentable',
    'Emprendimiento Tecnologico'
  ];

  for (let i = 0; i < cantidad; i++) {
    const carrera = carrerasDocs[i % carrerasDocs.length];
    const centro = centrosDocs.find(c => c._id.equals(carrera.centroId)) || centrosDocs[0];
    const semestre = faker.number.int({ min: 1, max: carrera.duracionSemestres });
    const creditos = Math.min(carrera.totalCreditos, Math.round((semestre / carrera.duracionSemestres) * carrera.totalCreditos));
    const promedio = parseFloat(faker.number.float({ min: 65, max: 99.5, fractionDigits: 1 }));
    const estatus = faker.helpers.arrayElement(['Activo', 'Activo', 'Activo', 'Egresado', 'Baja Temporal']);

    estudiantes.push({
      _id: new ObjectId(),
      carreraId: carrera._id,
      carreraNombre: carrera.nombre,
      centroId: centro._id,
      centroSiglas: centro.siglas,
      matricula: `EST-${String(2200000 + i)}`,
      nombre: faker.person.fullName(),
      correo: faker.internet.email().toLowerCase(),
      telefono: faker.phone.number(),
      fechaNacimiento: faker.date.birthdate({ min: 18, max: 28, mode: 'age' }),
      fechaIngreso: faker.date.past({ years: 4 }),
      promedioGeneral: promedio,
      creditosAprobados: creditos,
      semestreActual: semestre,
      estatus,
      becado: faker.datatype.boolean({ probability: 0.25 }),
      interesesAcademicos: faker.helpers.arrayElements(catalogoIntereses, { min: 2, max: 4 }),
      direccion: {
        calle: faker.location.streetAddress(),
        colonia: faker.location.county(),
        municipio: faker.location.city(),
        codigoPostal: faker.location.zipCode('#####')
      },
      activo: estatus === 'Activo'
    });
  }

  return estudiantes;
}
