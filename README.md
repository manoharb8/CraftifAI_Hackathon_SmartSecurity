# CraftifAI Hackathon – Smart Security

An ESP32-C3 based smart security system that detects motion using an HC-SR501 PIR sensor and provides immediate visual alerts through the onboard RGB LED.

## Hardware

- ESP32-C3-DevKitM-1 v1.6
- HC-SR501 PIR motion sensor
- Onboard RGB LED

## Pin Configuration

| Component | ESP32-C3 Pin |
|---|---|
| HC-SR501 OUT | GPIO 4 |
| Onboard RGB LED | GPIO 8 |

## Working

- No motion → RGB LED shows cyan
- Motion detected → RGB LED shows red
- LED remains red while PIR output is HIGH
- When motion clears → LED returns to cyan
- PIR is polled every 50 ms
- Local security operation does not depend on MQTT or Telegram

## Development

The firmware was developed and validated using **FirmGen** with ESP-IDF.

The project includes:
- Board bring-up
- PIR integration
- RGB LED control
- Firmware topology
- Build and flash validation
- Serial monitoring
- Doxygen documentation

## Project Status

✅ ESP32-C3 board verified  
✅ RGB LED verified  
✅ PIR motion detection verified  
✅ Motion alert verified  
✅ Motion recovery verified  
✅ Firmware build verified  
✅ Firmware flash verified  

## Future Enhancements

- Telegram motion alerts
- Laptop security dashboard
- Motion event history
- Remote monitoring
- Additional intelligent security features

## Team

CraftifAI Hackathon Project
