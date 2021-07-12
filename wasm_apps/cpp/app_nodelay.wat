(module
  (type $t0 (func (param i32 i32 i32) (result i32)))
  (type $t1 (func (param i32 i32)))
  (type $t2 (func))
  (type $t3 (func (param i32) (result i32)))
  (type $t4 (func (result i32)))
  (type $t5 (func (param i32 i32 i32 i32)))
  (type $t6 (func (param i32)))
  (import "arduino" "Color" (func $arduino.Color (type $t0)))
  (import "arduino" "setPixelColor" (func $arduino.setPixelColor (type $t1)))
  (import "arduino" "show" (func $arduino.show (type $t2)))
  (import "arduino" "clear" (func $arduino.clear (type $t2)))
  (import "arduino" "Wheel" (func $arduino.Wheel (type $t3)))
  (import "arduino" "print" (func $arduino.print (type $t1)))
  (import "arduino" "millis" (func $arduino.millis (type $t4)))
  (func $_start (type $t2))
  (func $f8 (type $t5) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    block $B0
      i32.const 0
      i32.load8_u offset=1052
      local.get $p3
      i32.eq
      br_if $B0
      i32.const 0
      local.get $p3
      i32.store8 offset=1052
    end
    i32.const 0
    i32.load16_u offset=1044
    local.get $p0
    local.get $p1
    local.get $p2
    call $arduino.Color
    call $arduino.setPixelColor
    call $arduino.show
    i32.const 0
    i32.const 0
    i32.load16_u offset=1044
    i32.const 1
    i32.add
    local.tee $p3
    i32.store16 offset=1044
    block $B1
      local.get $p3
      i32.const 65535
      i32.and
      i32.const 0
      i32.load16_u offset=1046
      i32.lt_u
      br_if $B1
      i32.const 0
      i32.const 0
      i32.store16 offset=1044
      call $arduino.clear
    end)
  (func $f9 (type $t6) (param $p0 i32)
    block $B0
      i32.const 0
      i32.load8_u offset=1052
      local.get $p0
      i32.eq
      br_if $B0
      i32.const 0
      local.get $p0
      i32.store8 offset=1052
    end
    block $B1
      i32.const 0
      i32.load16_u offset=1046
      i32.eqz
      br_if $B1
      i32.const 0
      local.set $p0
      loop $L2
        local.get $p0
        i32.const 65535
        i32.and
        local.get $p0
        i32.const 0
        i32.load offset=1040
        i32.add
        i32.const 255
        i32.and
        call $arduino.Wheel
        call $arduino.setPixelColor
        local.get $p0
        i32.const 1
        i32.add
        local.tee $p0
        i32.const 0
        i32.load16_u offset=1046
        i32.lt_u
        br_if $L2
      end
    end
    call $arduino.show
    i32.const 0
    i32.const 0
    i32.const 0
    i32.load offset=1040
    local.tee $p0
    i32.const 1
    i32.add
    local.get $p0
    i32.const 254
    i32.gt_s
    select
    i32.store offset=1040)
  (func $f10 (type $t6) (param $p0 i32)
    (local $l1 i32) (local $l2 i32)
    block $B0
      i32.const 0
      i32.load8_u offset=1052
      local.get $p0
      i32.eq
      br_if $B0
      i32.const 0
      local.get $p0
      i32.store8 offset=1052
    end
    block $B1
      i32.const 0
      i32.load16_u offset=1046
      local.tee $l1
      i32.eqz
      br_if $B1
      i32.const 0
      local.set $p0
      i32.const 0
      local.set $l2
      loop $L2
        local.get $l2
        i32.const 65535
        i32.and
        i32.const 0
        i32.load offset=1040
        local.get $p0
        local.get $l1
        i32.const 65535
        i32.and
        i32.div_u
        i32.add
        i32.const 255
        i32.and
        call $arduino.Wheel
        call $arduino.setPixelColor
        local.get $p0
        i32.const 256
        i32.add
        local.set $p0
        local.get $l2
        i32.const 1
        i32.add
        local.tee $l2
        i32.const 0
        i32.load16_u offset=1046
        local.tee $l1
        i32.lt_u
        br_if $L2
      end
    end
    call $arduino.show
    i32.const 0
    i32.const 0
    i32.const 0
    i32.load offset=1040
    local.tee $p0
    i32.const 1
    i32.add
    local.get $p0
    i32.const 1274
    i32.gt_s
    select
    i32.store offset=1040)
  (func $f11 (type $t5) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    block $B0
      i32.const 0
      i32.load8_u offset=1052
      local.get $p3
      i32.eq
      br_if $B0
      i32.const 0
      local.get $p3
      i32.store8 offset=1052
    end
    block $B1
      i32.const 0
      i32.load16_u offset=1046
      i32.eqz
      br_if $B1
      i32.const 0
      local.set $p3
      loop $L2
        local.get $p3
        i32.const 0
        i32.load offset=1036
        i32.add
        i32.const 65535
        i32.and
        local.get $p0
        local.get $p1
        local.get $p2
        call $arduino.Color
        call $arduino.setPixelColor
        local.get $p3
        i32.const 3
        i32.add
        local.tee $p3
        i32.const 0
        i32.load16_u offset=1046
        i32.lt_u
        br_if $L2
      end
    end
    call $arduino.show
    i32.const 0
    i32.load offset=1036
    local.set $p0
    block $B3
      i32.const 0
      i32.load16_u offset=1046
      i32.eqz
      br_if $B3
      i32.const 0
      local.set $p3
      loop $L4
        local.get $p0
        local.get $p3
        i32.add
        i32.const 65535
        i32.and
        i32.const 0
        i32.const 0
        i32.const 0
        call $arduino.Color
        call $arduino.setPixelColor
        i32.const 0
        i32.load offset=1036
        local.set $p0
        local.get $p3
        i32.const 3
        i32.add
        local.tee $p3
        i32.const 0
        i32.load16_u offset=1046
        i32.lt_u
        br_if $L4
      end
    end
    i32.const 0
    i32.const 0
    local.get $p0
    i32.const 1
    i32.add
    local.get $p0
    i32.const 1
    i32.gt_s
    select
    i32.store offset=1036)
  (func $f12 (type $t6) (param $p0 i32)
    (local $l1 i32)
    block $B0
      i32.const 0
      i32.load8_u offset=1052
      local.get $p0
      i32.eq
      br_if $B0
      i32.const 0
      local.get $p0
      i32.store8 offset=1052
    end
    block $B1
      i32.const 0
      i32.load16_u offset=1046
      i32.eqz
      br_if $B1
      i32.const 0
      local.set $p0
      loop $L2
        local.get $p0
        i32.const 0
        i32.load offset=1036
        i32.add
        i32.const 65535
        i32.and
        local.get $p0
        i32.const 0
        i32.load offset=1040
        i32.add
        i32.const 255
        i32.rem_s
        i32.const 255
        i32.and
        call $arduino.Wheel
        call $arduino.setPixelColor
        local.get $p0
        i32.const 3
        i32.add
        local.tee $p0
        i32.const 0
        i32.load16_u offset=1046
        i32.lt_u
        br_if $L2
      end
    end
    call $arduino.show
    i32.const 0
    i32.load offset=1036
    local.set $l1
    block $B3
      i32.const 0
      i32.load16_u offset=1046
      i32.eqz
      br_if $B3
      i32.const 0
      local.set $p0
      loop $L4
        local.get $l1
        local.get $p0
        i32.add
        i32.const 65535
        i32.and
        i32.const 0
        i32.const 0
        i32.const 0
        call $arduino.Color
        call $arduino.setPixelColor
        i32.const 0
        i32.load offset=1036
        local.set $l1
        local.get $p0
        i32.const 3
        i32.add
        local.tee $p0
        i32.const 0
        i32.load16_u offset=1046
        i32.lt_u
        br_if $L4
      end
    end
    i32.const 0
    local.get $l1
    i32.const 1
    i32.add
    i32.store offset=1036
    i32.const 0
    i32.const 0
    i32.load offset=1040
    local.tee $p0
    i32.const 1
    i32.add
    i32.store offset=1040
    block $B5
      local.get $l1
      i32.const 2
      i32.lt_s
      br_if $B5
      i32.const 0
      i32.const 0
      i32.store offset=1036
    end
    block $B6
      local.get $p0
      i32.const 255
      i32.lt_s
      br_if $B6
      i32.const 0
      i32.const 0
      i32.store offset=1040
    end)
  (func $setup (type $t2)
    i32.const 1053
    i32.const 29
    call $arduino.print
    i32.const 1251
    i32.const 1
    call $arduino.print)
  (func $loop (type $t2)
    (local $l0 i32) (local $l1 i32) (local $l2 i32)
    block $B0
      call $arduino.millis
      local.tee $l0
      i32.const 0
      i32.load offset=1024
      i32.sub
      i32.const 0
      i32.load offset=1048
      i32.lt_u
      br_if $B0
      i32.const 0
      local.get $l0
      i32.store offset=1024
      i32.const 0
      i32.const 0
      i32.load offset=1028
      local.tee $l1
      i32.const 1
      i32.add
      local.tee $l2
      i32.store offset=1028
      block $B1
        local.get $l1
        i32.const 8
        i32.gt_u
        br_if $B1
        block $B2
          block $B3
            block $B4
              block $B5
                block $B6
                  block $B7
                    block $B8
                      block $B9
                        block $B10
                          block $B11
                            local.get $l1
                            br_table $B11 $B10 $B9 $B8 $B7 $B6 $B5 $B4 $B3 $B11
                          end
                          i32.const 1209
                          i32.const 13
                          call $arduino.print
                          br $B2
                        end
                        i32.const 1193
                        i32.const 15
                        call $arduino.print
                        br $B2
                      end
                      i32.const 1178
                      i32.const 14
                      call $arduino.print
                      br $B2
                    end
                    i32.const 1159
                    i32.const 18
                    call $arduino.print
                    br $B2
                  end
                  i32.const 1142
                  i32.const 16
                  call $arduino.print
                  br $B2
                end
                i32.const 1124
                i32.const 17
                call $arduino.print
                br $B2
              end
              i32.const 1116
              i32.const 7
              call $arduino.print
              br $B2
            end
            i32.const 1103
            i32.const 12
            call $arduino.print
            br $B2
          end
          i32.const 1083
          i32.const 19
          call $arduino.print
        end
        i32.const 1251
        i32.const 1
        call $arduino.print
        i32.const 0
        i32.load offset=1028
        local.set $l2
      end
      local.get $l2
      i32.const 9
      i32.lt_s
      br_if $B0
      i32.const 0
      i32.const 0
      i32.store offset=1028
      i32.const 1223
      i32.const 27
      call $arduino.print
      i32.const 1251
      i32.const 1
      call $arduino.print
    end
    block $B12
      local.get $l0
      i32.const 0
      i32.load offset=1032
      i32.sub
      i32.const 0
      i32.load8_u offset=1052
      i32.lt_u
      br_if $B12
      i32.const 0
      local.get $l0
      i32.store offset=1032
      i32.const 0
      i32.load offset=1028
      i32.const -1
      i32.add
      local.tee $l0
      i32.const 8
      i32.gt_u
      br_if $B12
      block $B13
        block $B14
          block $B15
            block $B16
              block $B17
                block $B18
                  block $B19
                    block $B20
                      block $B21
                        local.get $l0
                        br_table $B13 $B14 $B15 $B16 $B17 $B18 $B19 $B20 $B21 $B13
                      end
                      i32.const 50
                      call $f12
                      return
                    end
                    i32.const 20
                    call $f10
                    return
                  end
                  i32.const 20
                  call $f9
                  return
                end
                i32.const 0
                i32.const 0
                i32.const 127
                i32.const 50
                call $f11
                return
              end
              i32.const 127
              i32.const 0
              i32.const 0
              i32.const 50
              call $f11
              return
            end
            i32.const 127
            i32.const 127
            i32.const 127
            i32.const 50
            call $f11
            return
          end
          i32.const 0
          i32.const 0
          i32.const 255
          i32.const 50
          call $f8
          return
        end
        i32.const 0
        i32.const 255
        i32.const 0
        i32.const 50
        call $f8
        return
      end
      i32.const 255
      i32.const 0
      i32.const 0
      i32.const 50
      call $f8
    end)
  (table $T0 1 1 funcref)
  (memory $memory 1)
  (global $g0 (mut i32) (i32.const 9456))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "setup" (func $setup))
  (export "loop" (func $loop))
  (data $d0 (i32.const 1024) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  (data $d1 (i32.const 1048) "|\15\00\002")
  (data $d2 (i32.const 1053) "\0astrandtest_nodelay ... start\00theaterChaseRainbow\00rainbowCycle\00rainbow\00theaterChase Blue\00theaterChase Red\00theaterChase White\00colorWipe Blue\00colorWipe Green\00colorWipe Red\00strandtest_nodelay ... loop\00\0a\00"))
