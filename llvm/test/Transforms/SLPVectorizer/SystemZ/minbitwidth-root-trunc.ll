; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt -S --passes=slp-vectorizer -mtriple=systemz -mcpu=z15 %s | FileCheck %s

define void @test(ptr %a, i8 %0, i16 %b.promoted.i) {
; CHECK-LABEL: define void @test(
; CHECK-SAME: ptr [[A:%.*]], i8 [[TMP0:%.*]], i16 [[B_PROMOTED_I:%.*]]) #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:    [[TMP2:%.*]] = zext i8 [[TMP0]] to i128
; CHECK-NEXT:    [[TMP3:%.*]] = insertelement <4 x i16> poison, i16 [[B_PROMOTED_I]], i32 0
; CHECK-NEXT:    [[TMP4:%.*]] = shufflevector <4 x i16> [[TMP3]], <4 x i16> poison, <4 x i32> zeroinitializer
; CHECK-NEXT:    [[TMP5:%.*]] = insertelement <4 x i128> poison, i128 [[TMP2]], i32 0
; CHECK-NEXT:    [[TMP6:%.*]] = shufflevector <4 x i128> [[TMP5]], <4 x i128> poison, <4 x i32> zeroinitializer
; CHECK-NEXT:    [[TMP7:%.*]] = trunc <4 x i128> [[TMP6]] to <4 x i16>
; CHECK-NEXT:    [[TMP8:%.*]] = or <4 x i16> [[TMP4]], [[TMP7]]
; CHECK-NEXT:    [[TMP9:%.*]] = trunc <4 x i16> [[TMP8]] to <4 x i1>
; CHECK-NEXT:    [[TMP10:%.*]] = call i1 @llvm.vector.reduce.and.v4i1(<4 x i1> [[TMP9]])
; CHECK-NEXT:    [[TMP11:%.*]] = zext i1 [[TMP10]] to i64
; CHECK-NEXT:    [[OP_RDX:%.*]] = and i64 [[TMP11]], 1
; CHECK-NEXT:    store i64 [[OP_RDX]], ptr [[A]], align 8
; CHECK-NEXT:    ret void
;
  %2 = zext i8 %0 to i128
  %3 = zext i16 %b.promoted.i to i128
  %4 = or i128 %3, %2
  %5 = trunc i128 %4 to i64
  %6 = and i64 %5, 1
  %7 = zext i16 %b.promoted.i to i128
  %8 = or i128 %7, %2
  %9 = trunc i128 %8 to i64
  %10 = and i64 %6, %9
  %11 = zext i16 %b.promoted.i to i128
  %12 = or i128 %11, %2
  %13 = trunc i128 %12 to i64
  %14 = and i64 %10, %13
  %15 = zext i16 %b.promoted.i to i128
  %16 = or i128 %15, %2
  %17 = trunc i128 %16 to i64
  %18 = and i64 %14, %17
  store i64 %18, ptr %a, align 8
  ret void
}

