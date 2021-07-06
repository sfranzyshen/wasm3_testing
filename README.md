# Wasm3 Testing #
This repository contains my experiments using the wasm3 webassembly virtual machine on the esp microcontroller platforms. I'm using the Arduino IDE development environment for generating the firmware. All built binaries and tools are included here, but are only useful on a Linux 64bit platform ...

### My development environment:
* Windows 11 Home (64bit) + WSL2 
  * Ubuntu 18.04.3 LTS 
* [Arduino IDE 1.8.10](https://github.com/arduino/arduino-ide)
  * [esp32 Core 1.0.6](https://github.com/espressif/arduino-esp32)
  * [esp8266 Core 2.7.4](https://github.com/esp8266/Arduino)
  * [Adafruit_NeoPixel 1.8.2](https://github.com/adafruit/Adafruit_NeoPixel) 
  * [Wasm3-Arduino 0.5.0](https://github.com/wasm3/wasm3-arduino)
* [wasi-sdk 12](https://github.com/WebAssembly/wasi-sdk) toolchain
  * LLVM 11.0
* [Wasienv 0.5.3](https://github.com/wasienv/wasienv) toolchain
* [wasm3-self-compiling](https://github.com/wasm3/wasm3-self-compiling)

## Latest News 6/28/2021
After reading the following statment in this [document](https://github.com/wasm3/wasm3/blob/main/docs/Interpreter.md#stack-usage) from the wasm3 project ... I decided to try something different with my failing code ... and now it's working on both the esp32 and esp8266 platforms ... No more out of stack ...

```Returning from a Wasm function also unwinds the stack, back to the point of the Call operation.```

the work around for wasm3 issue [#241](https://github.com/wasm3/wasm3/issues/241) is to write the code inside the wasm app to be non blocking ... allowing the execution flow to return back to the arduino host, resetting the stack used ... **bingo!** 

### Usage
You will need to have installed ...
* Arduino IDE
* ESP Core(s) (esp32 and esp8266 are both supported)
* Wasm3 Arduino Library
* Adifruit_NeoPixel Library
* Wasienv Toolchain 
* Download or clone this repository

Change into the wasm_apps/cpp/ folder and execute the ./build.sh script file. This will generate and copy the wasm files to the wasm_vm/data/ folder. Open the wasm_vm/wasm_vm.ino sketch file with the Arduino IDE. Compile and upload the sketch to your device ... and perform a data upload to your device's filesystem ... reboot, you will now be running a wasm sketch, loaded from the filesystem.

### Notes
* The `#define WASM_FILE`can be either "/app_delay.wasm" or "/app_nodelay.wasm" (or any wasm file you create ...)
* The `#define LED_PIN` and `#define LED_COUNT` are used to set the led strip settings
* The wasm binary files are distrubited with the source ... so you can test things without having the Wasienv toolchain installed.
### ToDo
* fix compile with wasi-sdk (clang)

### Future Goals
* create a (self hosted) web interface to edit, compile, and upload wasm sketches to the microcontroller 😊
* create a wasi layer for the esp arduino platforms (just like the [esp32-idf-wasi](https://github.com/wasm3/wasm3/tree/main/platforms/embedded/esp32-idf-wasi) layer demo)
