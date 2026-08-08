# CraftifAI Hackathon – Smart Security

An ESP32-C3 based smart security system developed and validated using FirmGen.

The current release provides a working ESP32-C3 firmware package for the security system, with the onboard RGB LED and HC-SR501 PIR motion sensor used for local motion indication.

## Hardware

- ESP32-C3-DevKitM-1 v1.6
- HC-SR501 PIR motion sensor
- Onboard addressable RGB LED

## Pin Configuration

| Component | ESP32-C3 Pin |
|---|---|
| HC-SR501 PIR OUT | GPIO 4 |
| Onboard RGB LED | GPIO 8 |

## System Behavior

The PIR sensor operates with active-high logic.

- PIR LOW → RGB LED = Cyan
- PIR HIGH → RGB LED = Red
- Red remains active while the PIR output remains HIGH
- When the PIR output returns LOW → RGB LED = Cyan

The PIR state is polled periodically using a non-blocking FreeRTOS task.

## Firmware Architecture

```text
ESP32-C3
│
├── HC-SR501 PIR
│     └── GPIO 4
│
├── Application Logic
│     └── PIR state monitoring
│
└── Onboard RGB LED
      └── GPIO 8
