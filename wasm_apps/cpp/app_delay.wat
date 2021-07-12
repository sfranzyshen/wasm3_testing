(module
  (type $t0 (func (result i32)))
  (type $t1 (func (param i32) (result i32)))
  (type $t2 (func (param i32 i32)))
  (type $t3 (func))
  (type $t4 (func (param i32)))
  (type $t5 (func (param i32 i32 i32) (result i32)))
  (import "arduino" "numPixels" (func $arduino.numPixels (type $t0)))
  (import "arduino" "Wheel" (func $arduino.Wheel (type $t1)))
  (import "arduino" "setPixelColor" (func $arduino.setPixelColor (type $t2)))
  (import "arduino" "show" (func $arduino.show (type $t3)))
  (import "arduino" "delay" (func $arduino.delay (type $t4)))
  (import "arduino" "print" (func $arduino.print (type $t2)))
  (import "arduino" "Color" (func $arduino.Color (type $t5)))
  (func $_start (type $t3))
  (func $f8 (type $t4) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32)
    i32.const 0
    local.set $l1
    loop $L0
      i32.const 0
      local.set $l2
      loop $L1
        block $B2
          call $arduino.numPixels
          i32.eqz
          br_if $B2
          i32.const 0
          local.set $l3
          i32.const 0
          local.set $l4
          loop $L3
            local.get $l4
            local.get $l2
            i32.add
            i32.const 65535
            i32.and
            local.get $l3
            local.get $l1
            i32.add
            i32.const 255
            i32.rem_u
            call $arduino.Wheel
            call $arduino.setPixelColor
            local.get $l3
            i32.const 3
            i32.add
            local.tee $l4
            i32.const 65535
            i32.and
            local.tee $l3
            call $arduino.numPixels
            i32.lt_u
            br_if $L3
          end
        end
        call $arduino.show
        local.get $p0
        call $arduino.delay
        block $B4
          call $arduino.numPixels
          i32.eqz
          br_if $B4
          i32.const 0
          local.set $l3
          i32.const 0
          local.set $l4
          loop $L5
            local.get $l4
            local.get $l2
            i32.add
            i32.const 65535
            i32.and
            i32.const 0
            call $arduino.setPixelColor
            local.get $l3
            i32.const 3
            i32.add
            local.tee $l4
            i32.const 65535
            i32.and
            local.tee $l3
            call $arduino.numPixels
            i32.lt_u
            br_if $L5
          end
        end
        local.get $l2
        i32.const 1
        i32.add
        local.tee $l2
        i32.const 3
        i32.ne
        br_if $L1
      end
      local.get $l1
      i32.const 1
      i32.add
      local.tee $l1
      i32.const 256
      i32.ne
      br_if $L0
    end)
  (func $f9 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32)
    block $B0
      call $arduino.numPixels
      i32.eqz
      br_if $B0
      i32.const 0
      local.set $l2
      loop $L1
        local.get $l2
        i32.const 65535
        i32.and
        local.get $p0
        call $arduino.setPixelColor
        call $arduino.show
        local.get $p1
        call $arduino.delay
        local.get $l2
        i32.const 1
        i32.add
        local.tee $l2
        i32.const 65535
        i32.and
        call $arduino.numPixels
        i32.lt_u
        br_if $L1
      end
    end)
  (func $f10 (type $t4) (param $p0 i32)
    (local $l1 i32) (local $l2 i32)
    i32.const 0
    local.set $l1
    loop $L0
      block $B1
        call $arduino.numPixels
        i32.eqz
        br_if $B1
        i32.const 0
        local.set $l2
        loop $L2
          local.get $l2
          i32.const 65535
          i32.and
          local.get $l1
          local.get $l2
          i32.add
          i32.const 255
          i32.and
          call $arduino.Wheel
          call $arduino.setPixelColor
          local.get $l2
          i32.const 1
          i32.add
          local.tee $l2
          i32.const 65535
          i32.and
          call $arduino.numPixels
          i32.lt_u
          br_if $L2
        end
      end
      call $arduino.show
      local.get $p0
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
    end)
  (func $f11 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    i32.const 0
    local.set $l2
    loop $L0
      i32.const 0
      local.set $l3
      loop $L1
        block $B2
          call $arduino.numPixels
          i32.eqz
          br_if $B2
          i32.const 0
          local.set $l4
          i32.const 0
          local.set $l5
          loop $L3
            local.get $l5
            local.get $l3
            i32.add
            i32.const 65535
            i32.and
            local.get $p0
            call $arduino.setPixelColor
            local.get $l4
            i32.const 3
            i32.add
            local.tee $l5
            i32.const 65535
            i32.and
            local.tee $l4
            call $arduino.numPixels
            i32.lt_u
            br_if $L3
          end
        end
        call $arduino.show
        local.get $p1
        call $arduino.delay
        block $B4
          call $arduino.numPixels
          i32.eqz
          br_if $B4
          i32.const 0
          local.set $l4
          i32.const 0
          local.set $l5
          loop $L5
            local.get $l5
            local.get $l3
            i32.add
            i32.const 65535
            i32.and
            i32.const 0
            call $arduino.setPixelColor
            local.get $l4
            i32.const 3
            i32.add
            local.tee $l5
            i32.const 65535
            i32.and
            local.tee $l4
            call $arduino.numPixels
            i32.lt_u
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
      local.get $l2
      i32.const 1
      i32.add
      local.tee $l2
      i32.const 10
      i32.ne
      br_if $L0
    end)
  (func $setup (type $t3)
    i32.const 1028
    i32.const 21
    call $arduino.print
    i32.const 1197
    i32.const 1
    call $arduino.print)
  (func $loop (type $t3)
    (local $l0 i32) (local $l1 i32)
    i32.const 0
    i32.const 0
    i32.load offset=1024
    local.tee $l0
    i32.const 1
    i32.add
    local.tee $l1
    i32.store offset=1024
    block $B0
      local.get $l0
      i32.const 7
      i32.gt_u
      br_if $B0
      block $B1
        block $B2
          block $B3
            block $B4
              block $B5
                block $B6
                  block $B7
                    block $B8
                      block $B9
                        local.get $l0
                        br_table $B9 $B8 $B7 $B6 $B5 $B4 $B3 $B2 $B9
                      end
                      i32.const 1163
                      i32.const 13
                      call $arduino.print
                      i32.const 1197
                      i32.const 1
                      call $arduino.print
                      i32.const 255
                      i32.const 0
                      i32.const 0
                      call $arduino.Color
                      i32.const 50
                      call $f9
                      br $B1
                    end
                    i32.const 1147
                    i32.const 15
                    call $arduino.print
                    i32.const 1197
                    i32.const 1
                    call $arduino.print
                    i32.const 0
                    i32.const 255
                    i32.const 0
                    call $arduino.Color
                    i32.const 50
                    call $f9
                    br $B1
                  end
                  i32.const 1132
                  i32.const 14
                  call $arduino.print
                  i32.const 1197
                  i32.const 1
                  call $arduino.print
                  i32.const 0
                  i32.const 0
                  i32.const 255
                  call $arduino.Color
                  i32.const 50
                  call $f9
                  br $B1
                end
                i32.const 1113
                i32.const 18
                call $arduino.print
                i32.const 1197
                i32.const 1
                call $arduino.print
                i32.const 127
                i32.const 127
                i32.const 127
                call $arduino.Color
                i32.const 50
                call $f11
                br $B1
              end
              i32.const 1096
              i32.const 16
              call $arduino.print
              i32.const 1197
              i32.const 1
              call $arduino.print
              i32.const 127
              i32.const 0
              i32.const 0
              call $arduino.Color
              i32.const 50
              call $f11
              br $B1
            end
            i32.const 1078
            i32.const 17
            call $arduino.print
            i32.const 1197
            i32.const 1
            call $arduino.print
            i32.const 0
            i32.const 0
            i32.const 127
            call $arduino.Color
            i32.const 50
            call $f11
            br $B1
          end
          i32.const 1070
          i32.const 7
          call $arduino.print
          i32.const 1197
          i32.const 1
          call $arduino.print
          i32.const 20
          call $f10
          br $B1
        end
        i32.const 1050
        i32.const 19
        call $arduino.print
        i32.const 1197
        i32.const 1
        call $arduino.print
        i32.const 50
        call $f8
      end
      i32.const 0
      i32.load offset=1024
      local.set $l1
    end
    block $B10
      local.get $l1
      i32.const 8
      i32.lt_s
      br_if $B10
      i32.const 0
      i32.const 0
      i32.store offset=1024
      i32.const 1177
      i32.const 19
      call $arduino.print
      i32.const 1197
      i32.const 1
      call $arduino.print
    end)
  (table $T0 1 1 funcref)
  (memory $memory 1)
  (global $g0 (mut i32) (i32.const 9392))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "setup" (func $setup))
  (export "loop" (func $loop))
  (data $d0 (i32.const 1024) "\00\00\00\00")
  (data $d1 (i32.const 1028) "\0astrandtest ... start\00theaterChaseRainbow\00rainbow\00theaterChase Blue\00theaterChase Red\00theaterChase White\00colorWipe Blue\00colorWipe Green\00colorWipe Red\00strandtest ... loop\00\0a\00"))
