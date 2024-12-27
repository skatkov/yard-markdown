# Class: Prism::RegexpTest
**Inherits:** TestCase
    




#Instance Methods
## test_absence_operator() [](#method-i-test_absence_operator)

## test_allows_duplicate_named_captures() [](#method-i-test_allows_duplicate_named_captures)

## test_alternation() [](#method-i-test_alternation)
These tests test the rest of the AST. They are not exhaustive, but they should
cover the most common cases. We test these to make sure we don't accidentally
regress and stop being able to extract named captures.

## test_anchors() [](#method-i-test_anchors)

## test_any() [](#method-i-test_any)

## test_atomic_groups() [](#method-i-test_atomic_groups)

## test_beginless_range_quantifier() [](#method-i-test_beginless_range_quantifier)

## test_character_ranges() [](#method-i-test_character_ranges)

## test_character_sets() [](#method-i-test_character_sets)

## test_comments() [](#method-i-test_comments)

## test_comments_with_escaped_parentheses() [](#method-i-test_comments_with_escaped_parentheses)

## test_conditional_expression_with_group() [](#method-i-test_conditional_expression_with_group)

## test_conditional_expression_with_index() [](#method-i-test_conditional_expression_with_index)

## test_conditional_expression_with_name() [](#method-i-test_conditional_expression_with_name)

## test_endless_range_quantifier() [](#method-i-test_endless_range_quantifier)

## test_fake_named_capture_inside_character_set_with_escaped_ending() [](#method-i-test_fake_named_capture_inside_character_set_with_escaped_ending)

## test_fake_named_captures_inside_character_sets() [](#method-i-test_fake_named_captures_inside_character_sets)

## test_fake_range_quantifier_because_of_spaces() [](#method-i-test_fake_range_quantifier_because_of_spaces)

## test_fake_range_quantifier_because_unclosed() [](#method-i-test_fake_range_quantifier_because_unclosed)

## test_flag_combined() [](#method-i-test_flag_combined)

## test_flag_extended() [](#method-i-test_flag_extended)

## test_flag_fixedencoding() [](#method-i-test_flag_fixedencoding)

## test_flag_ignorecase() [](#method-i-test_flag_ignorecase)
These test that flag values are correct.

## test_flag_multiline() [](#method-i-test_flag_multiline)

## test_flag_noencoding() [](#method-i-test_flag_noencoding)

## test_flag_once() [](#method-i-test_flag_once)

## test_invalid_posix_character_classes_should_fall_back_to_regular_classes() [](#method-i-test_invalid_posix_character_classes_should_fall_back_to_regular_classes)

## test_last_encoding_option_wins() [](#method-i-test_last_encoding_option_wins)

## test_named_capture_inside_fake_range_quantifier() [](#method-i-test_named_capture_inside_fake_range_quantifier)

## test_named_capture_inside_nested_character_set() [](#method-i-test_named_capture_inside_nested_character_set)

## test_named_captures_with_arrows() [](#method-i-test_named_captures_with_arrows)
These tests test the actual use case of extracting named capture groups

## test_named_captures_with_single_quotes() [](#method-i-test_named_captures_with_single_quotes)

## test_negated_character_ranges() [](#method-i-test_negated_character_ranges)

## test_negated_character_sets() [](#method-i-test_negated_character_sets)

## test_negated_posix_character_classes() [](#method-i-test_negated_posix_character_classes)

## test_negative_lookaheads() [](#method-i-test_negative_lookaheads)

## test_negative_lookbehinds() [](#method-i-test_negative_lookbehinds)

## test_nested_character_sets() [](#method-i-test_nested_character_sets)

## test_nested_character_sets_with_operators() [](#method-i-test_nested_character_sets_with_operators)

## test_nested_named_captures_with_arrows() [](#method-i-test_nested_named_captures_with_arrows)

## test_nested_named_captures_with_single_quotes() [](#method-i-test_nested_named_captures_with_single_quotes)

## test_non_capturing_groups() [](#method-i-test_non_capturing_groups)

## test_options_on_groups() [](#method-i-test_options_on_groups)

## test_options_on_groups_getting_turned_off() [](#method-i-test_options_on_groups_getting_turned_off)

## test_options_on_groups_some_getting_turned_on_some_getting_turned_off() [](#method-i-test_options_on_groups_some_getting_turned_on_some_getting_turned_off)

## test_plus_quantifier() [](#method-i-test_plus_quantifier)

## test_positive_lookaheads() [](#method-i-test_positive_lookaheads)

## test_positive_lookbehinds() [](#method-i-test_positive_lookbehinds)

## test_posix_character_classes() [](#method-i-test_posix_character_classes)

## test_question_mark_quantifier() [](#method-i-test_question_mark_quantifier)

## test_range_quantifier() [](#method-i-test_range_quantifier)

## test_star_quantifier() [](#method-i-test_star_quantifier)

