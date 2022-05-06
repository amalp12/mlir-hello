; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=aarch64-none-eabi | FileCheck %s
; RUN: llc < %s -mtriple=aarch64-none-eabi -mattr=-neon | FileCheck -check-prefix=CHECK-NONEON %s
; Check that selection dag legalization of fcopysign works in cases with
; different modes for the arguments.

declare fp128 @llvm.copysign.f128(fp128, fp128)
declare float @llvm.copysign.f32(float %a, float %b)
declare double @llvm.copysign.f64(double %a, double %b)
declare half @llvm.copysign.f16(half %a, half %b)

@val_float = dso_local global float zeroinitializer, align 4
@val_double = dso_local global double zeroinitializer, align 8
@val_fp128 = dso_local global fp128 zeroinitializer, align 16

define fp128 @copysign0() {
; CHECK-LABEL: copysign0:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    adrp x8, .LCPI0_0
; CHECK-NEXT:    ldr q0, [x8, :lo12:.LCPI0_0]
; CHECK-NEXT:    adrp x8, val_double
; CHECK-NEXT:    str q0, [sp, #-16]!
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    ldr x8, [x8, :lo12:val_double]
; CHECK-NEXT:    ldrb w9, [sp, #15]
; CHECK-NEXT:    and x8, x8, #0x8000000000000000
; CHECK-NEXT:    lsr x8, x8, #56
; CHECK-NEXT:    bfxil w8, w9, #0, #7
; CHECK-NEXT:    strb w8, [sp, #15]
; CHECK-NEXT:    ldr q0, [sp], #16
; CHECK-NEXT:    ret
;
; CHECK-NONEON-LABEL: copysign0:
; CHECK-NONEON:       // %bb.0: // %entry
; CHECK-NONEON-NEXT:    adrp x8, .LCPI0_0
; CHECK-NONEON-NEXT:    ldr q0, [x8, :lo12:.LCPI0_0]
; CHECK-NONEON-NEXT:    adrp x8, val_double
; CHECK-NONEON-NEXT:    str q0, [sp, #-16]!
; CHECK-NONEON-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NONEON-NEXT:    ldr x8, [x8, :lo12:val_double]
; CHECK-NONEON-NEXT:    ldrb w9, [sp, #15]
; CHECK-NONEON-NEXT:    and x8, x8, #0x8000000000000000
; CHECK-NONEON-NEXT:    lsr x8, x8, #56
; CHECK-NONEON-NEXT:    bfxil w8, w9, #0, #7
; CHECK-NONEON-NEXT:    strb w8, [sp, #15]
; CHECK-NONEON-NEXT:    ldr q0, [sp], #16
; CHECK-NONEON-NEXT:    ret
entry:
  %v = load double, double* @val_double, align 8
  %conv = fpext double %v to fp128
  %call = tail call fp128 @llvm.copysign.f128(fp128 0xL00000000000000007FFF000000000000, fp128 %conv) #2
  ret fp128 %call
}

define fp128@copysign1() {
; CHECK-LABEL: copysign1:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    adrp x8, val_fp128
; CHECK-NEXT:    ldr q0, [x8, :lo12:val_fp128]
; CHECK-NEXT:    adrp x8, val_float
; CHECK-NEXT:    str q0, [sp, #-16]!
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    ldr w8, [x8, :lo12:val_float]
; CHECK-NEXT:    ldrb w9, [sp, #15]
; CHECK-NEXT:    and w8, w8, #0x80000000
; CHECK-NEXT:    lsr w8, w8, #24
; CHECK-NEXT:    bfxil w8, w9, #0, #7
; CHECK-NEXT:    strb w8, [sp, #15]
; CHECK-NEXT:    ldr q0, [sp], #16
; CHECK-NEXT:    ret
;
; CHECK-NONEON-LABEL: copysign1:
; CHECK-NONEON:       // %bb.0: // %entry
; CHECK-NONEON-NEXT:    adrp x8, val_fp128
; CHECK-NONEON-NEXT:    ldr q0, [x8, :lo12:val_fp128]
; CHECK-NONEON-NEXT:    adrp x8, val_float
; CHECK-NONEON-NEXT:    str q0, [sp, #-16]!
; CHECK-NONEON-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NONEON-NEXT:    ldr w8, [x8, :lo12:val_float]
; CHECK-NONEON-NEXT:    ldrb w9, [sp, #15]
; CHECK-NONEON-NEXT:    and w8, w8, #0x80000000
; CHECK-NONEON-NEXT:    lsr w8, w8, #24
; CHECK-NONEON-NEXT:    bfxil w8, w9, #0, #7
; CHECK-NONEON-NEXT:    strb w8, [sp, #15]
; CHECK-NONEON-NEXT:    ldr q0, [sp], #16
; CHECK-NONEON-NEXT:    ret
entry:
  %v0 = load fp128, fp128* @val_fp128, align 16
  %v1 = load float, float* @val_float, align 4
  %conv = fpext float %v1 to fp128
  %call = tail call fp128 @llvm.copysign.f128(fp128 %v0, fp128 %conv)
  ret fp128 %call
}

define float @copysign32(float %a, float %b) {
; CHECK-LABEL: copysign32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mvni v2.4s, #128, lsl #24
; CHECK-NEXT:    // kill: def $s1 killed $s1 def $q1
; CHECK-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    // kill: def $s0 killed $s0 killed $q0
; CHECK-NEXT:    ret
;
; CHECK-NONEON-LABEL: copysign32:
; CHECK-NONEON:       // %bb.0: // %entry
; CHECK-NONEON-NEXT:    fabs s0, s0
; CHECK-NONEON-NEXT:    fmov w8, s1
; CHECK-NONEON-NEXT:    tst w8, #0x80000000
; CHECK-NONEON-NEXT:    fneg s2, s0
; CHECK-NONEON-NEXT:    fcsel s0, s2, s0, ne
; CHECK-NONEON-NEXT:    ret
entry:
  %c = call float @llvm.copysign.f32(float %a, float %b)
  ret float %c
}

define double @copysign64(double %a, double %b) {
; CHECK-LABEL: copysign64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    movi v2.2d, #0xffffffffffffffff
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-NEXT:    fneg v2.2d, v2.2d
; CHECK-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $q0
; CHECK-NEXT:    ret
;
; CHECK-NONEON-LABEL: copysign64:
; CHECK-NONEON:       // %bb.0: // %entry
; CHECK-NONEON-NEXT:    fabs d0, d0
; CHECK-NONEON-NEXT:    fmov x8, d1
; CHECK-NONEON-NEXT:    tst x8, #0x8000000000000000
; CHECK-NONEON-NEXT:    fneg d2, d0
; CHECK-NONEON-NEXT:    fcsel d0, d2, d0, ne
; CHECK-NONEON-NEXT:    ret
entry:
  %c = call double @llvm.copysign.f64(double %a, double %b)
  ret double %c
}

define half @copysign16(half %a, half %b) {
; CHECK-LABEL: copysign16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvt s1, h1
; CHECK-NEXT:    fcvt s0, h0
; CHECK-NEXT:    mvni v2.4s, #128, lsl #24
; CHECK-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    fcvt h0, s0
; CHECK-NEXT:    ret
;
; CHECK-NONEON-LABEL: copysign16:
; CHECK-NONEON:       // %bb.0: // %entry
; CHECK-NONEON-NEXT:    sub sp, sp, #16
; CHECK-NONEON-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NONEON-NEXT:    fcvt s0, h0
; CHECK-NONEON-NEXT:    str h1, [sp, #12]
; CHECK-NONEON-NEXT:    ldrb w8, [sp, #13]
; CHECK-NONEON-NEXT:    fabs s0, s0
; CHECK-NONEON-NEXT:    tst w8, #0x80
; CHECK-NONEON-NEXT:    fneg s1, s0
; CHECK-NONEON-NEXT:    fcsel s0, s1, s0, ne
; CHECK-NONEON-NEXT:    fcvt h0, s0
; CHECK-NONEON-NEXT:    add sp, sp, #16
; CHECK-NONEON-NEXT:    ret
entry:
  %c = call half @llvm.copysign.f16(half %a, half %b)
  ret half %c
}