# Class: TestParse
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## assert_disallowed_variable(type, noname, invalid) [](#method-i-assert_disallowed_variable)

## assert_nonascii_const() [](#method-i-assert_nonascii_const)

## assert_not_ractor_shareable(obj) [](#method-i-assert_not_ractor_shareable)

## assert_parse(code) [](#method-i-assert_parse)
def test_past_scope_variable
      assert_warning(/past scope/) {catch {|tag| eval("BEGIN{throw tag}; tap {a = 1}; a")}}
    end

## assert_parse_error(code, message) [](#method-i-assert_parse_error)

## assert_ractor_shareable(obj) [](#method-i-assert_ractor_shareable)

## assert_raise_separately(error, message, code) [](#method-i-assert_raise_separately)

## eval_separately(code) [](#method-i-eval_separately)

## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## test_alias_backref() [](#method-i-test_alias_backref)

## test_arg() [](#method-i-test_arg)

## test_arg2() [](#method-i-test_arg2)

## test_assign_in_conditional() [](#method-i-test_assign_in_conditional)

## test_backquote() [](#method-i-test_backquote)

## test_bad_arg() [](#method-i-test_bad_arg)

## test_block_call_colon2() [](#method-i-test_block_call_colon2)

## test_block_dup() [](#method-i-test_block_dup)

## test_block_variable() [](#method-i-test_block_variable)

## test_call_method() [](#method-i-test_call_method)

## test_carrige_return() [](#method-i-test_carrige_return)

## test_cdmarg_after_command_args_and_tlbrace_arg() [](#method-i-test_cdmarg_after_command_args_and_tlbrace_arg)

## test_class_module() [](#method-i-test_class_module)

## test_command_call() [](#method-i-test_command_call)

## test_command_def_cmdarg() [](#method-i-test_command_def_cmdarg)

## test_define_singleton_error() [](#method-i-test_define_singleton_error)

## test_disallowed_class_variable() [](#method-i-test_disallowed_class_variable)

## test_disallowed_gloal_variable() [](#method-i-test_disallowed_gloal_variable)

## test_disallowed_instance_variable() [](#method-i-test_disallowed_instance_variable)

## test_do_lambda() [](#method-i-test_do_lambda)

## test_dot_in_next_line() [](#method-i-test_dot_in_next_line)

## test_dstr() [](#method-i-test_dstr)

## test_dstr_disallowed_variable() [](#method-i-test_dstr_disallowed_variable)

## test_dsym() [](#method-i-test_dsym)

## test_duplicate_argument() [](#method-i-test_duplicate_argument)

## test_dynamic_constant_assignment() [](#method-i-test_dynamic_constant_assignment)

## test_else_without_rescue() [](#method-i-test_else_without_rescue)

## test_embedded_rd() [](#method-i-test_embedded_rd)

## test_embedded_rd_error() [](#method-i-test_embedded_rd_error)

## test_eof() [](#method-i-test_eof)

## test_eof_in_def() [](#method-i-test_eof_in_def)

## test_error_def_in_argument() [](#method-i-test_error_def_in_argument)

## test_error_line() [](#method-i-test_error_line)

## test_escaped_space() [](#method-i-test_escaped_space)

## test_file_in_indented_heredoc() [](#method-i-test_file_in_indented_heredoc)

## test_flip_flop() [](#method-i-test_flip_flop)

## test_float() [](#method-i-test_float)

## test_global_variable() [](#method-i-test_global_variable)

## test_here_document() [](#method-i-test_here_document)

## test_heredoc_interpolation() [](#method-i-test_heredoc_interpolation)

## test_heredoc_unterminated_interpolation() [](#method-i-test_heredoc_unterminated_interpolation)

## test_if_after_class() [](#method-i-test_if_after_class)

## test_invalid_char() [](#method-i-test_invalid_char)

## test_invalid_class_variable() [](#method-i-test_invalid_class_variable)

## test_invalid_instance_variable() [](#method-i-test_invalid_instance_variable)

## test_label() [](#method-i-test_label)

## test_literal_concat() [](#method-i-test_literal_concat)

