; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -debugify-and-strip-all-safe -enable-machine-outliner=never -verify-machineinstrs %s -o - -mtriple=aarch64-linux-gnu -aarch64-enable-atomic-cfg-tidy=0 | FileCheck %s
; RUN: llc -debugify-and-strip-all-safe -global-isel -enable-machine-outliner=never -verify-machineinstrs %s -o - -mtriple=aarch64-linux-gnu -aarch64-enable-atomic-cfg-tidy=0 | FileCheck %s

define i32 @add_z_i8i32(i8 %v, i32 %lhs) minsize {
; CHECK-LABEL: add_z_i8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add w0, w1, w0, uxtb
; CHECK-NEXT:    ret
  %vz = zext i8 %v to i32
  %r = add i32 %lhs, %vz
  ret i32 %r
}

define i32 @add_z_shli8i32(i8 %v, i32 %lhs) minsize {
; CHECK-LABEL: add_z_shli8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add w0, w1, w0, uxtb #3
; CHECK-NEXT:    ret
  %vz = zext i8 %v to i32
  %s = shl i32 %vz, 3
  %r = add i32 %lhs, %s
  ret i32 %r
}

define i64 @add_z_i8i64(i8 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_z_i8i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    add x0, x1, w0, uxtb
; CHECK-NEXT:    ret
  %vz = zext i8 %v to i64
  %r = add i64 %lhs, %vz
  ret i64 %r
}

define i64 @add_z_shli8i64(i8 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_z_shli8i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    add x0, x1, w0, uxtb #3
; CHECK-NEXT:    ret
  %vz = zext i8 %v to i64
  %s = shl i64 %vz, 3
  %r = add i64 %lhs, %s
  ret i64 %r
}

define i32 @add_s_i8i32(i8 %v, i32 %lhs) minsize {
; CHECK-LABEL: add_s_i8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add w0, w1, w0, sxtb
; CHECK-NEXT:    ret
  %vz = sext i8 %v to i32
  %r = add i32 %lhs, %vz
  ret i32 %r
}

define i32 @add_s_shli8i32(i8 %v, i32 %lhs) minsize {
; CHECK-LABEL: add_s_shli8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add w0, w1, w0, sxtb #3
; CHECK-NEXT:    ret
  %vz = sext i8 %v to i32
  %s = shl i32 %vz, 3
  %r = add i32 %lhs, %s
  ret i32 %r
}

define i64 @add_s_i8i64(i8 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_s_i8i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    add x0, x1, w0, sxtb
; CHECK-NEXT:    ret
  %vz = sext i8 %v to i64
  %r = add i64 %lhs, %vz
  ret i64 %r
}

define i64 @add_s_shli8i64(i8 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_s_shli8i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    add x0, x1, w0, sxtb #3
; CHECK-NEXT:    ret
  %vz = sext i8 %v to i64
  %s = shl i64 %vz, 3
  %r = add i64 %lhs, %s
  ret i64 %r
}

define i32 @add_z_i16i32(i16 %v, i32 %lhs) minsize {
; CHECK-LABEL: add_z_i16i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add w0, w1, w0, uxth
; CHECK-NEXT:    ret
  %vz = zext i16 %v to i32
  %r = add i32 %lhs, %vz
  ret i32 %r
}

define i32 @add_z_shli16i32(i16 %v, i32 %lhs) minsize {
; CHECK-LABEL: add_z_shli16i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add w0, w1, w0, uxth #3
; CHECK-NEXT:    ret
  %vz = zext i16 %v to i32
  %s = shl i32 %vz, 3
  %r = add i32 %lhs, %s
  ret i32 %r
}

define i64 @add_z_i16i64(i16 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_z_i16i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    add x0, x1, w0, uxth
; CHECK-NEXT:    ret
  %vz = zext i16 %v to i64
  %r = add i64 %lhs, %vz
  ret i64 %r
}

