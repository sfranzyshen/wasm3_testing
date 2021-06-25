(module
  (type $t0 (func))
  (type $t1 (func (param i32)))
  (type $t2 (func (param i32 i32)))
  (type $t3 (func (result i32)))
  (type $t4 (func (param i32 i32 i32) (result i32)))
  (import "arduino" "numPixels" (func $arduino.numPixels (type $t3)))
  (import "arduino" "setPixelColor32" (func $arduino.setPixelColor32 (type $t2)))
  (import "arduino" "show" (func $arduino.show (type $t0)))
  (import "arduino" "delay" (func $arduino.delay (type $t1)))
  (import "arduino" "print" (func $arduino.print (type $t2)))
  (import "arduino" "Color" (func $arduino.Color (type $t4)))
  (func $_start (type $t0)
    nop)
  (func $f7 (type $t1) (param $p0 i32)
    (local $l1 i32)
    call $arduino.numPixels
    if $I0
      loop $L1
        local.get $l1
        i32.const 65535
        i32.and
        local.get $p0
        call $arduino.setPixelColor32
        call $arduino.show
        i32.const 50
        call $arduino.delay
        call $arduino.numPixels
        local.get $l1
        i32.const 1
        i32.add
        local.tee $l1
        i32.const 65535
        i32.and
        i32.gt_u
        br_if $L1
      end
    end)
  (func $f8 (type $t1) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32)
    loop $L0
      i32.const 0
      local.set $l3
      loop $L1
        call $arduino.numPixels
        if $I2
          i32.const 0
          local.set $l1
          i32.const 0
          local.set $l2
          loop $L3
            local.get $l2
            local.get $l3
            i32.add
            i32.const 65535
            i32.and
            local.get $p0
            call $arduino.setPixelColor32
            call $arduino.numPixels
            local.get $l1
            i32.const 3
            i32.add
            local.tee $l2
            i32.const 65535
            i32.and
            local.tee $l1
            i32.gt_u
            br_if $L3
          end
        end
        call $arduino.show
        i32.const 50
        call $arduino.delay
        call $arduino.numPixels
        if $I4
          i32.const 0
          local.set $l1
          i32.const 0
          local.set $l2
          loop $L5
            local.get $l2
            local.get $l3
            i32.add
            i32.const 65535
            i32.and
            i32.const 0
            call $arduino.setPixelColor32
            call $arduino.numPixels
            local.get $l1
            i32.const 3
            i32.add
            local.tee $l2
            i32.const 65535
            i32.and
            local.tee $l1
            i32.gt_u
            br_if $L5
          end
        end
        local.get $l3
        i32.const 1
        i32.add
        local.tee $l3
        i32.const 3
        i32.ne
        br_if $L1
      end
      local.get $l4
      i32.const 1
      i32.add
      local.tee $l4
      i32.const 10
      i32.ne
      br_if $L0
    end)
  (func $setup (type $t0)
    i32.const 1024
    i32.const 21
    call $arduino.print
    i32.const 1099
    i32.const 1
    call $arduino.print)
  (func $loop (type $t0)
    i32.const 1046
    i32.const 14
    call $arduino.print
    i32.const 1099
    i32.const 1
    call $arduino.print
    i32.const 255
    i32.const 0
    i32.const 0
    call $arduino.Color
    call $f7
    i32.const 0
    i32.const 255
    i32.const 0
    call $arduino.Color
    call $f7
    i32.const 0
    i32.const 0
    i32.const 255
    call $arduino.Color
    call $f7
    i32.const 1061
    i32.const 17
    call $arduino.print
    i32.const 1099
    i32.const 1
    call $arduino.print
    i32.const 127
    i32.const 127
    i32.const 127
    call $arduino.Color
    call $f8
    i32.const 127
    i32.const 0
    i32.const 0
    call $arduino.Color
    call $f8
    i32.const 0
    i32.const 0
    i32.const 127
    call $arduino.Color
    call $f8
    i32.const 1079
    i32.const 19
    call $arduino.print
    i32.const 1099
    i32.const 1
    call $arduino.print)
  (memory $memory 1)
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "setup" (func $setup))
  (export "loop" (func $loop))
  (data $d0 (i32.const 1024) "\0astrandtest ... start\00colorWipe ... \00theaterChase ... \00strandtest ... loop\00\0a"))
