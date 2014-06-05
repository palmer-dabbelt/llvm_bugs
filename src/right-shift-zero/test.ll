@value_0 = external global i256
@value_128 = external global i256

define void @init()
{
  %value_128_ptr = getelementptr i256* @value_128
  store i256 340282366920938463463374607431768211456, i256* %value_128_ptr

  %value_0_ptr = getelementptr i256* @value_0
  store i256 1, i256* %value_0_ptr

  ret void
}

define i64 @lo_64_0()
{
  %ptr = getelementptr i256* @value_0
  %val = load i256* %ptr
  %trunc = trunc i256 %val to i64
  ret i64 %trunc
}

define i64 @lo_64_128()
{
  %ptr = getelementptr i256* @value_128
  %val = load i256* %ptr
  %trunc = trunc i256 %val to i64
  ret i64 %trunc
}

define i8 @rsh_8_0_c0()
{
  %ptr = getelementptr i256* @value_0
  %val = load i256* %ptr
  %offset_ext = zext i32 0 to i256
  %shift = lshr i256 %val, %offset_ext
  %trunc = trunc i256 %shift to i8
  ret i8 %trunc
}

define i8 @rsh_8_128_c0()
{
  %ptr = getelementptr i256* @value_128
  %val = load i256* %ptr
  %offset_ext = zext i32 0 to i256
  %shift = lshr i256 %val, %offset_ext
  %trunc = trunc i256 %shift to i8
  ret i8 %trunc
}

define i8 @rsh_8_0(i32 %offset)
{
  %ptr = getelementptr i256* @value_0
  %val = load i256* %ptr
  %offset_ext = zext i32 %offset to i256
  %shift = lshr i256 %val, %offset_ext
  %trunc = trunc i256 %shift to i8
  ret i8 %trunc
}

define i8 @rsh_8_128(i32 %offset)
{
  %ptr = getelementptr i256* @value_128
  %val = load i256* %ptr
  %offset_ext = zext i32 %offset to i256
  %shift = lshr i256 %val, %offset_ext
  %trunc = trunc i256 %shift to i8
  ret i8 %trunc
}
