# Class: TestWIN32OLE_VARIANT
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## test_c_empty() [](#method-i-test_c_empty)

## test_c_noparam() [](#method-i-test_c_noparam)

## test_c_nothing() [](#method-i-test_c_nothing)

## test_c_null() [](#method-i-test_c_null)

## test_conversion_dbl2date_with_msec() [](#method-i-test_conversion_dbl2date_with_msec)

## test_conversion_float2int() [](#method-i-test_conversion_float2int)

## test_conversion_num2str() [](#method-i-test_conversion_num2str)

## test_conversion_ole_variant2ole_variant() [](#method-i-test_conversion_ole_variant2ole_variant)

## test_conversion_str2cy() [](#method-i-test_conversion_str2cy)
this test failed because of VariantTimeToSystemTime and
SystemTimeToVariantTime API ignores wMilliseconds member of SYSTEMTIME 
struct.

def test_conversion_time_nsec2date
    dt = Time.new(2004, 12,24, 12, 24, 45)
    dt += 0.1
    obj = WIN32OLE::Variant.new(dt, WIN32OLE::VARIANT::VT_DATE)
    assert_equal(dt, obj.value)

end

## test_conversion_str2date() [](#method-i-test_conversion_str2date)

## test_conversion_str2num() [](#method-i-test_conversion_str2num)

## test_conversion_time2date() [](#method-i-test_conversion_time2date)

## test_conversion_time2date_with_msec() [](#method-i-test_conversion_time2date_with_msec)

## test_conversion_vt_date() [](#method-i-test_conversion_vt_date)

## test_create_nil_dispatch() [](#method-i-test_create_nil_dispatch)

## test_create_variant_byref() [](#method-i-test_create_variant_byref)

## test_create_vt_array() [](#method-i-test_create_vt_array)

## test_create_vt_array2() [](#method-i-test_create_vt_array2)

## test_create_vt_array3() [](#method-i-test_create_vt_array3)

## test_create_vt_array_exc() [](#method-i-test_create_vt_array_exc)

## test_create_vt_array_int() [](#method-i-test_create_vt_array_int)

## test_create_vt_array_nil() [](#method-i-test_create_vt_array_nil)

## test_create_vt_array_str() [](#method-i-test_create_vt_array_str)

## test_create_vt_array_str2ui1array() [](#method-i-test_create_vt_array_str2ui1array)

## test_create_vt_nested_array() [](#method-i-test_create_vt_nested_array)

## test_s_array() [](#method-i-test_s_array)

## test_s_array_exc() [](#method-i-test_s_array_exc)

## test_s_new() [](#method-i-test_s_new)

## test_s_new_2_argument() [](#method-i-test_s_new_2_argument)

## test_s_new_2_argument2() [](#method-i-test_s_new_2_argument2)

## test_s_new_array() [](#method-i-test_s_new_array)

## test_s_new_ary() [](#method-i-test_s_new_ary)

## test_s_new_dispatch_array() [](#method-i-test_s_new_dispatch_array)

## test_s_new_exc() [](#method-i-test_s_new_exc)

## test_s_new_no_argument() [](#method-i-test_s_new_no_argument)

## test_s_new_one_argument() [](#method-i-test_s_new_one_argument)

## test_s_new_vt_record_exc() [](#method-i-test_s_new_vt_record_exc)

## test_s_new_with_i8_byref() [](#method-i-test_s_new_with_i8_byref)

## test_s_new_with_nil() [](#method-i-test_s_new_with_nil)

## test_s_new_with_non_nil() [](#method-i-test_s_new_with_non_nil)

## test_s_new_with_non_nil_byref() [](#method-i-test_s_new_with_non_nil_byref)

## test_s_new_with_ui8_byref() [](#method-i-test_s_new_with_ui8_byref)

## test_set_value() [](#method-i-test_set_value)

## test_value() [](#method-i-test_value)

## test_vartype() [](#method-i-test_vartype)

## test_vt_array_bracket() [](#method-i-test_vt_array_bracket)

## test_vt_error_noparam() [](#method-i-test_vt_error_noparam)

