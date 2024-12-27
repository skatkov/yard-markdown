# Class: Psych::TestString
**Inherits:** Psych::TestCase
    




#Instance Methods
## binary_string(percentage0.31, length100) [](#method-i-binary_string)

## test_all_yaml_1_1_booleans_are_quoted() [](#method-i-test_all_yaml_1_1_booleans_are_quoted)
'y', 'Y', 'n', 'N' are kind of ambiguous.  Syck treated those literals in YAML
documents as strings.  But this is not what the YAML 1.1 spec says. YAML 1.1
says they should be treated as booleans.  When we're dumping documents, we
know it's a string, so adding quotes will eliminate the "ambiguity" in the
emitted document

## test_another_subclass_with_attributes() [](#method-i-test_another_subclass_with_attributes)

## test_ascii_only_8bit_string() [](#method-i-test_ascii_only_8bit_string)

## test_ascii_only_binary_string() [](#method-i-test_ascii_only_binary_string)

## test_backwards_with_syck() [](#method-i-test_backwards_with_syck)

## test_binary() [](#method-i-test_binary)

## test_binary_string() [](#method-i-test_binary_string)

## test_binary_string_null() [](#method-i-test_binary_string_null)

## test_cycle_x() [](#method-i-test_cycle_x)

## test_dash_dot() [](#method-i-test_dash_dot)

## test_doublequotes_when_there_is_a_single() [](#method-i-test_doublequotes_when_there_is_a_single)

## test_empty_character_subclass() [](#method-i-test_empty_character_subclass)

## test_empty_subclass() [](#method-i-test_empty_subclass)

## test_float_confusion() [](#method-i-test_float_confusion)

## test_float_with_no_fractional_before_exponent() [](#method-i-test_float_with_no_fractional_before_exponent)

## test_folded_strip_when_longer_than_line_width_and_no_newlines() [](#method-i-test_folded_strip_when_longer_than_line_width_and_no_newlines)
http://yaml.org/spec/1.2/2009-07-21/spec.html#id2593651

## test_folded_when_longer_than_line_width_and_with_final_line_break() [](#method-i-test_folded_when_longer_than_line_width_and_with_final_line_break)

## test_literal_strip_when_inner_line_break_and_no_final_line_break() [](#method-i-test_literal_strip_when_inner_line_break_and_no_final_line_break)
http://yaml.org/spec/1.2/2009-07-21/spec.html#id2593651

## test_literal_when_inner_and_final_line_break() [](#method-i-test_literal_when_inner_and_final_line_break)

## test_no_doublequotes_with_special_characters() [](#method-i-test_no_doublequotes_with_special_characters)

## test_no_quotes_when_start_with_non_ascii_character() [](#method-i-test_no_quotes_when_start_with_non_ascii_character)

## test_nonascii_string_as_binary() [](#method-i-test_nonascii_string_as_binary)

## test_plain_when_shorten_than_line_width_and_no_final_line_break() [](#method-i-test_plain_when_shorten_than_line_width_and_no_final_line_break)

## test_plain_when_shorten_than_line_width_and_with_final_line_break() [](#method-i-test_plain_when_shorten_than_line_width_and_with_final_line_break)

## test_self_referential_string() [](#method-i-test_self_referential_string)

## test_single_quote_when_matching_date() [](#method-i-test_single_quote_when_matching_date)

## test_string_subclass_with_anchor() [](#method-i-test_string_subclass_with_anchor)

## test_string_with_base_60() [](#method-i-test_string_with_base_60)

## test_string_with_ivars() [](#method-i-test_string_with_ivars)

## test_string_with_newline() [](#method-i-test_string_with_newline)

## test_subclass_with_attributes() [](#method-i-test_subclass_with_attributes)