define i64 @add_z_shli16i64(i16 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_z_shli16i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    add x0, x1, w0, uxth #3
; CHECK-NEXT:    ret
  %vz = zext i16 %v to i64
  %s = shl i64 %vz, 3
  %r = add i64 %lhs, %s
  ret i64 %r
}

define i64 @add_z_i32i64(i32 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_z_i32i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add x0, x1, w0, uxtw
; CHECK-NEXT:    ret
  %vz = zext i32 %v to i64
  %r = add i64 %lhs, %vz
  ret i64 %r
}

define i64 @add_z_shli32i64(i32 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_z_shli32i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add x0, x1, w0, uxtw #3
; CHECK-NEXT:    ret
  %vz = zext i32 %v to i64
  %s = shl i64 %vz, 3
  %r = add i64 %lhs, %s
  ret i64 %r
}

define i32 @add_s_i16i32(i16 %v, i32 %lhs) minsize {
; CHECK-LABEL: add_s_i16i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add w0, w1, w0, sxth
; CHECK-NEXT:    ret
  %vz = sext i16 %v to i32
  %r = add i32 %lhs, %vz
  ret i32 %r
}

define i32 @add_s_shli16i32(i16 %v, i32 %lhs) minsize {
; CHECK-LABEL: add_s_shli16i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add w0, w1, w0, sxth #3
; CHECK-NEXT:    ret
  %vz = sext i16 %v to i32
  %s = shl i32 %vz, 3
  %r = add i32 %lhs, %s
  ret i32 %r
}

define i64 @add_s_i16i64(i16 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_s_i16i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    add x0, x1, w0, sxth
; CHECK-NEXT:    ret
  %vz = sext i16 %v to i64
  %r = add i64 %lhs, %vz
  ret i64 %r
}

define i64 @add_s_shli16i64(i16 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_s_shli16i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    add x0, x1, w0, sxth #3
; CHECK-NEXT:    ret
  %vz = sext i16 %v to i64
  %s = shl i64 %vz, 3
  %r = add i64 %lhs, %s
  ret i64 %r
}

define i64 @add_s_i32i64(i32 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_s_i32i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add x0, x1, w0, sxtw
; CHECK-NEXT:    ret
  %vz = sext i32 %v to i64
  %r = add i64 %lhs, %vz
  ret i64 %r
}

define i64 @add_s_shli32i64(i32 %v, i64 %lhs) minsize {
; CHECK-LABEL: add_s_shli32i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add x0, x1, w0, sxtw #3
; CHECK-NEXT:    ret
  %vz = sext i32 %v to i64
  %s = shl i64 %vz, 3
  %r = add i64 %lhs, %s
  ret i64 %r
}

define i32 @sub_z_i8i32(i8 %v, i32 %lhs) minsize {
; CHECK-LABEL: sub_z_i8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub w0, w1, w0, uxtb
; CHECK-NEXT:    ret
  %vz = zext i8 %v to i32
  %r = sub i32 %lhs, %vz
  ret i32 %r
}

define i32 @sub_z_shli8i32(i8 %v, i32 %lhs) minsize {
; CHECK-LABEL: sub_z_shli8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub w0, w1, w0, uxtb #3
; CHECK-NEXT:    ret
  %vz = zext i8 %v to i32
  %s = shl i32 %vz, 3
  %r = sub i32 %lhs, %s
  ret i32 %r
}

define i64 @sub_z_i8i64(i8 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_z_i8i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sub x0, x1, w0, uxtb
; CHECK-NEXT:    ret
  %vz = zext i8 %v to i64
  %r = sub i64 %lhs, %vz
  ret i64 %r
}

define i64 @sub_z_shli8i64(i8 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_z_shli8i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sub x0, x1, w0, uxtb #3
; CHECK-NEXT:    ret
  %vz = zext i8 %v to i64
  %s = shl i64 %vz, 3
  %r = sub i64 %lhs, %s
  ret i64 %r
}

