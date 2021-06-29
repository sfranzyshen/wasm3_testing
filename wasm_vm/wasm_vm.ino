#include <wasm3.h>
#include <m3_env.h>
#include <FS.h>
#ifdef ESP32
#include <SPIFFS.h>
#endif
#include <Adafruit_NeoPixel.h>

#define LED_PIN   18
#define LED_COUNT 10
#define LED_BRIGHT 50

#define WASM_FILE "/app_nodelay.wasm" 
//#define WASM_FILE "/app_delay.wasm" 

#define FATAL(func, msg) { Serial.print("Fatal: " func " "); Serial.println(msg); return; }

#define WASM_STACK_SLOTS    (2*1024) // started at 2048
#define NATIVE_STACK_SIZE   (32*1024)

// For (most) devices that cannot allocate a 64KiB wasm page
#define WASM_MEMORY_LIMIT   (3*1024)

Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_GRB + NEO_KHZ800);

IM3Environment  m3_env;
IM3Runtime      m3_runtime;
IM3Module       m3_module;
IM3Function     m3_setup;
IM3Function     m3_loop;
bool            m3_init = false;

uint32_t Wheel(uint8_t Pos) {
  Pos = 255 - Pos;
  if(Pos < 85) {
    return strip.Color(255 - Pos * 3, 0, Pos * 3);
  }
  if(Pos < 170) {
    Pos -= 85;
    return strip.Color(0, Pos * 3, 255 - Pos * 3);
  }
  Pos -= 170;
  return strip.Color(Pos * 3, 255 - Pos * 3, 0);
}

m3ApiRawFunction(m3_arduino_millis) {
    m3ApiReturnType (uint32_t)

    m3ApiReturn(millis());
}

m3ApiRawFunction(m3_arduino_delay) {
    m3ApiGetArg     (uint32_t, ms)
    
    delay(ms);
    m3ApiSuccess();
}

/*
m3ApiRawFunction(m3_arduino_delay) { // hooked
  m3ApiGetArg   (uint32_t, milli)

  unsigned long targetMillis = millis() + milli;
  unsigned long currentMillis = millis();
  
  while(currentMillis < targetMillis) {
    yield(); // add code here
    currentMillis = millis();
  }
  m3ApiSuccess();
}
*/

m3ApiRawFunction(m3_arduino_print) {
    m3ApiGetArgMem  (const uint8_t *, buf)
    m3ApiGetArg     (uint8_t,        len)

    Serial.write(buf, len);
    m3ApiSuccess();
}

m3ApiRawFunction(m3_arduino_numPixels) {
    m3ApiReturnType (uint16_t)
  
    m3ApiReturn(strip.numPixels());
}

m3ApiRawFunction(m3_arduino_clear) {
    strip.clear();
    m3ApiSuccess();
}

m3ApiRawFunction(m3_arduino_show) {
    strip.show();
    delay(0);
    m3ApiSuccess();
}

/*
m3ApiRawFunction(m3_arduino_gamma32) {
    m3ApiReturnType (uint32_t)
    m3ApiGetArg     (uint32_t, color)
  
    m3ApiReturn(strip.gamma32(color));
}

m3ApiRawFunction(m3_arduino_ColorHSV) {
    m3ApiReturnType (uint32_t)
    m3ApiGetArg     (uint16_t, hue)
    m3ApiGetArg     (uint8_t, sat)
    m3ApiGetArg     (uint8_t, val)  
  
    m3ApiReturn(strip.ColorHSV(hue, sat, val));
}
*/

m3ApiRawFunction(m3_arduino_setPixelColor) {
  m3ApiGetArg     (uint16_t, n)
  m3ApiGetArg     (uint32_t, c)

  strip.setPixelColor(n, c);

  m3ApiSuccess();
}

m3ApiRawFunction(m3_arduino_Color) {
    m3ApiReturnType   (uint32_t)
    m3ApiGetArg       (uint8_t, r)
    m3ApiGetArg       (uint8_t, g)
    m3ApiGetArg       (uint8_t, b)  
  
    m3ApiReturn(strip.Color(r, g, b));
}

m3ApiRawFunction(m3_arduino_Wheel) {
    m3ApiReturnType (uint32_t)
    m3ApiGetArg     (uint8_t, pos)
  
    m3ApiReturn(Wheel(pos));
}

