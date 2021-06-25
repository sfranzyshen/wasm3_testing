# Wasm3 Testing #

I have had a hell of a time trying to get wasm3 working on the esp8266/esp32 platforms ... this repository is a collection of code I used for testing and the results I had ...


# TLDR #
I can get all of the code to run ... seperatly ... but not all together.

## Example #1 (Fails)
[ino source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_vm/wasm_vm.ino), 
[app cpp source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_1/app.cpp), 
[app h source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_1/arduino_api.h), 
[app build script](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_1/build.sh), 
[app wasm](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_1/app.wasm), 
[app wat](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_1/app.wat)

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
[ino source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_vm/wasm_vm.ino), 
[app cpp source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_2/app.cpp), 
[app h source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_2/arduino_api.h), 
[app build script](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_2/build.sh), 
[app wasm](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_2/app.wasm), 
[app wat](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_2/app.wat)
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
[ino source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_vm/wasm_vm.ino), 
[app cpp source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_3/app.cpp), 
[app h source](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_3/arduino_api.h), 
[app build script](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_3/build.sh), 
[app wasm](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_3/app.wasm), 
[app wat](https://github.com/sfranzyshen/wasm3_testing/blob/main/wasm_apps/cpp/example_3/app.wat)
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

# The Rest Of It

I started out using one of the [examples](https://github.com/wasm3/wasm3-arduino/tree/main/examples_pio/Wasm_Advanced) provided by the [wasm3-arduino](https://github.com/wasm3/wasm3-arduino) project.

**my hopes for wasm3 seem to be dashed ...**
