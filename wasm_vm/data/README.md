this is a modification of Ben Smith's [wasm-clang demonstration](https://github.com/binji/wasm-clang) to be used with wasm3 on the esp platform.

## Running Clang/LLD in the browser producing a wasm file and uploading it to a esp device running a Wasm3 VM

## Directory structure

- `clang.wasm`: clang compiler, compiled to wasm w/ WASI
- `lld.wasm`: lld linker, compiled to wasm w/ WASI
- `memfs.wasm`: wasm w/ WASI implementation of in-memory filesystem,
- `index.html`: the web page
- `index.css`: css file for the web page
- `index.js`: javascript file for the web page
- `shared.js`: shared utilities for all tools
- `service_worker.js`: Service worker used by the web page
- `worker.js`: Dedicated work used to compile
- `sysroot.tar`: C++ standard headers and libraries


