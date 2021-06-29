# Compile
wasicc  -Os                                                   \
        -z stack-size=8192 -Wl,--initial-memory=65536         \
        -Wl,--allow-undefined-file=arduino_api.syms           \
        -Wl,--strip-all -nostdlib                             \
        -o app_delay.wasm app_delay.cpp

# Optimize (optional)
wasm-opt -O3 app_delay.wasm -o app_delay.wasm
wasm-strip app_delay.wasm

# Convert to WAT
wasm2wat --generate-names app_delay.wasm -o app_delay.wat

# Convert to C header
mv app_delay.wasm app.wasm
xxd -i app.wasm > app_delay.wasm.h
mv app.wasm app_delay.wasm

# Copy wasm file
cp app_delay.wasm ../../wasm_vm/data/app_delay.wasm
#cp app_delay.wasm.h ../../wasm_vm/app_delay.wasm.h

wasicc  -Os                                                   \
        -z stack-size=8192 -Wl,--initial-memory=65536         \
        -Wl,--allow-undefined-file=arduino_api.syms           \
        -Wl,--strip-all -nostdlib                             \
        -o app_nodelay.wasm app_nodelay.cpp

# Optimize (optional)
wasm-opt -O3 app_nodelay.wasm -o app_nodelay.wasm
wasm-strip app_nodelay.wasm

# Convert to WAT
wasm2wat --generate-names app_nodelay.wasm -o app_nodelay.wat

# Convert to C header
mv app_nodelay.wasm app.wasm
xxd -i app.wasm > app_nodelay.wasm.h
mv app.wasm app_nodelay.wasm

# Copy wasm file
cp app_nodelay.wasm ../../wasm_vm/data/app_nodelay.wasm
#cp app_nodelay.wasm.h ../../wasm_vm/app_nodelay.wasm.h
