import { MongoClient } from 'mongodb';
import dotenv from 'dotenv';

dotenv.config();

export const MONGO_URI = process.env.MONGO_URI || 'mongodb://127.0.0.1:27017';
export const DB_NAME = process.env.MONGO_DB_NAME || 'cucei_investigacion_db';

let clientInstance = null;

/**
 * Establece y retorna una conexión activa a la base de datos MongoDB del Módulo 7.
 * @returns {Promise<{ client: MongoClient, db: import('mongodb').Db }>}
 */
export async function connectToDatabase() {
  if (!clientInstance) {
    clientInstance = new MongoClient(MONGO_URI, {
      connectTimeoutMS: 5000,
      serverSelectionTimeoutMS: 5000
    });
    await clientInstance.connect();
  }

  const db = clientInstance.db(DB_NAME);
  return { client: clientInstance, db };
}

/**
 * Cierra de forma limpia la conexión activa con MongoDB.
 */
export async function closeDatabaseConnection() {
  if (clientInstance) {
    await clientInstance.close();
    clientInstance = null;
  }
}

