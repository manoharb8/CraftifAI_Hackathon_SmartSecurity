#!/usr/bin/env bash
# Factory flash script for led_bringup
# Usage: bash flash.sh [PORT]
#   PORT defaults to /dev/ttyUSB0 (override with first argument or FLASH_PORT env var)
set -euo pipefail

PORT="${FLASH_PORT:-${1:-/dev/ttyUSB0}}"

echo "[INFO] Flashing led_bringup to $PORT ..."
esptool.py --chip esp32c3 --port "$PORT" --baud 460800 write_flash \
  --flash_mode dio --flash_size 4MB --flash_freq 80m \
  0x0 firmware/bootloader.bin \
  0x8000 firmware/partition-table.bin \
  0x20000 firmware/led_bringup.bin

echo "[OK] Flash complete."
