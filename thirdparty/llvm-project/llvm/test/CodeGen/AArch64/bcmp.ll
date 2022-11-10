; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O2 < %s -mtriple=aarch64-linux-gnu                     | FileCheck %s

declare i32 @bcmp(ptr, ptr, i64)

define i1 @bcmp0(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp0:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov w0, #1
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 0)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp1(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldrb w8, [x0]
; CHECK-NEXT:    ldrb w9, [x1]
; CHECK-NEXT:    cmp w8, w9
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 1)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp2(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldrh w8, [x0]
; CHECK-NEXT:    ldrh w9, [x1]
; CHECK-NEXT:    cmp w8, w9
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 2)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp3(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp3:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldrh w8, [x0]
; CHECK-NEXT:    ldrh w9, [x1]
; CHECK-NEXT:    ldrb w10, [x0, #2]
; CHECK-NEXT:    ldrb w11, [x1, #2]
; CHECK-NEXT:    eor w8, w8, w9
; CHECK-NEXT:    eor w9, w10, w11
; CHECK-NEXT:    orr w8, w8, w9
; CHECK-NEXT:    cmp w8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 3)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp4(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr w8, [x0]
; CHECK-NEXT:    ldr w9, [x1]
; CHECK-NEXT:    cmp w8, w9
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 4)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp5(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp5:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr w8, [x0]
; CHECK-NEXT:    ldr w9, [x1]
; CHECK-NEXT:    ldrb w10, [x0, #4]
; CHECK-NEXT:    ldrb w11, [x1, #4]
; CHECK-NEXT:    eor w8, w8, w9
; CHECK-NEXT:    eor w9, w10, w11
; CHECK-NEXT:    orr w8, w8, w9
; CHECK-NEXT:    cmp w8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 5)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp6(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp6:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr w8, [x0]
; CHECK-NEXT:    ldr w9, [x1]
; CHECK-NEXT:    ldrh w10, [x0, #4]
; CHECK-NEXT:    ldrh w11, [x1, #4]
; CHECK-NEXT:    eor w8, w8, w9
; CHECK-NEXT:    eor w9, w10, w11
; CHECK-NEXT:    orr w8, w8, w9
; CHECK-NEXT:    cmp w8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 6)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp7(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp7:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr w8, [x0]
; CHECK-NEXT:    ldr w9, [x1]
; CHECK-NEXT:    ldur w10, [x0, #3]
; CHECK-NEXT:    ldur w11, [x1, #3]
; CHECK-NEXT:    cmp w8, w9
; CHECK-NEXT:    ccmp w10, w11, #0, eq
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 7)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp8(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr x8, [x0]
; CHECK-NEXT:    ldr x9, [x1]
; CHECK-NEXT:    cmp x8, x9
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 8)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp9(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp9:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldrb w9, [x0, #8]
; CHECK-NEXT:    ldrb w10, [x1, #8]
; CHECK-NEXT:    ldr x8, [x0]
; CHECK-NEXT:    ldr x11, [x1]
; CHECK-NEXT:    eor w9, w9, w10
; CHECK-NEXT:    and x9, x9, #0xff
; CHECK-NEXT:    eor x8, x8, x11
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    cmp x8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 9)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp10(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp10:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldrh w9, [x0, #8]
; CHECK-NEXT:    ldrh w10, [x1, #8]
; CHECK-NEXT:    ldr x8, [x0]
; CHECK-NEXT:    ldr x11, [x1]
; CHECK-NEXT:    eor w9, w9, w10
; CHECK-NEXT:    and x9, x9, #0xffff
; CHECK-NEXT:    eor x8, x8, x11
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    cmp x8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 10)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp11(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp11:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr x8, [x0]
; CHECK-NEXT:    ldr x9, [x1]
; CHECK-NEXT:    ldur x10, [x0, #3]
; CHECK-NEXT:    ldur x11, [x1, #3]
; CHECK-NEXT:    cmp x8, x9
; CHECK-NEXT:    ccmp x10, x11, #0, eq
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 11)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp12(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp12:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr x8, [x0]
; CHECK-NEXT:    ldr x9, [x1]
; CHECK-NEXT:    ldr w10, [x0, #8]
; CHECK-NEXT:    ldr w11, [x1, #8]
; CHECK-NEXT:    eor x8, x8, x9
; CHECK-NEXT:    eor w9, w10, w11
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    cmp x8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 12)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp13(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp13:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr x8, [x0]
; CHECK-NEXT:    ldr x9, [x1]
; CHECK-NEXT:    ldur x10, [x0, #5]
; CHECK-NEXT:    ldur x11, [x1, #5]
; CHECK-NEXT:    cmp x8, x9
; CHECK-NEXT:    ccmp x10, x11, #0, eq
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 13)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp14(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp14:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr x8, [x0]
; CHECK-NEXT:    ldr x9, [x1]
; CHECK-NEXT:    ldur x10, [x0, #6]
; CHECK-NEXT:    ldur x11, [x1, #6]
; CHECK-NEXT:    cmp x8, x9
; CHECK-NEXT:    ccmp x10, x11, #0, eq
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 14)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp15(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp15:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr x8, [x0]
; CHECK-NEXT:    ldr x9, [x1]
; CHECK-NEXT:    ldur x10, [x0, #7]
; CHECK-NEXT:    ldur x11, [x1, #7]
; CHECK-NEXT:    cmp x8, x9
; CHECK-NEXT:    ccmp x10, x11, #0, eq
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 15)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp16(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp x8, x9, [x0]
; CHECK-NEXT:    ldp x10, x11, [x1]
; CHECK-NEXT:    cmp x8, x10
; CHECK-NEXT:    ccmp x9, x11, #0, eq
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 16)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp20(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp20:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp x8, x9, [x0]
; CHECK-NEXT:    ldp x10, x11, [x1]
; CHECK-NEXT:    ldr w12, [x0, #16]
; CHECK-NEXT:    ldr w13, [x1, #16]
; CHECK-NEXT:    eor x8, x8, x10
; CHECK-NEXT:    eor x9, x9, x11
; CHECK-NEXT:    eor w10, w12, w13
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    orr x8, x8, x10
; CHECK-NEXT:    cmp x8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 20)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp24(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp24:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp x8, x9, [x0]
; CHECK-NEXT:    ldp x10, x11, [x1]
; CHECK-NEXT:    ldr x12, [x0, #16]
; CHECK-NEXT:    ldr x13, [x1, #16]
; CHECK-NEXT:    eor x8, x8, x10
; CHECK-NEXT:    eor x9, x9, x11
; CHECK-NEXT:    eor x10, x12, x13
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    orr x8, x8, x10
; CHECK-NEXT:    cmp x8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 24)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp28(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp28:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp x8, x9, [x0]
; CHECK-NEXT:    ldp x10, x11, [x1]
; CHECK-NEXT:    ldr x12, [x0, #16]
; CHECK-NEXT:    ldr x13, [x1, #16]
; CHECK-NEXT:    ldr w14, [x0, #24]
; CHECK-NEXT:    eor x8, x8, x10
; CHECK-NEXT:    ldr w15, [x1, #24]
; CHECK-NEXT:    eor x9, x9, x11
; CHECK-NEXT:    eor x10, x12, x13
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    eor w11, w14, w15
; CHECK-NEXT:    orr x9, x10, x11
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    cmp x8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 28)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp33(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp33:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp x8, x9, [x0]
; CHECK-NEXT:    ldp x10, x11, [x1]
; CHECK-NEXT:    ldp x12, x13, [x0, #16]
; CHECK-NEXT:    ldp x14, x15, [x1, #16]
; CHECK-NEXT:    eor x8, x8, x10
; CHECK-NEXT:    eor x9, x9, x11
; CHECK-NEXT:    ldrb w16, [x0, #32]
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    ldrb w17, [x1, #32]
; CHECK-NEXT:    eor x10, x12, x14
; CHECK-NEXT:    eor x11, x13, x15
; CHECK-NEXT:    eor w12, w16, w17
; CHECK-NEXT:    orr x9, x10, x11
; CHECK-NEXT:    and x10, x12, #0xff
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    orr x8, x8, x10
; CHECK-NEXT:    cmp x8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 33)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp38(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp38:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp x8, x9, [x0]
; CHECK-NEXT:    ldp x10, x11, [x1]
; CHECK-NEXT:    ldp x12, x13, [x0, #16]
; CHECK-NEXT:    ldp x14, x15, [x1, #16]
; CHECK-NEXT:    eor x8, x8, x10
; CHECK-NEXT:    eor x9, x9, x11
; CHECK-NEXT:    ldur x10, [x0, #30]
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    ldur x11, [x1, #30]
; CHECK-NEXT:    eor x12, x12, x14
; CHECK-NEXT:    eor x13, x13, x15
; CHECK-NEXT:    orr x9, x12, x13
; CHECK-NEXT:    eor x10, x10, x11
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    orr x8, x8, x10
; CHECK-NEXT:    cmp x8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 38)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp45(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp45:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp x8, x9, [x0]
; CHECK-NEXT:    ldp x10, x11, [x1]
; CHECK-NEXT:    ldp x12, x13, [x0, #16]
; CHECK-NEXT:    ldp x14, x15, [x1, #16]
; CHECK-NEXT:    eor x8, x8, x10
; CHECK-NEXT:    eor x9, x9, x11
; CHECK-NEXT:    ldr x16, [x0, #32]
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    ldr x17, [x1, #32]
; CHECK-NEXT:    ldur x18, [x0, #37]
; CHECK-NEXT:    eor x10, x12, x14
; CHECK-NEXT:    ldur x0, [x1, #37]
; CHECK-NEXT:    eor x11, x13, x15
; CHECK-NEXT:    eor x12, x16, x17
; CHECK-NEXT:    orr x9, x10, x11
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    eor x13, x18, x0
; CHECK-NEXT:    orr x10, x12, x13
; CHECK-NEXT:    orr x8, x8, x10
; CHECK-NEXT:    cmp x8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 45)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp64(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp x8, x9, [x0]
; CHECK-NEXT:    ldp x10, x11, [x1]
; CHECK-NEXT:    ldp x12, x13, [x0, #16]
; CHECK-NEXT:    ldp x14, x15, [x1, #16]
; CHECK-NEXT:    eor x8, x8, x10
; CHECK-NEXT:    eor x9, x9, x11
; CHECK-NEXT:    ldp x16, x17, [x0, #32]
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    ldp x18, x2, [x1, #32]
; CHECK-NEXT:    eor x12, x12, x14
; CHECK-NEXT:    eor x13, x13, x15
; CHECK-NEXT:    ldp x3, x0, [x0, #48]
; CHECK-NEXT:    orr x9, x12, x13
; CHECK-NEXT:    ldp x10, x11, [x1, #48]
; CHECK-NEXT:    eor x14, x16, x18
; CHECK-NEXT:    eor x15, x17, x2
; CHECK-NEXT:    orr x12, x14, x15
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    eor x10, x3, x10
; CHECK-NEXT:    eor x11, x0, x11
; CHECK-NEXT:    orr x10, x10, x11
; CHECK-NEXT:    orr x9, x12, x10
; CHECK-NEXT:    orr x8, x8, x9
; CHECK-NEXT:    cmp x8, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 64)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}

define i1 @bcmp89(ptr %a, ptr %b) {
; CHECK-LABEL: bcmp89:
; CHECK:       // %bb.0:
; CHECK-NEXT:    str x30, [sp, #-16]! // 8-byte Folded Spill
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    .cfi_offset w30, -16
; CHECK-NEXT:    mov w2, #89
; CHECK-NEXT:    bl bcmp
; CHECK-NEXT:    cmp w0, #0
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ldr x30, [sp], #16 // 8-byte Folded Reload
; CHECK-NEXT:    ret
  %cr = call i32 @bcmp(ptr %a, ptr %b, i64 89)
  %r = icmp eq i32 %cr, 0
  ret i1 %r
}
