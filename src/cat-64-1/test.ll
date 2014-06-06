@value  = external global i64
@hi  = external global i64
@lo  = external global i64

declare void @array_func(i64* %ptr)

define void @init()
{
  %value_ptr = getelementptr i64* @value
  store i64 9223372036854775809, i64* %value_ptr

  ret void
}

define void @cat()
{
  %value_ptr = getelementptr i64* @value
  %value = load i64* %value_ptr

  %value_ext = zext i64 %value to i65

  %value_shift = shl i65 %value_ext, 1

  %hi_shift = lshr i65 %value_shift, 64
  %lo_shift = lshr i65 %value_shift, 0

  %hi = trunc i65 %hi_shift to i64
  %lo = trunc i65 %lo_shift to i64

  %array = alloca i64, i32 2

  %hi_ptr = getelementptr i64* %array, i32 1
  %lo_ptr = getelementptr i64* %array, i32 0

  store i64 %hi, i64* %hi_ptr
  store i64 %lo, i64* %lo_ptr

  call void @array_func(i64* %array)

  store i64 %hi, i64* %hi_ptr
  store i64 %lo, i64* %lo_ptr

  call void @array_func(i64* %array)

  ret void
}
