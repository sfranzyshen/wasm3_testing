(module
  (type $t0 (func))
  (type $t1 (func (param i32 i32)))
  (type $t2 (func (param i32 i32 i32)))
  (type $t3 (func (result i32)))
  (type $t4 (func (param i32) (result i32)))
  (type $t5 (func (param i32 i32 i32) (result i32)))
  (import "arduino" "Color" (func $arduino.Color (type $t5)))
  (import "arduino" "setPixelColor" (func $arduino.setPixelColor (type $t1)))
  (import "arduino" "show" (func $arduino.show (type $t0)))
  (import "arduino" "clear" (func $arduino.clear (type $t0)))
  (import "arduino" "Wheel" (func $arduino.Wheel (type $t4)))
  (import "arduino" "print" (func $arduino.print (type $t1)))
  (import "arduino" "millis" (func $arduino.millis (type $t3)))
  (func $_start (type $t0)
    nop)
  (func $f8 (type $t2) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    i32.const 1052
    i32.load8_u
    i32.const 50
    i32.ne
    if $I0
      i32.const 1052
      i32.const 50
      i32.store8
    end
    i32.const 1044
    i32.load16_u
    local.get $p0
    local.get $p1
    local.get $p2
    call $arduino.Color
    call $arduino.setPixelColor
    call $arduino.show
    i32.const 1044
    i32.const 1044
    i32.load16_u
    i32.const 1
    i32.add
    local.tee $p0
    i32.store16
    i32.const 1046
    i32.load16_u
    local.get $p0
    i32.const 65535
    i32.and
    i32.le_u
    if $I1
      i32.const 1044
      i32.const 0
      i32.store16
      call $arduino.clear
    end)
  (func $f9 (type $t2) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32)
    i32.const 1052
    i32.load8_u
    i32.const 50
    i32.ne
    if $I0
      i32.const 1052
      i32.const 50
      i32.store8
    end
    i32.const 1046
    i32.load16_u
    if $I1
      loop $L2
        local.get $l3
        i32.const 1036
        i32.load
        i32.add
        i32.const 65535
        i32.and
        local.get $p0
        local.get $p1
        local.get $p2
        call $arduino.Color
        call $arduino.setPixelColor
        local.get $l3
        i32.const 3
        i32.add
        local.tee $l3
        i32.const 1046
        i32.load16_u
        i32.lt_u
        br_if $L2
      end
    end
    call $arduino.show
    i32.const 1036
    i32.load
    local.set $p0
    i32.const 1046
    i32.load16_u
    if $I3
      i32.const 0
      local.set $l3
      loop $L4
        local.get $p0
        local.get $l3
        i32.add
        i32.const 65535
        i32.and
        i32.const 0
        i32.const 0
        i32.const 0
        call $arduino.Color
        call $arduino.setPixelColor
        i32.const 1036
        i32.load
        local.set $p0
        local.get $l3
        i32.const 3
        i32.add
        local.tee $l3
        i32.const 1046
        i32.load16_u
        i32.lt_u
        br_if $L4
      end
    end
    i32.const 1036
    i32.const 0
    local.get $p0
    i32.const 1
    i32.add
    local.get $p0
    i32.const 1
    i32.gt_s
    select
    i32.store)
  (func $setup (type $t0)
    i32.const 1053
    i32.const 29
    call $arduino.print
    i32.const 1251
    i32.const 1
    call $arduino.print)
  (func $loop (type $t0)
    (local $l0 i32) (local $l1 i32) (local $l2 i32)
    block $B0
      call $arduino.millis
      local.tee $l0
      i32.const 1024
      i32.load
      i32.sub
      i32.const 1048
      i32.load
      i32.lt_u
      br_if $B0
      i32.const 1024
      local.get $l0
      i32.store
      i32.const 1028
      i32.const 1028
      i32.load
      local.tee $l1
      i32.const 1
      i32.add
      local.tee $l2
      i32.store
      local.get $l1
      i32.const 8
      i32.le_u
      if $I1 (result i32)
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
                            i32.const 1
                            i32.sub
                            br_table $B10 $B9 $B8 $B7 $B6 $B5 $B4 $B3 $B11
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
        i32.const 1028
        i32.load
      else
        local.get $l2
      end
      i32.const 9
      i32.lt_s
      br_if $B0
      i32.const 1028
      i32.const 0
      i32.store
      i32.const 1223
      i32.const 27
      call $arduino.print
      i32.const 1251
      i32.const 1
      call $arduino.print
    end
    block $B12
      i32.const 1052
      i32.load8_u
      local.get $l0
      i32.const 1032
      i32.load
      i32.sub
      i32.gt_u
      br_if $B12
      i32.const 1032
      local.get $l0
      i32.store
      i32.const 1028
      i32.load
      i32.const 1
      i32.sub
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
                        i32.const 1
                        i32.sub
                        br_table $B14 $B15 $B16 $B17 $B18 $B19 $B20 $B21 $B13
                      end
                      i32.const 0
                      local.set $l0
                      i32.const 1052
                      i32.load8_u
                      i32.const 50
                      i32.ne
                      if $I22
                        i32.const 1052
                        i32.const 50
                        i32.store8
                      end
                      i32.const 1046
                      i32.load16_u
                      if $I23
                        loop $L24
                          local.get $l0
                          i32.const 1036
                          i32.load
                          i32.add
                          i32.const 65535
                          i32.and
                          local.get $l0
                          i32.const 1040
                          i32.load
                          i32.add
                          i32.const 255
                          i32.rem_s
                          i32.const 255
                          i32.and
                          call $arduino.Wheel
                          call $arduino.setPixelColor
                          local.get $l0
                          i32.const 3
                          i32.add
                          local.tee $l0
                          i32.const 1046
                          i32.load16_u
                          i32.lt_u
                          br_if $L24
                        end
                      end
                      call $arduino.show
                      i32.const 1036
                      i32.load
                      local.set $l1
                      i32.const 1046
                      i32.load16_u
                      if $I25
                        i32.const 0
                        local.set $l0
                        loop $L26
                          local.get $l0
                          local.get $l1
                          i32.add
                          i32.const 65535
                          i32.and
                          i32.const 0
                          i32.const 0
                          i32.const 0
                          call $arduino.Color
                          call $arduino.setPixelColor
                          i32.const 1036
                          i32.load
                          local.set $l1
                          local.get $l0
                          i32.const 3
                          i32.add
                          local.tee $l0
                          i32.const 1046
                          i32.load16_u
                          i32.lt_u
                          br_if $L26
                        end
                      end
                      i32.const 1036
                      local.get $l1
                      i32.const 1
                      i32.add
                      i32.store
                      i32.const 1040
                      i32.const 1040
                      i32.load
                      local.tee $l0
                      i32.const 1
                      i32.add
                      i32.store
                      local.get $l1
                      i32.const 2
                      i32.ge_s
                      if $I27
                        i32.const 1036
                        i32.const 0
                        i32.store
                      end
                      local.get $l0
                      i32.const 255
                      i32.ge_s
                      if $I28
                        i32.const 1040
                        i32.const 0
                        i32.store
                      end
                      return
                    end
                    i32.const 0
                    local.set $l0
                    i32.const 0
                    local.set $l1
                    i32.const 1052
                    i32.load8_u
                    i32.const 20
                    i32.ne
                    if $I29
                      i32.const 1052
                      i32.const 20
                      i32.store8
                    end
                    i32.const 1046
                    i32.load16_u
                    local.tee $l2
                    if $I30
                      loop $L31
                        local.get $l1
                        i32.const 65535
                        i32.and
                        i32.const 1040
                        i32.load
                        local.get $l0
                        local.get $l2
                        i32.div_u
                        i32.add
                        i32.const 255
                        i32.and
                        call $arduino.Wheel
                        call $arduino.setPixelColor
                        local.get $l0
                        i32.const 256
                        i32.add
                        local.set $l0
                        local.get $l1
                        i32.const 1
                        i32.add
                        local.tee $l1
                        i32.const 1046
                        i32.load16_u
                        local.tee $l2
                        i32.lt_u
                        br_if $L31
                      end
                    end
                    call $arduino.show
                    i32.const 1040
                    i32.const 0
                    i32.const 1040
                    i32.load
                    local.tee $l0
                    i32.const 1
                    i32.add
                    local.get $l0
                    i32.const 1274
                    i32.gt_s
                    select
                    i32.store
                    return
                  end
                  i32.const 0
                  local.set $l0
                  i32.const 1052
                  i32.load8_u
                  i32.const 20
                  i32.ne
                  if $I32
                    i32.const 1052
                    i32.const 20
                    i32.store8
                  end
                  i32.const 1046
                  i32.load16_u
                  if $I33
                    loop $L34
                      local.get $l0
                      i32.const 65535
                      i32.and
                      local.get $l0
                      i32.const 1040
                      i32.load
                      i32.add
                      i32.const 255
                      i32.and
                      call $arduino.Wheel
                      call $arduino.setPixelColor
                      local.get $l0
                      i32.const 1
                      i32.add
                      local.tee $l0
                      i32.const 1046
                      i32.load16_u
                      i32.lt_u
                      br_if $L34
                    end
                  end
                  call $arduino.show
                  i32.const 1040
                  i32.const 0
                  i32.const 1040
                  i32.load
                  local.tee $l0
                  i32.const 1
                  i32.add
                  local.get $l0
                  i32.const 254
                  i32.gt_s
                  select
                  i32.store
                  return
                end
                i32.const 0
                i32.const 0
                i32.const 127
                call $f9
                return
              end
              i32.const 127
              i32.const 0
              i32.const 0
              call $f9
              return
            end
            i32.const 127
            i32.const 127
            i32.const 127
            call $f9
            return
          end
          i32.const 0
          i32.const 0
          i32.const 255
          call $f8
          return
        end
        i32.const 0
        i32.const 255
        i32.const 0
        call $f8
        return
      end
      i32.const 255
      i32.const 0
      i32.const 0
      call $f8
    end)
  (memory $memory 1)
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "setup" (func $setup))
  (export "loop" (func $loop))
  (data $d0 (i32.const 1048) "|\15\00\002")
  (data $d1 (i32.const 1053) "\0astrandtest_nodelay ... start\00theaterChaseRainbow\00rainbowCycle\00rainbow\00theaterChase Blue\00theaterChase Red\00theaterChase White\00colorWipe Blue\00colorWipe Green\00colorWipe Red\00strandtest_nodelay ... loop\00\0a"))
