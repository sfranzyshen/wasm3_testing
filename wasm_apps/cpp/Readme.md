## Examples

This directory contains two examples of Arduino app (sketch) that is compiled to WebAssembly.
* **app_delay.cpp** this is the infamous strandtest example from the Adifruit_Neopixel project.
* **app_nodelay.cpp** this is a rewite of the strandtest example to be non-blocking (uses no delay()s)

Compilation is performed using localized build tools provided by `wasi-sdk` See `build.sh` for details.
