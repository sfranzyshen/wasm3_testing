(module
  (type $t0 (func))
  (type $t1 (func (param i32 i32)))
  (type $t2 (func (param i32)))
  (type $t3 (func (result i32)))
  (type $t4 (func (param i32) (result i32)))
  (type $t5 (func (param i32 i32 i32) (result i32)))
  (import "arduino" "numPixels" (func $arduino.numPixels (type $t3)))
  (import "arduino" "setPixelColor32" (func $arduino.setPixelColor32 (type $t1)))
  (import "arduino" "show" (func $arduino.show (type $t0)))
  (import "arduino" "delay" (func $arduino.delay (type $t2)))
  (import "arduino" "Wheel" (func $arduino.Wheel (type $t4)))
  (import "arduino" "print" (func $arduino.print (type $t1)))
  (import "arduino" "Color" (func $arduino.Color (type $t5)))
  (func $_start (type $t0)
    nop)
  (func $f8 (type $t2) (param $p0 i32)
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
  (func $setup (type $t0)
    i32.const 1024
    i32.const 21
    call $arduino.print
    i32.const 1119
    i32.const 1
    call $arduino.print)
  (func $loop (type $t0)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32)
    i32.const 1046
    i32.const 14
    call $arduino.print
    i32.const 1119
    i32.const 1
    call $arduino.print
    i32.const 255
    i32.const 0
    i32.const 0
    call $arduino.Color
    call $f8
    i32.const 0
    i32.const 255
    i32.const 0
    call $arduino.Color
    call $f8
    i32.const 0
    i32.const 0
    i32.const 255
    call $arduino.Color
    call $f8
    i32.const 1061
    i32.const 12
    call $arduino.print
    i32.const 1119
    i32.const 1
    call $arduino.print
    loop $L0
      call $arduino.numPixels
      if $I1
        i32.const 0
        local.set $l0
        loop $L2
          local.get $l0
          i32.const 65535
          i32.and
          local.get $l0
          local.get $l1
          i32.add
          i32.const 255
          i32.and
          call $arduino.Wheel
          call $arduino.setPixelColor32
          call $arduino.numPixels
          local.get $l0
          i32.const 1
          i32.add
          local.tee $l0
          i32.const 65535
          i32.and
          i32.gt_u
          br_if $L2
        end
      end
      call $arduino.show
      i32.const 20
      call $arduino.delay
      local.get $l1
      i32.const 1
      i32.add
      local.tee $l1
      i32.const 65535
      i32.and
      i32.const 256
      i32.lt_u
      br_if $L0
    end
    i32.const 1074
    i32.const 24
    call $arduino.print
    i32.const 1119
    i32.const 1
    call $arduino.print
    loop $L3
      i32.const 0
      local.set $l2
      loop $L4
        call $arduino.numPixels
        if $I5
          i32.const 0
          local.set $l0
          i32.const 0
          local.set $l1
          loop $L6
            local.get $l1
            local.get $l2
            i32.add
            i32.const 65535
            i32.and
            local.get $l0
            local.get $l3
            i32.add
            i32.const 255
            i32.rem_u
            call $arduino.Wheel
            call $arduino.setPixelColor32
            call $arduino.numPixels
            local.get $l0
            i32.const 3
            i32.add
            local.tee $l1
            i32.const 65535
            i32.and
            local.tee $l0
            i32.gt_u
            br_if $L6
          end
        end
        call $arduino.show
        i32.const 20
        call $arduino.delay
        call $arduino.numPixels
        if $I7
          i32.const 0
          local.set $l0
          i32.const 0
          local.set $l1
          loop $L8
            local.get $l1
            local.get $l2
            i32.add
            i32.const 65535
            i32.and
            i32.const 0
            call $arduino.setPixelColor32
            call $arduino.numPixels
            local.get $l0
            i32.const 3
            i32.add
            local.tee $l1
            i32.const 65535
            i32.and
            local.tee $l0
            i32.gt_u
            br_if $L8
          end
        end
        local.get $l2
        i32.const 1
        i32.add
        local.tee $l2
        i32.const 3
        i32.ne
        br_if $L4
      end
      local.get $l3
      i32.const 1
      i32.add
      local.tee $l3
      i32.const 256
      i32.ne
      br_if $L3
    end
    i32.const 1099
    i32.const 19
    call $arduino.print
    i32.const 1119
    i32.const 1
    call $arduino.print)
  (memory $memory 1)
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "setup" (func $setup))
  (export "loop" (func $loop))
  (data $d0 (i32.const 1024) "\0astrandtest ... start\00colorWipe ... \00rainbow ... \00theaterChaseRainbow ... \00strandtest ... loop\00\0a"))
