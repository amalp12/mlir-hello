; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-- -mattr=+avx | FileCheck %s
; RUN: llc < %s -mtriple=x86_64-- -mattr=+avx2 | FileCheck %s

define <4 x i32> @freeze_insert_subvector(<8 x i32> %a0) nounwind {
; CHECK-LABEL: freeze_insert_subvector:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vxorps %xmm0, %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = shufflevector <8 x i32> %a0, <8 x i32> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 10, i32 11>
  %y = freeze <8 x i32> %x
  %z = shufflevector <8 x i32> %y, <8 x i32> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  ret <4 x i32> %z
}

define <2 x i64> @freeze_sign_extend_vector_inreg(<16 x i8> %a0) nounwind {
; CHECK-LABEL: freeze_sign_extend_vector_inreg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpmovsxbq %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = sext <16 x i8> %a0 to <16 x i32>
  %y = shufflevector <16 x i32> %x, <16 x i32> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %z = freeze <4 x i32> %y
  %w = sext <4 x i32> %z to <4 x i64>
  %r = shufflevector <4 x i64> %w, <4 x i64> poison, <2 x i32> <i32 0, i32 1>
  ret <2 x i64> %r
}

define <2 x i64> @freeze_zero_extend_vector_inreg(<16 x i8> %a0) nounwind {
; CHECK-LABEL: freeze_zero_extend_vector_inreg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpmovzxbq {{.*#+}} xmm0 = xmm0[0],zero,zero,zero,zero,zero,zero,zero,xmm0[1],zero,zero,zero,zero,zero,zero,zero
; CHECK-NEXT:    ret{{[l|q]}}
  %x = zext <16 x i8> %a0 to <16 x i32>
  %y = shufflevector <16 x i32> %x, <16 x i32> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %z = freeze <4 x i32> %y
  %w = zext <4 x i32> %z to <4 x i64>
  %r = shufflevector <4 x i64> %w, <4 x i64> poison, <2 x i32> <i32 0, i32 1>
  ret <2 x i64> %r
}

define <4 x i32> @freeze_pshufd(<4 x i32> %a0) nounwind {
; CHECK-LABEL: freeze_pshufd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ret{{[l|q]}}
  %x = shufflevector <4 x i32> %a0, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %y = freeze <4 x i32> %x
  %z = shufflevector <4 x i32> %y, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  ret <4 x i32> %z
}

define <4 x float> @freeze_permilps(<4 x float> %a0) nounwind {
; CHECK-LABEL: freeze_permilps:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ret{{[l|q]}}
  %x = shufflevector <4 x float> %a0, <4 x float> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %y = freeze <4 x float> %x
  %z = shufflevector <4 x float> %y, <4 x float> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  ret <4 x float> %z
}