define i32 @sub_s_i8i32(i8 %v, i32 %lhs) minsize {
; CHECK-LABEL: sub_s_i8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub w0, w1, w0, sxtb
; CHECK-NEXT:    ret
  %vz = sext i8 %v to i32
  %r = sub i32 %lhs, %vz
  ret i32 %r
}

define i32 @sub_s_shli8i32(i8 %v, i32 %lhs) minsize {
; CHECK-LABEL: sub_s_shli8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub w0, w1, w0, sxtb #3
; CHECK-NEXT:    ret
  %vz = sext i8 %v to i32
  %s = shl i32 %vz, 3
  %r = sub i32 %lhs, %s
  ret i32 %r
}

define i64 @sub_s_i8i64(i8 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_s_i8i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sub x0, x1, w0, sxtb
; CHECK-NEXT:    ret
  %vz = sext i8 %v to i64
  %r = sub i64 %lhs, %vz
  ret i64 %r
}

define i64 @sub_s_shli8i64(i8 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_s_shli8i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sub x0, x1, w0, sxtb #3
; CHECK-NEXT:    ret
  %vz = sext i8 %v to i64
  %s = shl i64 %vz, 3
  %r = sub i64 %lhs, %s
  ret i64 %r
}

define i32 @sub_z_i16i32(i16 %v, i32 %lhs) minsize {
; CHECK-LABEL: sub_z_i16i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub w0, w1, w0, uxth
; CHECK-NEXT:    ret
  %vz = zext i16 %v to i32
  %r = sub i32 %lhs, %vz
  ret i32 %r
}

define i32 @sub_z_shli16i32(i16 %v, i32 %lhs) minsize {
; CHECK-LABEL: sub_z_shli16i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub w0, w1, w0, uxth #3
; CHECK-NEXT:    ret
  %vz = zext i16 %v to i32
  %s = shl i32 %vz, 3
  %r = sub i32 %lhs, %s
  ret i32 %r
}

define i64 @sub_z_i16i64(i16 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_z_i16i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sub x0, x1, w0, uxth
; CHECK-NEXT:    ret
  %vz = zext i16 %v to i64
  %r = sub i64 %lhs, %vz
  ret i64 %r
}

define i64 @sub_z_shli16i64(i16 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_z_shli16i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sub x0, x1, w0, uxth #3
; CHECK-NEXT:    ret
  %vz = zext i16 %v to i64
  %s = shl i64 %vz, 3
  %r = sub i64 %lhs, %s
  ret i64 %r
}

define i64 @sub_z_i32i64(i32 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_z_i32i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub x0, x1, w0, uxtw
; CHECK-NEXT:    ret
  %vz = zext i32 %v to i64
  %r = sub i64 %lhs, %vz
  ret i64 %r
}

define i64 @sub_z_shli32i64(i32 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_z_shli32i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub x0, x1, w0, uxtw #3
; CHECK-NEXT:    ret
  %vz = zext i32 %v to i64
  %s = shl i64 %vz, 3
  %r = sub i64 %lhs, %s
  ret i64 %r
}

define i32 @sub_s_i16i32(i16 %v, i32 %lhs) minsize {
; CHECK-LABEL: sub_s_i16i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub w0, w1, w0, sxth
; CHECK-NEXT:    ret
  %vz = sext i16 %v to i32
  %r = sub i32 %lhs, %vz
  ret i32 %r
}

define i32 @sub_s_shli16i32(i16 %v, i32 %lhs) minsize {
; CHECK-LABEL: sub_s_shli16i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub w0, w1, w0, sxth #3
; CHECK-NEXT:    ret
  %vz = sext i16 %v to i32
  %s = shl i32 %vz, 3
  %r = sub i32 %lhs, %s
  ret i32 %r
}

