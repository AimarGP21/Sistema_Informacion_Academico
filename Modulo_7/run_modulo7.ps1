# ============================================================================
# SCRIPT DE AUTOMATIZACIÓN: MÓDULO 7 (INVESTIGACIÓN Y PRODUCCIÓN CIENTÍFICA)
# Uso: .\run_modulo7.ps1 [-MongoUri "mongodb://127.0.0.1:27017"] [-DbName "cucei_investigacion_db"]
# ============================================================================

param (
    [string]$MongoUri = "mongodb://127.0.0.1:27017",
    [string]$DbName = "cucei_investigacion_db"
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

Write-Host "===================================================================" -ForegroundColor Cyan
Write-Host " INICIANDO DESPLIEGUE DEL MÓDULO 7 (MONGODB - POLYGLOT PERSISTENCE)" -ForegroundColor Cyan
Write-Host "===================================================================" -ForegroundColor Cyan

# 1. Verificar e instalar dependencias de Node.js si no existe node_modules
if (-not (Test-Path "node_modules")) {
    Write-Host "`n[1/4] Instalando dependencias NPM (@faker-js/faker, mongodb, dotenv)..." -ForegroundColor Yellow
    npm install
} else {
    Write-Host "`n[1/4] Dependencias NPM verificadas." -ForegroundColor Green
}

# 2. Generar archivos semilla JSON (proyectos.json, articulos.json, propiedad.json)
Write-Host "`n[2/4] Ejecutando generadores modulares y creando archivos JSON..." -ForegroundColor Yellow
npm run seed

# 3. Aplicar esquema $jsonSchema, índices y vistas en MongoDB si mongosh está disponible
if (Get-Command "mongosh" -ErrorAction SilentlyContinue) {
    Write-Host "`n[3/4] Aplicando validación `$jsonSchema, índices y vistas en MongoDB ($DbName)..." -ForegroundColor Yellow
    mongosh "$MongoUri/$DbName" --file "Modulo_7_MongoDB.js"

    Write-Host "`n[4/4] Poblando colecciones en MongoDB (insertMany) y ejecutando consultas KPI..." -ForegroundColor Yellow
    $env:MONGO_URI = $MongoUri
    $env:MONGO_DB_NAME = $DbName
    npm run seed:mongo
    npm run queries
} else {
    Write-Host "`n[3/4] Nota: 'mongosh' no se encontró en el PATH. Los archivos JSON quedaron listos en el directorio." -ForegroundColor Magenta
    Write-Host "      Para aplicar el esquema manualmente: mongosh `"$MongoUri/$DbName`" --file Modulo_7_MongoDB.js" -ForegroundColor Magenta
}

Write-Host "`n===================================================================" -ForegroundColor Cyan
Write-Host " PROCESO DEL MÓDULO 7 FINALIZADO EXITOSAMENTE" -ForegroundColor Cyan
Write-Host "===================================================================" -ForegroundColor Cyan

