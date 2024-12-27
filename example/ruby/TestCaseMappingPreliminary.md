# Class: TestCaseMappingPreliminary
**Inherits:** Test::Unit::TestCase
    

preliminary tests, using  as a guard to test new implementation strategy



#Instance Methods
## check_capitalize_properties(expected, start, *flags) [](#method-i-check_capitalize_properties)

## check_capitalize_suffixes(lower, upper) [](#method-i-check_capitalize_suffixes)

## check_downcase_properties(expected, start, *flags) [](#method-i-check_downcase_properties)

## check_swapcase_properties(expected, start, *flags) [](#method-i-check_swapcase_properties)
different properties; careful: roundtrip isn't always guaranteed

## check_upcase_properties(expected, start, *flags) [](#method-i-check_upcase_properties)
checks, including idempotence and non-modification; not always guaranteed

## no_longer_a_test_buffer_allocations() [](#method-i-no_longer_a_test_buffer_allocations)

## test_ascii() [](#method-i-test_ascii)

## test_ascii_option() [](#method-i-test_ascii_option)

## test_cherokee() [](#method-i-test_cherokee)

## test_fold_option() [](#method-i-test_fold_option)

## test_general() [](#method-i-test_general)

## test_georgian_canary() [](#method-i-test_georgian_canary)

## test_georgian_capitalize() [](#method-i-test_georgian_capitalize)

## test_georgian_unassigned() [](#method-i-test_georgian_unassigned)

## test_greek() [](#method-i-test_greek)

## test_invalid() [](#method-i-test_invalid)

## test_one_way_upcase() [](#method-i-test_one_way_upcase)

## test_reorder_unfold() [](#method-i-test_reorder_unfold)
This test checks against problems when changing the order of mapping results
in some of the entries of the unfolding table (related to
https://bugs.ruby-lang.org/issues/12990).

## test_shift_jis_downcase_ascii() [](#method-i-test_shift_jis_downcase_ascii)

## test_shift_jis_upcase_ascii() [](#method-i-test_shift_jis_upcase_ascii)

## test_swapcase() [](#method-i-test_swapcase)

## test_titlecase() [](#method-i-test_titlecase)

## test_turcic() [](#method-i-test_turcic)

## test_various() [](#method-i-test_various)

