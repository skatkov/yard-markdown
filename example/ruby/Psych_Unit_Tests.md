# Class: Psych_Unit_Tests
**Inherits:** Psych::TestCase
    




#Instance Methods
## teardown() [](#method-i-teardown)

## test_akira() [](#method-i-test_akira)
Tests from Tanaka Akira on [ruby-core]

## test_ambiguous_comments() [](#method-i-test_ambiguous_comments)

## test_basic_map() [](#method-i-test_basic_map)
Tests modified from 00basic.t in Psych.pm

## test_basic_strings() [](#method-i-test_basic_strings)

## test_circular_references() [](#method-i-test_circular_references)
Circular references

## test_date_out_of_range() [](#method-i-test_date_out_of_range)

## test_emitting_indicators() [](#method-i-test_emitting_indicators)

## test_empty_map_key() [](#method-i-test_empty_map_key)
Test empty map/seq in map cycle

## test_multiline_regexp() [](#method-i-test_multiline_regexp)

## test_multiline_string_uses_literal_style() [](#method-i-test_multiline_string_uses_literal_style)

## test_normal_exit() [](#method-i-test_normal_exit)

## test_numeric_cycle() [](#method-i-test_numeric_cycle)

## test_object_id_collision() [](#method-i-test_object_id_collision)
contributed by riley lynch [ruby-Bugs-8548]

## test_range_cycle() [](#method-i-test_range_cycle)
Test Range cycle

## test_ranges() [](#method-i-test_ranges)
Test of Ranges

## test_regexp_with_n() [](#method-i-test_regexp_with_n)
ruby-core:34969
:   

## test_ruby_complex() [](#method-i-test_ruby_complex)

## test_ruby_rational() [](#method-i-test_ruby_rational)

## test_ruby_regexp() [](#method-i-test_ruby_regexp)

## test_ruby_struct() [](#method-i-test_ruby_struct)

## test_spec_anchors_and_aliases() [](#method-i-test_spec_anchors_and_aliases)

## test_spec_application_family() [](#method-i-test_spec_application_family)

## test_spec_builtin_binary() [](#method-i-test_spec_builtin_binary)

## test_spec_builtin_literal_blocks() [](#method-i-test_spec_builtin_literal_blocks)

## test_spec_builtin_map() [](#method-i-test_spec_builtin_map)

## test_spec_builtin_seq() [](#method-i-test_spec_builtin_seq)

## test_spec_builtin_time() [](#method-i-test_spec_builtin_time)

## test_spec_complex_invoice() [](#method-i-test_spec_complex_invoice)

## test_spec_domain_prefix() [](#method-i-test_spec_domain_prefix)

## test_spec_explicit_families() [](#method-i-test_spec_explicit_families)

## test_spec_float_explicit() [](#method-i-test_spec_float_explicit)

## test_spec_force_implicit() [](#method-i-test_spec_force_implicit)

## test_spec_indentation_determines_scope() [](#method-i-test_spec_indentation_determines_scope)

## test_spec_log_file() [](#method-i-test_spec_log_file)

## test_spec_mapping_between_sequences() [](#method-i-test_spec_mapping_between_sequences)

## test_spec_mapping_of_mappings() [](#method-i-test_spec_mapping_of_mappings)

## test_spec_multiline_scalars() [](#method-i-test_spec_multiline_scalars)

## test_spec_nested_comments() [](#method-i-test_spec_nested_comments)

## test_spec_oneline_docs() [](#method-i-test_spec_oneline_docs)

## test_spec_override_anchor() [](#method-i-test_spec_override_anchor)
def test_spec_url_escaping
    Psych.add_domain_type( "domain.tld,2002", "type0" ) { |type, val|
        "ONE: #{val}"
    }
    Psych.add_domain_type( "domain.tld,2002", "type%30" ) { |type, val|
        "TWO: #{val}"
    }
    assert_parse_only(
        { 'same' => [ 'ONE: value', 'ONE: value' ], 'different' => [ 'TWO: value' ] }, <<EOY

same:
    - !domain.tld,2002/type\\x30 value
    - !domain.tld,2002/type0 value

different: # As far as the Psych parser is concerned
    - !domain.tld,2002/type%30 value

EOY
        )
    end

## test_spec_preserve_indent() [](#method-i-test_spec_preserve_indent)

## test_spec_root_fold() [](#method-i-test_spec_root_fold)

## test_spec_root_mapping() [](#method-i-test_spec_root_mapping)

## test_spec_sequence_in_sequence_shortcut() [](#method-i-test_spec_sequence_in_sequence_shortcut)

## test_spec_sequence_key_shortcut() [](#method-i-test_spec_sequence_key_shortcut)

## test_spec_sequence_of_sequences() [](#method-i-test_spec_sequence_of_sequences)

## test_spec_sequence_shortcuts() [](#method-i-test_spec_sequence_shortcuts)

## test_spec_simple_implicit_map() [](#method-i-test_spec_simple_implicit_map)

## test_spec_simple_implicit_sequence() [](#method-i-test_spec_simple_implicit_sequence)
Test the specification examples
*   Many examples have been changes because of whitespace problems that caused
    the two to be inequivalent, or keys to be sorted wrong

## test_spec_simple_map_with_nested_sequences() [](#method-i-test_spec_simple_map_with_nested_sequences)

## test_spec_simple_sequence_with_nested_map() [](#method-i-test_spec_simple_sequence_with_nested_map)

## test_spec_single_folded() [](#method-i-test_spec_single_folded)

## test_spec_single_literal() [](#method-i-test_spec_single_literal)

## test_spec_span_double_quote() [](#method-i-test_spec_span_double_quote)

## test_spec_span_single_quote() [](#method-i-test_spec_span_single_quote)

## test_spec_throwaway() [](#method-i-test_spec_throwaway)

## test_spec_type_float() [](#method-i-test_spec_type_float)

## test_spec_type_int() [](#method-i-test_spec_type_int)

## test_spec_type_misc() [](#method-i-test_spec_type_misc)

## test_string_dump_starting_with_star() [](#method-i-test_string_dump_starting_with_star)

## test_string_dump_with_colon() [](#method-i-test_string_dump_with_colon)

## test_string_starting_with_non_word_character_uses_double_quotes_without_exclamation_mark() [](#method-i-test_string_starting_with_non_word_character_uses_double_quotes_without_exclamation_mark)

## test_syck_compat() [](#method-i-test_syck_compat)

## test_symbol_cycle() [](#method-i-test_symbol_cycle)
Test Symbol cycle

## test_time_now_cycle() [](#method-i-test_time_now_cycle)
Test Time.now cycle

## test_y_method() [](#method-i-test_y_method)

