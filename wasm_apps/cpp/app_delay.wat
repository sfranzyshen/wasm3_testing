(module
  (type $t0 (func))
  (type $t1 (func (param i32)))
  (type $t2 (func (param i32 i32)))
  (type $t3 (func (result i32)))
  (type $t4 (func (param i32) (result i32)))
  (type $t5 (func (param i32 i32 i32) (result i32)))
  (import "arduino" "numPixels" (func $arduino.numPixels (type $t3)))
  (import "arduino" "Wheel" (func $arduino.Wheel (type $t4)))
  (import "arduino" "setPixelColor" (func $arduino.setPixelColor (type $t2)))
  (import "arduino" "show" (func $arduino.show (type $t0)))
  (import "arduino" "delay" (func $arduino.delay (type $t1)))
  (import "arduino" "print" (func $arduino.print (type $t2)))
  (import "arduino" "Color" (func $arduino.Color (type $t5)))
  (func $_start (type $t0)
    nop)
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
    i32.const 1028
    i32.const 21
    call $arduino.print
    i32.const 1197
    i32.const 1
    call $arduino.print)
  (func $loop (type $t0)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32)
    i32.const 1024
    i32.const 1024
    i32.load
    local.tee $l0
    i32.const 1
    i32.add
    local.tee $l1
    i32.store
    local.get $l0
    i32.const 7
    i32.le_u
    if $I0 (result i32)
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
                        i32.const 1
                        i32.sub
                        br_table $B8 $B7 $B6 $B5 $B4 $B3 $B2 $B9
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
                      call $f8
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
                    call $f8
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
                  call $f8
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
                call $f9
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
              call $f9
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
            call $f9
            br $B1
          end
          i32.const 1070
          i32.const 7
          call $arduino.print
          i32.const 1197
          i32.const 1
          call $arduino.print
          i32.const 0
          local.set $l1
          loop $L10
            call $arduino.numPixels
            if $I11
              i32.const 0
              local.set $l0
              loop $L12
                local.get $l0
                i32.const 65535
                i32.and
                local.get $l0
                local.get $l1
                i32.add
                i32.const 255
                i32.and
                call $arduino.Wheel
                call $arduino.setPixelColor
                call $arduino.numPixels
                local.get $l0
                i32.const 1
                i32.add
                local.tee $l0
                i32.const 65535
                i32.and
                i32.gt_u
                br_if $L12
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
            br_if $L10
          end
          br $B1
        end
        i32.const 1050
        i32.const 19
        call $arduino.print
        i32.const 1197
        i32.const 1
        call $arduino.print
        loop $L13
          i32.const 0
          local.set $l2
          loop $L14
            call $arduino.numPixels
            if $I15
              i32.const 0
              local.set $l0
              i32.const 0
              local.set $l1
              loop $L16
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
                br_if $L16
              end
            end
            call $arduino.show
            i32.const 50
            call $arduino.delay
            call $arduino.numPixels
            if $I17
              i32.const 0
              local.set $l0
              i32.const 0
              local.set $l1
              loop $L18
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
                br_if $L18
              end
            end
            local.get $l2
            i32.const 1
            i32.add
            local.tee $l2
            i32.const 3
            i32.ne
            br_if $L14
          end
          local.get $l3
          i32.const 1
          i32.add
          local.tee $l3
          i32.const 256
          i32.ne
          br_if $L13
        end
      end
      i32.const 1024
      i32.load
    else
      local.get $l1
    end
    i32.const 8
    i32.ge_s
    if $I19
      i32.const 1024
      i32.const 0
      i32.store
      i32.const 1177
      i32.const 19
      call $arduino.print
      i32.const 1197
      i32.const 1
      call $arduino.print
    end)
  (memory $memory 1)
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "setup" (func $setup))
  (export "loop" (func $loop))
  (data $d0 (i32.const 1028) "\0astrandtest ... start\00theaterChaseRainbow\00rainbow\00theaterChase Blue\00theaterChase Red\00theaterChase White\00colorWipe Blue\00colorWipe Green\00colorWipe Red\00strandtest ... loop\00\0a"))
