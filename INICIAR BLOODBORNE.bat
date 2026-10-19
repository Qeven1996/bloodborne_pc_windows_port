@echo off
rem Lanzador de Bloodborne PC Port (bbport)
rem Juego: dump extraido de los PKGs (Bloodborne v1.09, CUSA00900)
rem DLC habilitado (user\addcont) + rendimiento optimizado (bbport.ini)
cd /d "%~dp0"
rem NOTA: no fijar BB_GC_BUDGET_MB aqui: un techo <4096 marca la GPU como "low VRAM"
rem y el GC entra en bucle de evacuaciones (thrash). Se usa el presupuesto del driver.
rem
rem --- Tuning de rendimiento medido en este equipo (RTX 3050 6GB / Ryzen 5 7235HS) ---
rem Ventana de fallos de escritura de 1 MiB: baja los fallos a la mitad (~2100 -> ~1250/s).
set "BB_FAULT_WINDOW=1024"
rem Mantiene mas bloques de staging en RAM (hay 16 GB): menos reasignaciones al streamear.
set "BB_STAGING_KEEP_MB=1024"
rem El mayor lever de FPS es output_res en bbport.ini (la GPU es el limite a 1080p):
rem   1920x1080 = maxima calidad (~60-70 fps)     1280x720 = ~85 fps (imagen mas suave).
rem Se puede cambiar EN VIVO desde el menu Insert (no hace falta reiniciar).
call run.bat "C:\Users\qevde\Documents\GitHub\CUSA00900"
pause
