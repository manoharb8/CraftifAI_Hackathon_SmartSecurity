@echo off
REM Factory flash script for led_bringup
REM Usage: flash.bat [COM_PORT]
REM   COM_PORT defaults to COM3 (override with first argument or FLASH_PORT env var)
setlocal

if not "%~1"=="" (
  set PORT=%~1
) else if defined FLASH_PORT (
  set PORT=%FLASH_PORT%
) else (
  set PORT=COM3
)

echo [INFO] Flashing led_bringup to %PORT% ...
esptool.py --chip esp32c3 --port %PORT% --baud 460800 write_flash ^
  --flash_mode dio --flash_size 4MB --flash_freq 80m ^
  0x0 firmware\bootloader.bin ^
  0x8000 firmware\partition-table.bin ^
  0x20000 firmware\led_bringup.bin

if %ERRORLEVEL% NEQ 0 (
  echo.
  echo [ERR] Flash failed with exit code %ERRORLEVEL%.
  pause
  exit /b %ERRORLEVEL%
)

echo [OK] Flash complete.
pause
