#include "arduino_api.h"

// Fill the dots one after the other with a color
void colorWipe(uint32_t c, uint8_t wait) {
  for(uint16_t i=0; i<numPixels(); i++) {
    setPixelColor32(i, c);
    show();
    delay(wait);
  }
}

void rainbow(uint8_t wait) {
  uint16_t i, j;

  for(j=0; j<=255; j++) {
    for(i=0; i<numPixels(); i++) {
      setPixelColor32(i, Wheel((i+j) & 255));
    }
    show();
    delay(wait);
  }
}

//Theatre-style crawling lights.
void theaterChase(uint32_t c, uint8_t wait) {
  for (int j=0; j<10; j++) {  //do 10 cycles of chasing
    for (int q=0; q < 3; q++) {
      for (uint16_t i=0; i < numPixels(); i=i+3) {
        setPixelColor32(i+q, c);    //turn every third pixel on
      }
      show();

      delay(wait);

      for (uint16_t i=0; i < numPixels(); i=i+3) {
        setPixelColor32(i+q, 0);        //turn every third pixel off
      }
    }
  }
}

//Theatre-style crawling lights with rainbow effect
void theaterChaseRainbow(uint8_t wait) {
  for (int j=0; j <= 255; j++) {     // cycle all 256 colors in the wheel
    for (int q=0; q < 3; q++) {
      for (uint16_t i=0; i < numPixels(); i=i+3) {
        setPixelColor32(i+q, Wheel( (i+j) % 255));    //turn every third pixel on
      }
      show();

      delay(wait);

      for (uint16_t i=0; i < numPixels(); i=i+3) {
        setPixelColor32(i+q, 0);        //turn every third pixel off
      }
    }
  }
}

// setup()
void setup() {
	println("\nstrandtest ... start");
}

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
