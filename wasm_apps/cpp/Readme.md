## Examples

This directory contains two examples for Arduino app (sketch) that is compiled to WebAssembly.
* **app_delay.cpp** this is the infamous strandtest example from the Adifruit_Neopixel project.
* **app_nodelay.cpp** this is a rewite of the strandtest example to be non-blocking (use no delay()s)

Compilation is performed using `wasicc` here, but `clang --target=wasm32` can be used as well.  
See `build.sh` for details.
