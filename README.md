# Wasm3 Testing #

## Latest News 6/28/2021
After reading the following statment in this [document](https://github.com/wasm3/wasm3/blob/main/docs/Interpreter.md#stack-usage) from the wasm3 project ... I decided to try something different ... and it's working on both the ESP32 and esp8266 platforms !!

```Returning from a Wasm function also unwinds the stack, back to the point of the Call operation.```

the work around for wasm3 issue [#241](https://github.com/wasm3/wasm3/issues/241) is to write the code inside the wasm app to be non blocking ... allowing the execution flow to return back to the arduino host, resetting the stack used ... **bingo!** 

### more to follow soon