define i64 @sub_s_i16i64(i16 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_s_i16i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sub x0, x1, w0, sxth
; CHECK-NEXT:    ret
  %vz = sext i16 %v to i64
  %r = sub i64 %lhs, %vz
  ret i64 %r
}

define i64 @sub_s_shli16i64(i16 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_s_shli16i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sub x0, x1, w0, sxth #3
; CHECK-NEXT:    ret
  %vz = sext i16 %v to i64
  %s = shl i64 %vz, 3
  %r = sub i64 %lhs, %s
  ret i64 %r
}

define i64 @sub_s_i32i64(i32 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_s_i32i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub x0, x1, w0, sxtw
; CHECK-NEXT:    ret
  %vz = sext i32 %v to i64
  %r = sub i64 %lhs, %vz
  ret i64 %r
}

define i64 @sub_s_shli32i64(i32 %v, i64 %lhs) minsize {
; CHECK-LABEL: sub_s_shli32i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub x0, x1, w0, sxtw #3
; CHECK-NEXT:    ret
  %vz = sext i32 %v to i64
  %s = shl i64 %vz, 3
  %r = sub i64 %lhs, %s
  ret i64 %r
}

define i32 @cmp_s_i8i32(i8 %v, i32 %lhs) minsize {
; CHECK-LABEL: cmp_s_i8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp w1, w0, uxtb
; CHECK-NEXT:    b.ge .LBB40_2
; CHECK-NEXT:  // %bb.1: // %then
; CHECK-NEXT:    mov w0, #1
; CHECK-NEXT:    ret
; CHECK-NEXT:  .LBB40_2: // %end
; CHECK-NEXT:    mov w0, w1
; CHECK-NEXT:    ret
  %vz = zext i8 %v to i32
  %c = icmp slt i32 %lhs, %vz
  br i1 %c, label %then, label %end
then:
  ret i32 1
end:
  ret i32 %lhs
}

define i64 @cmp_s_i8i64(i8 %v, i64 %lhs) minsize {
; CHECK-LABEL: cmp_s_i8i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    cmp x1, w0, sxtb
; CHECK-NEXT:    b.ge .LBB41_2
; CHECK-NEXT:  // %bb.1: // %then
; CHECK-NEXT:    mov w0, #1
; CHECK-NEXT:    ret
; CHECK-NEXT:  .LBB41_2: // %end
; CHECK-NEXT:    mov x0, x1
; CHECK-NEXT:    ret
  %vz = sext i8 %v to i64
  %c = icmp slt i64 %lhs, %vz
  br i1 %c, label %then, label %end
then:
  ret i64 1
end:
  ret i64 %lhs
}

define i32 @cmp_s_i16i32(i16 %v, i32 %lhs) minsize {
; CHECK-LABEL: cmp_s_i16i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp w1, w0, uxth
; CHECK-NEXT:    b.ge .LBB42_2
; CHECK-NEXT:  // %bb.1: // %then
; CHECK-NEXT:    mov w0, #1
; CHECK-NEXT:    ret
; CHECK-NEXT:  .LBB42_2: // %end
; CHECK-NEXT:    mov w0, w1
; CHECK-NEXT:    ret
  %vz = zext i16 %v to i32
  %c = icmp slt i32 %lhs, %vz
  br i1 %c, label %then, label %end
then:
  ret i32 1
end:
  ret i32 %lhs
}

define i64 @cmp_s_i16i64(i16 %v, i64 %lhs) minsize {
; CHECK-LABEL: cmp_s_i16i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    cmp x1, w0, sxth
; CHECK-NEXT:    b.ge .LBB43_2
; CHECK-NEXT:  // %bb.1: // %then
; CHECK-NEXT:    mov w0, #1
; CHECK-NEXT:    ret
; CHECK-NEXT:  .LBB43_2: // %end
; CHECK-NEXT:    mov x0, x1
; CHECK-NEXT:    ret
  %vz = sext i16 %v to i64
  %c = icmp slt i64 %lhs, %vz
  br i1 %c, label %then, label %end
then:
  ret i64 1
end:
  ret i64 %lhs
}


