Write-Host ""
Write-Host "🚀 Ejecutando pruebas Karate..." -ForegroundColor Cyan
Write-Host ""

# Ejecutar pruebas
mvn test
$exitCode = $LASTEXITCODE

$reportPath = "$PSScriptRoot\target\karate-reports\karate-summary.html"

if (Test-Path $reportPath) {

    Write-Host ""
    Write-Host "📊 Abriendo reporte Karate..." -ForegroundColor Green

    Start-Process $reportPath
}
else {
    Write-Host ""
    Write-Host "❌ No se encontró el reporte." -ForegroundColor Red
}

if ($exitCode -ne 0) {
    Write-Host ""
    Write-Host "⚠️ Algunas pruebas fallaron." -ForegroundColor Yellow
}
else {
    Write-Host ""
    Write-Host "✅ Todas las pruebas pasaron." -ForegroundColor Green
}