## test_literal_in_conditional() [](#method-i-test_literal_in_conditional)

## test_location_of_invalid_token() [](#method-i-test_location_of_invalid_token)

## test_lparenarg() [](#method-i-test_lparenarg)

## test_magic_comment() [](#method-i-test_magic_comment)

## test_method_block_location() [](#method-i-test_method_block_location)

## test_method_location_in_rescue() [](#method-i-test_method_location_in_rescue)

## test_mlhs_node() [](#method-i-test_mlhs_node)

## test_named_capture_conflict() [](#method-i-test_named_capture_conflict)

## test_named_capture_in_block() [](#method-i-test_named_capture_in_block)

## test_negative_line_number() [](#method-i-test_negative_line_number)

## test_no_blockarg() [](#method-i-test_no_blockarg)

## test_no_shadowing_variable_warning() [](#method-i-test_no_shadowing_variable_warning)

## test_nonascii_const_set() [](#method-i-test_nonascii_const_set)

## test_nonascii_constant() [](#method-i-test_nonascii_constant)

## test_op_asgn1_with_block() [](#method-i-test_op_asgn1_with_block)

## test_op_name() [](#method-i-test_op_name)

## test_parse_string() [](#method-i-test_parse_string)

## test_parsing_begin_statement_inside_method_definition() [](#method-i-test_parsing_begin_statement_inside_method_definition)

## test_percent() [](#method-i-test_percent)

## test_pow_asgn() [](#method-i-test_pow_asgn)

## test_question() [](#method-i-test_question)

## test_rescue_in_command_assignment() [](#method-i-test_rescue_in_command_assignment)

## test_serial_comparison() [](#method-i-test_serial_comparison)

## test_set_backref() [](#method-i-test_set_backref)

## test_shadowing_private_local_variable() [](#method-i-test_shadowing_private_local_variable)

## test_shareable_constant_value_hash_with_keyword_splat() [](#method-i-test_shareable_constant_value_hash_with_keyword_splat)

## test_shareable_constant_value_ignored() [](#method-i-test_shareable_constant_value_ignored)

## test_shareable_constant_value_invalid() [](#method-i-test_shareable_constant_value_invalid)

## test_shareable_constant_value_literal_const_refs() [](#method-i-test_shareable_constant_value_literal_const_refs)

## test_shareable_constant_value_nested() [](#method-i-test_shareable_constant_value_nested)

## test_shareable_constant_value_nonliteral() [](#method-i-test_shareable_constant_value_nonliteral)

## test_shareable_constant_value_simple() [](#method-i-test_shareable_constant_value_simple)

## test_shareable_constant_value_unfrozen() [](#method-i-test_shareable_constant_value_unfrozen)

## test_shareable_constant_value_unshareable_literal() [](#method-i-test_shareable_constant_value_unshareable_literal)

## test_string() [](#method-i-test_string)

## test_symbol() [](#method-i-test_symbol)

## test_truncated_source_line() [](#method-i-test_truncated_source_line)

## test_unassignable() [](#method-i-test_unassignable)

## test_unclosed_unicode_escape_at_eol_bug_19750() [](#method-i-test_unclosed_unicode_escape_at_eol_bug_19750)

## test_unexpected_eof() [](#method-i-test_unexpected_eof)

## test_unexpected_token_after_numeric() [](#method-i-test_unexpected_token_after_numeric)

## test_unexpected_token_error() [](#method-i-test_unexpected_token_error)

## test_ungettable_gvar() [](#method-i-test_ungettable_gvar)

## test_unterminated_regexp_error() [](#method-i-test_unterminated_regexp_error)

## test_unused_variable() [](#method-i-test_unused_variable)

## test_utf8_bom() [](#method-i-test_utf8_bom)

## test_void_expr_stmts_value() [](#method-i-test_void_expr_stmts_value)

## test_void_value_in_rhs() [](#method-i-test_void_value_in_rhs)

## test_whitespace_warning() [](#method-i-test_whitespace_warning)

## test_words() [](#method-i-test_words)

## test_xstring() [](#method-i-test_xstring)

## test_yyerror_at_eol() [](#method-i-test_yyerror_at_eol)