; Check that implicit zext from w reg write is used instead of uxtw form of add.
define dso_local i64 @add_fold_uxtw(i32 %x, i64 %y) {
; CHECK-LABEL: add_fold_uxtw:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0x3
; CHECK-NEXT:    add x0, x1, x8
; CHECK-NEXT:    ret
entry:
  %m = and i32 %x, 3
  %ext = zext i32 %m to i64
  %ret = add i64 %y, %ext
  ret i64 %ret
}

; Check that implicit zext from w reg write is used instead of uxtw
; form of sub and that mov WZR is folded to form a neg instruction.
define dso_local i64 @sub_fold_uxtw_xzr(i32 %x)  {
; CHECK-LABEL: sub_fold_uxtw_xzr:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0x3
; CHECK-NEXT:    neg x0, x8
; CHECK-NEXT:    ret
entry:
  %m = and i32 %x, 3
  %ext = zext i32 %m to i64
  %ret = sub i64 0, %ext
  ret i64 %ret
}

; Check that implicit zext from w reg write is used instead of uxtw form of subs/cmp.
define dso_local i1 @cmp_fold_uxtw(i32 %x, i64 %y) {
; CHECK-LABEL: cmp_fold_uxtw:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0x3
; CHECK-NEXT:    cmp x1, x8
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
entry:
  %m = and i32 %x, 3
  %ext = zext i32 %m to i64
  %ret = icmp eq i64 %y, %ext
  ret i1 %ret
}

; Check that implicit zext from w reg write is used instead of uxtw
; form of add, leading to madd selection.
define dso_local i64 @madd_fold_uxtw(i32 %x, i64 %y) {
; CHECK-LABEL: madd_fold_uxtw:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0x3
; CHECK-NEXT:    madd x0, x1, x1, x8
; CHECK-NEXT:    ret
entry:
  %m = and i32 %x, 3
  %ext = zext i32 %m to i64
  %mul = mul i64 %y, %y
  %ret = add i64 %mul, %ext
  ret i64 %ret
}

; Check that implicit zext from w reg write is used instead of uxtw
; form of sub, leading to sub/cmp folding.
; Check that implicit zext from w reg write is used instead of uxtw form of subs/cmp.
define dso_local i1 @cmp_sub_fold_uxtw(i32 %x, i64 %y, i64 %z) {
; CHECK-LABEL: cmp_sub_fold_uxtw:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0x3
; CHECK-NEXT:    cmp x2, x8
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
entry:
  %m = and i32 %x, 3
  %ext = zext i32 %m to i64
  %sub = sub i64 %z, %ext
  %ret = icmp eq i64 %sub, 0
  ret i1 %ret
}

; Check that implicit zext from w reg write is used instead of uxtw
; form of add and add of -1 gets selected as sub.
define dso_local i64 @add_imm_fold_uxtw(i32 %x) {
; CHECK-LABEL: add_imm_fold_uxtw:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0x3
; CHECK-NEXT:    sub x0, x8, #1
; CHECK-NEXT:    ret
entry:
  %m = and i32 %x, 3
  %ext = zext i32 %m to i64
  %ret = add i64 %ext, -1
  ret i64 %ret
}

; Check that implicit zext from w reg write is used instead of uxtw
; form of add and add lsl form gets selected.
define dso_local i64 @add_lsl_fold_uxtw(i32 %x, i64 %y) {
; CHECK-LABEL: add_lsl_fold_uxtw:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    orr w8, w0, #0x3
; CHECK-NEXT:    add x0, x8, x1, lsl #3
; CHECK-NEXT:    ret
entry:
  %m = or i32 %x, 3
  %ext = zext i32 %m to i64
  %shift = shl i64 %y, 3
  %ret = add i64 %ext, %shift
  ret i64 %ret
}