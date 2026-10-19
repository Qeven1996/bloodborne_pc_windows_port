# Optimizaciones de Bloodborne PC Port que requieren administrador.
# Ejecutar en una PowerShell ABIERTA COMO ADMINISTRADOR:
#   powershell -ExecutionPolicy Bypass -File "optimizar-admin.ps1"

Write-Host "== 1) HAGS (programacion de GPU acelerada por hardware) =="
try {
    Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name HwSchMode -Value 2 -Type DWord
    Write-Host "   HwSchMode = 2 (activado)"
} catch { Write-Host "   ERROR: $($_.Exception.Message)" }

Write-Host "== 2) Exclusiones de Windows Defender (evita escaneos en caliente) =="
foreach ($p in @(
    "C:\Users\qevde\Documents\GitHub\bloodborne_pc_windows_port",
    "C:\Users\qevde\Documents\GitHub\CUSA00900",
    "C:\Users\qevde\Documents\GitHub\DLSS")) {
    try { Add-MpPreference -ExclusionPath $p; Write-Host "   excluida: $p" }
    catch { Write-Host "   ERROR con $p : $($_.Exception.Message)" }
}

Write-Host "== 3) Estado del procesador: minimo 100% (menos bajadas de frecuencia) =="
try {
    powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 100
    powercfg /setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 5
    powercfg /setactive SCHEME_CURRENT
    Write-Host "   fijado (AC 100% / bateria 5%)"
} catch { Write-Host "   ERROR: $($_.Exception.Message)" }

Write-Host "== Listo. Reinicia para que HAGS surta efecto. =="
