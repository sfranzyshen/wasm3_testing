# Wasm3 Testing #

I'm having a hell of a time trying to get wasm3 working on the Arduino esp8266/esp32 platforms ... this repository is a collection of code I used for testing and the results I have had ...

# TLDR #
I can get all of the code to run ... seperatly ... but not all together.

## Example #1 (Fails)
* [ino source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_vm/wasm_vm.ino), 
* [app cpp source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_1/app.cpp), 
* [app h source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_1/arduino_api.h), 
* [app build script](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_1/build.sh), 
* [app wasm](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_1/app.wasm), 
* [app wat](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_1/app.wat)

Fails With [Stack Trace](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_1/trace.txt)
```
// loop()
void loop() {
  // Some example procedures showing how to display to the pixels:
  println("colorWipe ... ");
  colorWipe(Color(255, 0, 0), 50); // Red
  colorWipe(Color(0, 255, 0), 50); // Green
  colorWipe(Color(0, 0, 255), 50); // Blue

  // Send a theater pixel chase in...
  println("theaterChase ... ");
  theaterChase(Color(127, 127, 127), 50); // White
  theaterChase(Color(127, 0, 0), 50); // Red
  theaterChase(Color(0, 0, 127), 50); // Blue

  println("rainbow ... ");
  rainbow(20);
  println("theaterChaseRainbow ... ");
  theaterChaseRainbow(20);

  println("strandtest ... loop");
  
}
```
## Example #2 (Works)
* [ino source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_vm/wasm_vm.ino), 
* [app cpp source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_2/app.cpp), 
* [app h source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_2/arduino_api.h), 
* [app build script](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_2/build.sh), 
* [app wasm](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_2/app.wasm), 
* [app wat](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_2/app.wat)
```
// loop()
void loop() {
  // Some example procedures showing how to display to the pixels:
  println("colorWipe ... ");
  colorWipe(Color(255, 0, 0), 50); // Red
  colorWipe(Color(0, 255, 0), 50); // Green
  colorWipe(Color(0, 0, 255), 50); // Blue

  // Send a theater pixel chase in...
//  println("theaterChase ... ");
//  theaterChase(Color(127, 127, 127), 50); // White
//  theaterChase(Color(127, 0, 0), 50); // Red
//  theaterChase(Color(0, 0, 127), 50); // Blue

  println("rainbow ... ");
  rainbow(20);
  println("theaterChaseRainbow ... ");
  theaterChaseRainbow(20);

  println("strandtest ... loop");
  
}
```
## Example #3 (Works)
* [ino source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_vm/wasm_vm.ino), 
* [app cpp source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_3/app.cpp), 
* [app h source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_3/arduino_api.h), 
* [app build script](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_3/build.sh), 
* [app wasm](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_3/app.wasm), 
* [app wat](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_3/app.wat)
```
// loop()
void loop() {
  // Some example procedures showing how to display to the pixels:
  println("colorWipe ... ");
  colorWipe(Color(255, 0, 0), 50); // Red
  colorWipe(Color(0, 255, 0), 50); // Green
  colorWipe(Color(0, 0, 255), 50); // Blue

  // Send a theater pixel chase in...
  println("theaterChase ... ");
  theaterChase(Color(127, 127, 127), 50); // White
  theaterChase(Color(127, 0, 0), 50); // Red
  theaterChase(Color(0, 0, 127), 50); // Blue

//  println("rainbow ... ");
//  rainbow(20);
//  println("theaterChaseRainbow ... ");
//  theaterChaseRainbow(20);

  println("strandtest ... loop");
  
}
```
# The Rest Of The Story
My development envirnonmnet is as follows ...
* Ubuntu 18.04.3 LTS
* wasienv-0.5.4
* wasmer 2.0.0
* Arduion 1.8.10
* Arduino-esp32 1.0.6
* Arduino-esp8266 2.7.4
* Wasm3-arduino 0.5.0 (also tried current github)

I'm using one of the [examples](https://github.com/wasm3/wasm3-arduino/tree/main/examples_pio/Wasm_Advanced) provided by the [wasm3-arduino](https://github.com/wasm3/wasm3-arduino) project. Each step I took to get to the final app are located in the folders starting with a number. Folder "0-orig" are the original files ... and so on ... I choose to use the popular Asifruit_NeoPixel driver and strandtest_wheel.ino to merge into this code ... as a testing platform ...
I started out using an esp8266 but wasn't able to get more than 2 of the patterns to run at the same time ... so I originally thought the problem was RAM related (maybe fragmenting) so I tried an esp32 ... and things did improved ... I was able to run more of the patterns at the same time ... but still not the whole program ... so then I thought "more RAM". I dug out a esp32 with 4MB psram ... and hacked [m3_core.c](https://github.com/wasm3/wasm3-arduino/blob/main/src/m3_core.c) to use psram ... but still I couldn't run the whole code ... I also found the [Wasm_CoreMark](https://github.com/wasm3/wasm3-arduino/tree/main/examples/Wasm_CoreMark) sketch and it's 7769 byte wasm and realized ... my problem isn't memory ... so I tried to modify the code to be [different](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/app_other.cpp) but I end up with the same results ... I can get all of the code to run ... seperatly ... but not all together. I am fustrated and need help ;(

**my hopes for wasm3 seem to be dashed ...**
