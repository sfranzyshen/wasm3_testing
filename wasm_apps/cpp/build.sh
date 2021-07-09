bin/clang -cc1 \
-triple wasm32-unknown-wasi \
-emit-obj \
-disable-free \
-disable-llvm-verifier \
-discard-value-names \
-main-file-name app_delay.cpp \
-mrelocation-model static \
-mthread-model posix \
-masm-verbose \
-mconstructor-aliases \
-fuse-init-array \
-target-cpu generic \
-fvisibility hidden \
-dwarf-column-info \
-debugger-tuning=gdb \
-momit-leaf-frame-pointer \
-v \
-resource-dir lib/clang/9.0.0 \
-D _WASI_EMULATED_MMAN \
-isysroot ../cpp \
-internal-isystem include/wasm32-wasi/c++/v1 \
-internal-isystem include/c++/v1 \
-internal-isystem lib/clang/9.0.0/include \
-internal-isystem include/wasm32-wasi \
-internal-isystem include \
-Os \
-fdeprecated-macro \
-ferror-limit 19 \
-fmessage-length 0 \
-fobjc-runtime=gnustep \
-fcxx-exceptions \
-fexceptions \
-fno-common \
-fdiagnostics-show-option \
-fcolor-diagnostics \
-vectorize-loops \
-vectorize-slp \
-o app_delay.o \
-x c++ \
app_delay.cpp


 bin/wasm-ld \
 -Llib/wasm32-wasi \
 -z stack-size=8192 \
 --initial-memory=65536 \
 --allow-undefined-file=arduino_api.syms \
 --strip-all \
 app_delay.o \
 -o app_delay.wasm
 
 
 # Optimize (optional)
bin/wasm-opt -O3 app_delay.wasm -o app_delay.wasm
bin/wasm-strip app_delay.wasm

# Convert to WAT
bin/wasm2wat --generate-names app_delay.wasm -o app_delay.wat

# Convert to C header
mv app_delay.wasm app.wasm
xxd -i app.wasm > app_delay.wasm.h
mv app.wasm app_delay.wasm

# Copy wasm file
cp app_delay.wasm ../../wasm_vm/data/app_delay.wasm


bin/clang -cc1 \
-triple wasm32-unknown-wasi \
-emit-obj \
-disable-free \
-disable-llvm-verifier \
-discard-value-names \
-main-file-name app_nodelay.cpp \
-mrelocation-model static \
-mthread-model posix \
-masm-verbose \
-mconstructor-aliases \
-fuse-init-array \
-target-cpu generic \
-fvisibility hidden \
-dwarf-column-info \
-debugger-tuning=gdb \
-momit-leaf-frame-pointer \
-v \
-resource-dir lib/clang/9.0.0 \
-D _WASI_EMULATED_MMAN \
-isysroot ../cpp \
-internal-isystem include/wasm32-wasi/c++/v1 \
-internal-isystem include/c++/v1 \
-internal-isystem lib/clang/9.0.0/include \
-internal-isystem include/wasm32-wasi \
-internal-isystem include \
-Os \
-fdeprecated-macro \
-ferror-limit 19 \
-fmessage-length 0 \
-fobjc-runtime=gnustep \
-fcxx-exceptions \
-fexceptions \
-fno-common \
-fdiagnostics-show-option \
-fcolor-diagnostics \
-vectorize-loops \
-vectorize-slp \
-o app_nodelay.o \
-x c++ \
app_nodelay.cpp


 bin/wasm-ld \
 -Llib/wasm32-wasi \
 -z stack-size=8192 \
 --initial-memory=65536 \
 --allow-undefined-file=arduino_api.syms \
 --strip-all \
 app_nodelay.o \
 -o app_nodelay.wasm
 
 
 # Optimize (optional)
bin/wasm-opt -O3 app_nodelay.wasm -o app_nodelay.wasm
bin/wasm-strip app_nodelay.wasm

# Convert to WAT
bin/wasm2wat --generate-names app_nodelay.wasm -o app_nodelay.wat

# Convert to C header
mv app_nodelay.wasm app.wasm
xxd -i app.wasm > app_nodelay.wasm.h
mv app.wasm app_nodelay.wasm

# Copy wasm file
cp app_nodelay.wasm ../../wasm_vm/data/app_nodelay.wasm


