#include "arduino_api.h"

unsigned long patternPrevious = 0;             // Previous Pattern Millis
int           patternCurrent = 0;              // Current Pattern Number
int           patternInterval = 5500;          // Pattern Interval (ms)
unsigned long pixelPrevious = 0;               // Previous Pixel Millis
uint8_t       pixelInterval = 50;              // Pixel Interval (ms)
int           pixelQueue = 0;                  // Pixel Queue
int           pixelCycle = 0;                  // Pixel Cycle
uint16_t      pixelCurrent = 0;                // Current Pixel Number
uint16_t      pixelNumber = numPixels(); // Number of Pixels

// colorWipe()
void colorWipe(uint8_t r, uint8_t g, uint8_t b, uint8_t wait) {
  if(pixelInterval != wait) pixelInterval = wait;
  setPixelColor(pixelCurrent, Color(r, g, b));
  show();
  pixelCurrent++;
  if(pixelCurrent >= pixelNumber) {
    pixelCurrent = 0;
    clear();
  }
}

// rainbow()
void rainbow(uint8_t wait) {
  if(pixelInterval != wait) pixelInterval = wait;
  uint16_t i = 0;
  int p = 0;
  while(i < pixelNumber) {
    p = (i + pixelCycle) & 255;
    setPixelColor(i, Wheel(p));
    i++;
  }
  show();
  pixelCycle++;
  if(pixelCycle > 255) pixelCycle = 0;
}

// rainbowCycle()
void rainbowCycle(uint8_t wait) {
  if(pixelInterval != wait) pixelInterval = wait;
  uint16_t i = 0;
  int p = 0;
  while( i < pixelNumber) {
    p = ((i * 256 / pixelNumber) + pixelCycle) & 255;
    setPixelColor(i, Wheel(p));
    i++;
  }
  show();
  pixelCycle++;
  if(pixelCycle > 255 * 5) pixelCycle = 0;
}

// theaterChase()
void theaterChase(uint8_t r, uint8_t g, uint8_t b, uint8_t wait) {
  if(pixelInterval != wait) pixelInterval = wait;
  int i = 0;
  while(i < pixelNumber) {
    setPixelColor(i + pixelQueue, Color(r, g, b));
    i = i + 3;
  }
  show();
  i = 0;
  while(i < pixelNumber) {
    setPixelColor(i + pixelQueue, Color(0, 0, 0));
    i = i + 3;
  }
  pixelQueue++;
  if(pixelQueue >= 3) pixelQueue = 0;
}

// theaterChaseRainbow()
void theaterChaseRainbow(uint8_t wait) {
  if(pixelInterval != wait) pixelInterval = wait;
  int i = 0;
  int p = 0;
  while(i < pixelNumber) {
    p = (i + pixelCycle) % 255;
    setPixelColor(i + pixelQueue, Wheel(p));
    i = i + 3;
  }
  show();
  i = 0;
  while( i < pixelNumber) {
    setPixelColor(i + pixelQueue, Color(0, 0, 0));
    i = i + 3;
  }      
  pixelQueue++;
  pixelCycle++;
  if(pixelQueue >= 3) pixelQueue = 0;
  if(pixelCycle > 255) pixelCycle = 0;
}

// setup()
void setup() {
  println("\nstrandtest_nodelay ... start");
}

// loop()
void loop() {
  unsigned long currentMillis = millis();
  if((currentMillis - patternPrevious) >= patternInterval) {
    patternPrevious = currentMillis ;
    patternCurrent++;
    if(patternCurrent == 9) println("theaterChaseRainbow");
    else if(patternCurrent == 8) println("rainbowCycle");
    else if(patternCurrent == 7) println("rainbow");
    else if(patternCurrent == 6) println("theaterChase Blue");  // Blue
    else if(patternCurrent == 5) println("theaterChase Red");   // Red
    else if(patternCurrent == 4) println("theaterChase White"); // White
    else if(patternCurrent == 3) println("colorWipe Blue");     // Blue
    else if(patternCurrent == 2) println("colorWipe Green");    // Green
    else if(patternCurrent == 1) println("colorWipe Red");      // Red	
    if(patternCurrent >= 9) {
      patternCurrent = 0;
      println("strandtest_nodelay ... loop");
    }
  }  
  if(currentMillis - pixelPrevious >= pixelInterval) {
    pixelPrevious = currentMillis;
    if(patternCurrent == 9) theaterChaseRainbow(50);
    else if(patternCurrent == 8) rainbowCycle(20);
    else if(patternCurrent == 7) rainbow(20);
    else if(patternCurrent == 6) theaterChase(0, 0, 127, 50);     // Blue
    else if(patternCurrent == 5) theaterChase(127, 0, 0, 50);     // Red
    else if(patternCurrent == 4) theaterChase(127, 127, 127, 50); // White
    else if(patternCurrent == 3) colorWipe(0, 0, 255, 50);        // Blue
    else if(patternCurrent == 2) colorWipe(0, 255, 0, 50);        // Green
    else if(patternCurrent == 1) colorWipe(255, 0, 0, 50);        // Red
  }    
}
