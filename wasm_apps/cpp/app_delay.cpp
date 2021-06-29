#include "arduino_api.h"

int patternCurrent = 0;              // Current Pattern Number


//Theatre-style crawling lights with rainbow effect
void theaterChaseRainbow(uint8_t wait) {
  for (int j=0; j <= 255; j++) {     // cycle all 256 colors in the wheel
    for (int q=0; q < 3; q++) {
      for (uint16_t i=0; i < numPixels(); i=i+3) {
        setPixelColor(i+q, Wheel( (i+j) % 255));    //turn every third pixel on
      }
      show();

      delay(wait);

      for (uint16_t i=0; i < numPixels(); i=i+3) {
        setPixelColor(i+q, 0);        //turn every third pixel off
      }
    }
  }
}

// Fill the dots one after the other with a color
void colorWipe(uint32_t c, uint8_t wait) {
  for(uint16_t i=0; i<numPixels(); i++) {
    setPixelColor(i, c);
    show();
    delay(wait);
  }
}

//Rainbow effect
void rainbow(uint8_t wait) {
  uint16_t i, j;

  for(j=0; j<=255; j++) {
    for(i=0; i<numPixels(); i++) {
      setPixelColor(i, Wheel((i+j) & 255));
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
        setPixelColor(i+q, c);    //turn every third pixel on
      }
      show();

      delay(wait);

      for (uint16_t i=0; i < numPixels(); i=i+3) {
        setPixelColor(i+q, 0);        //turn every third pixel off
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
    patternCurrent++;

	// Some example procedures showing how to display to the pixels:

	if(patternCurrent == 8) { println("theaterChaseRainbow"); theaterChaseRainbow(50); }
    else if(patternCurrent == 7) { println("rainbow"); rainbow(20); }
    else if(patternCurrent == 6) { println("theaterChase Blue"); theaterChase(Color(0, 0, 127), 50); }      // Blue
    else if(patternCurrent == 5) { println("theaterChase Red"); theaterChase(Color(127, 0, 0), 50); }       // Red
    else if(patternCurrent == 4) { println("theaterChase White"); theaterChase(Color(127, 127, 127), 50); } // White
    else if(patternCurrent == 3) { println("colorWipe Blue"); colorWipe(Color(0, 0, 255), 50); }            // Blue
    else if(patternCurrent == 2) { println("colorWipe Green"); colorWipe(Color(0, 255, 0), 50); }           // Green
    else if(patternCurrent == 1) { println("colorWipe Red"); colorWipe(Color(255, 0, 0), 50); }             // Red
    if(patternCurrent >= 8) {
      patternCurrent = 0;
	  println("strandtest ... loop");
    }
}