M3Result  LinkArduino  (IM3Runtime runtime) {
    IM3Module module = runtime->modules;
    const char* arduino = "arduino";

    m3_LinkRawFunction (module, arduino, "millis",           "i()",    &m3_arduino_millis);
    m3_LinkRawFunction (module, arduino, "delay",            "v(i)",   &m3_arduino_delay);
    m3_LinkRawFunction (module, arduino, "print",            "v(*i)",  &m3_arduino_print);
    m3_LinkRawFunction (module, arduino, "show",             "v()",    &m3_arduino_show);
    m3_LinkRawFunction (module, arduino, "clear",            "v()",    &m3_arduino_clear);
    m3_LinkRawFunction (module, arduino, "setPixelColor",    "v(ii)",  &m3_arduino_setPixelColor);
    //m3_LinkRawFunction (module, arduino, "gamma32",          "i(i)",   &m3_arduino_gamma32);
    //m3_LinkRawFunction (module, arduino, "ColorHSV",         "i(iii)", &m3_arduino_ColorHSV);
    m3_LinkRawFunction (module, arduino, "Wheel",            "i(i)",   &m3_arduino_Wheel);
    m3_LinkRawFunction (module, arduino, "numPixels",        "i()",    &m3_arduino_numPixels);
    m3_LinkRawFunction (module, arduino, "Color",            "i(iii)", &m3_arduino_Color);

    return m3Err_none;
}

size_t readWasmFileSize(const char *path) {
  //Serial.printf("Reading file: %s\n", path);

  if (!SPIFFS.exists(path))
  {
    Serial.println("File not found");
    return 0;
  }

  File file = SPIFFS.open(path, "r");
  if (!file)
  {
    Serial.println("Failed to open file for reading");
    return 0;
  }
  size_t size = file.size();
  file.close();
  return size;
}

size_t readWasmFile(const char *path, uint8_t *buf)
{
  Serial.printf("Reading file: %s\n", path);

  if (!SPIFFS.exists(path))
  {
    Serial.println("File not found");
    return 0;
  }

  File file = SPIFFS.open(path, "r");
  if (!file)
  {
    Serial.println("Failed to open file for reading");
    return 0;
  }

  Serial.print("Read from file: ");
  Serial.println(path);
  size_t i = 0;
  while (file.available())
  {
    buf[i] = file.read();
    i++;
  }
  file.close();

  return i;
}

void vm_loop() {
   if(m3_init) {
      M3Result result = m3_CallV (m3_loop);
      if (result) {
          m3_init = false;
          M3ErrorInfo info;
          m3_GetErrorInfo (m3_runtime, &info);
          Serial.print("Error: ");
          Serial.print(result);
          Serial.print(" (");
          Serial.print(info.message);
          Serial.println(")");
          if (info.file && strlen(info.file) && info.line) {
             Serial.print("At ");
             Serial.print(info.file);
             Serial.print(":");
             Serial.println(info.line);
          }
      }
   }
}

void vm_init() {
    M3Result result = m3Err_none;

    m3_env = m3_NewEnvironment ();
    if (!m3_env) FATAL("NewEnvironment", "failed");

    m3_runtime = m3_NewRuntime (m3_env, WASM_STACK_SLOTS, NULL);
    if (!m3_runtime) FATAL("NewRuntime", "failed");

#ifdef WASM_MEMORY_LIMIT
    m3_runtime->memoryLimit = WASM_MEMORY_LIMIT;
#endif

    // load wasm from filesystem
    size_t app_wasm_len = readWasmFileSize(WASM_FILE);
    if (app_wasm_len == 0)
      FATAL("ReadWasm", "File not found")

    uint8_t* app_wasm = (uint8_t*) malloc(app_wasm_len);

    size_t read_bytes = readWasmFile(WASM_FILE, app_wasm);
    if (read_bytes == 0)
      FATAL("ReadWasm", "File not found")

    result = m3_ParseModule (m3_env, &m3_module, app_wasm, app_wasm_len);
    if (result) FATAL("ParseModule", result);

    result = m3_LoadModule (m3_runtime, m3_module);
    if (result) FATAL("LoadModule", result);

    result = LinkArduino (m3_runtime);
    if (result) FATAL("LinkArduino", result);

    result = m3_FindFunction (&m3_setup, m3_runtime, "setup");
    if (result) FATAL("FindFunction setup() ", result);

    result = m3_FindFunction (&m3_loop, m3_runtime, "loop");
    if (result) {
      FATAL("FindFunction loop()", result);
    } else {
      Serial.println("WebAssembly VM Running ...");
      m3_init = true;
    }

    result = m3_CallV (m3_setup);
    if (result) {
        m3_init = false;
        M3ErrorInfo info;
        m3_GetErrorInfo (m3_runtime, &info);
        Serial.print("Error: ");
        Serial.print(result);
        Serial.print(" (");
        Serial.print(info.message);
        Serial.println(")");
        if (info.file && strlen(info.file) && info.line) {
            Serial.print("At ");
            Serial.print(info.file);
            Serial.print(":");
            Serial.println(info.line);
        }
    }
}

void setup() {
    Serial.begin(115200);
    Serial.println("\nWasm3 v" M3_VERSION " (" M3_ARCH "), build " __DATE__ " " __TIME__);
    SPIFFS.begin();
    strip.updateLength(LED_COUNT);
    strip.setPin(LED_PIN);
    strip.begin();
    strip.show();
    strip.setBrightness(LED_BRIGHT);    
    vm_init();
}

void loop() {
    vm_loop();
    //yield(); // add code here
}
