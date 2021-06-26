(module
  (type $t0 (func))
  (type $t1 (func (param i32)))
  (type $t2 (func (param i32 i32)))
  (type $t3 (func (param i32 i32 i32) (result i32)))
  (type $t4 (func (result i32)))
  (type $t5 (func (param i32) (result i32)))
  (import "arduino" "Color" (func $arduino.Color (type $t3)))
  (import "arduino" "numPixels" (func $arduino.numPixels (type $t4)))
  (import "arduino" "setPixelColor" (func $arduino.setPixelColor (type $t2)))
  (import "arduino" "show" (func $arduino.show (type $t0)))
  (import "arduino" "delay" (func $arduino.delay (type $t1)))
  (import "arduino" "print" (func $arduino.print (type $t2)))
  (func $_start (type $t0)
    nop)
  (func $f7 (type $t5) (param $p0 i32) (result i32)
    local.get $p0
    i32.const 171
    i32.ge_s
    if $I0
      local.get $p0
      i32.const -1
      i32.xor
      i32.const 3
      i32.mul
      local.tee $p0
      i32.const -1
      i32.xor
      i32.const 255
      i32.and
      i32.const 0
      local.get $p0
      i32.const 255
      i32.and
      call $arduino.Color
      return
    end
    local.get $p0
    i32.const 86
    i32.ge_s
    if $I1
      i32.const 0
      i32.const -86
      local.get $p0
      i32.sub
      i32.const 3
      i32.mul
      local.tee $p0
      i32.const 255
      i32.and
      local.get $p0
      i32.const -1
      i32.xor
      i32.const 255
      i32.and
      call $arduino.Color
      return
    end
    i32.const 85
    local.get $p0
    i32.sub
    i32.const 3
    i32.mul
    local.tee $p0
    i32.const 255
    i32.and
    local.get $p0
    i32.const -1
    i32.xor
    i32.const 255
    i32.and
    i32.const 0
    call $arduino.Color)
  (func $f8 (type $t1) (param $p0 i32)
    (local $l1 i32)
    call $arduino.numPixels
    if $I0
      loop $L1
        local.get $l1
        i32.const 65535
        i32.and
        local.get $p0
        call $arduino.setPixelColor
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
  (func $f9 (type $t1) (param $p0 i32)
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
            call $arduino.setPixelColor
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
            call $arduino.setPixelColor
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
    i32.const 1137
    i32.const 1
    call $arduino.print)
  (func $loop (type $t0)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32)
    i32.const 1046
    i32.const 12
    call $arduino.print
    i32.const 1137
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
          call $f7
          call $arduino.setPixelColor
          call $arduino.numPixels
          local.get $l0
          i32.const 1
          i32.add
          local.tee $l0
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
      i32.const 256
      i32.ne
      br_if $L0
    end
    i32.const 1059
    i32.const 24
    call $arduino.print
    i32.const 1137
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
            call $f7
            call $arduino.setPixelColor
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
            call $arduino.setPixelColor
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
    i32.const 1084
    i32.const 14
    call $arduino.print
    i32.const 1137
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
    i32.const 1099
    i32.const 17
    call $arduino.print
    i32.const 1137
    i32.const 1
    call $arduino.print
    i32.const 127
    i32.const 127
    i32.const 127
    call $arduino.Color
    call $f9
    i32.const 127
    i32.const 0
    i32.const 0
    call $arduino.Color
    call $f9
    i32.const 0
    i32.const 0
    i32.const 127
    call $arduino.Color
    call $f9
    i32.const 1117
    i32.const 19
    call $arduino.print
    i32.const 1137
    i32.const 1
    call $arduino.print)
  (memory $memory 1)
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "setup" (func $setup))
  (export "loop" (func $loop))
  (data $d0 (i32.const 1024) "\0astrandtest ... start\00rainbow ... \00theaterChaseRainbow ... \00colorWipe ... \00theaterChase ... \00strandtest ... loop\00\0a"))
