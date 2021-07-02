# Wasm3 Testing #

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

Change into the wasm_apps/cpp/ folder and execute the ./build.sh script file. This will generate and copy the wasm files to the wasm_vm/data/ folder. Open the wasm_vm/wasm_vm.ino sketch file with the Arduino IDE. Compile and upload the sketch to your device ... and perform a data upload to your device's filesystem ... reboot, you will be now running a wasm sketch, loaded from the filesystem.

### Notes
* The `#define WASM_FILE`can be either "/app_delay.wasm" or "/app_nodelay.wasm" (or any wasm file you create ...)
* The `#define LED_PIN` and `#define LED_COUNT` are used to set the led strip settings
* The wasm binary files are distrubited with the source ... so you can test things without having the Wasienv toolchain installed.

### Future Goals
* create a web interface to edit, compile, and upload wasm sketches
