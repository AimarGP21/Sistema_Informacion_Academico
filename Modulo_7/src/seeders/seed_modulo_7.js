import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { connectToDatabase, closeDatabaseConnection, MONGO_URI, DB_NAME } from '../config/database.js';
import { generarProyectosInvestigacion } from './generators/proyectos.generator.js';
import { generarArticulosPublicados } from './generators/articulos.generator.js';
import { generarPropiedadIntelectual } from './generators/propiedad.generator.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const raizModulo7 = path.resolve(__dirname, '../../');

// 1. Invocación secuencial de los generadores modulares manteniendo integridad referencial de ObjectId
const proyectosDocs = generarProyectosInvestigacion(30);
const articulosDocs = generarArticulosPublicados(proyectosDocs, 60);
const propiedadDocs = generarPropiedadIntelectual(proyectosDocs, 20);

// 2. Exportación a archivos JSON en la raíz de Modulo_7 para inspección o uso con mongoimport
fs.writeFileSync(
  path.join(raizModulo7, 'proyectos.json'),
  JSON.stringify(proyectosDocs, null, 2),
  'utf-8'
);

fs.writeFileSync(
  path.join(raizModulo7, 'articulos.json'),
  JSON.stringify(articulosDocs, null, 2),
  'utf-8'
);

fs.writeFileSync(
  path.join(raizModulo7, 'propiedad.json'),
  JSON.stringify(propiedadDocs, null, 2),
  'utf-8'
);

console.log('===================================================================');
console.log(' SEEDER MÓDULO 7: ARCHIVOS JSON GENERADOS EXITOSAMENTE');
console.log('===================================================================');
console.log(`- proyectos.json : ${proyectosDocs.length} documentos`);
console.log(`- articulos.json : ${articulosDocs.length} documentos`);
console.log(`- propiedad.json : ${propiedadDocs.length} documentos`);

// 3. Función para poblar directamente en MongoDB mediante insertMany usando src/config/database.js
export async function poblarModulo7MongoDB() {
  try {
    console.log(`\nConectando a MongoDB en ${MONGO_URI} (Base de datos: ${DB_NAME})...`);
    const { db } = await connectToDatabase();

    await db.collection('propiedad_intelectual').deleteMany({});
    await db.collection('articulos_publicados').deleteMany({});
    await db.collection('proyectos_investigacion').deleteMany({});

    const resProyectos = await db.collection('proyectos_investigacion').insertMany(proyectosDocs);
    const resArticulos = await db.collection('articulos_publicados').insertMany(articulosDocs);
    const resPropiedad = await db.collection('propiedad_intelectual').insertMany(propiedadDocs);

    console.log('Inserción masiva (insertMany) completada en MongoDB:');
    console.log(`- proyectos_investigacion : ${resProyectos.insertedCount} insertados`);
    console.log(`- articulos_publicados    : ${resArticulos.insertedCount} insertados`);
    console.log(`- propiedad_intelectual   : ${resPropiedad.insertedCount} insertados`);
  } finally {
    await closeDatabaseConnection();
  }
}

// Si se ejecuta con el flag --insert-mongo, realiza también la inserción directa en el servidor MongoDB
if (process.argv.includes('--insert-mongo')) {
  poblarModulo7MongoDB().catch(err => {
    console.error('Error al insertar en MongoDB:', err.message);
    process.exit(1);
  });
}
