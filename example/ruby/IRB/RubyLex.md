# Class: IRB::RubyLex
**Inherits:** Object
    

:stopdoc:


# Class Methods
## compile_with_errors_suppressed(code , line_no: 1) [](#method-c-compile_with_errors_suppressed)
## generate_local_variables_assign_code(local_variables ) [](#method-c-generate_local_variables_assign_code)
## interpolate_ripper_ignored_tokens(code , tokens ) [](#method-c-interpolate_ripper_ignored_tokens)
Some part of the code is not included in Ripper's token. Example: DATA part,
token after heredoc_beg when heredoc has unclosed embexpr. With interpolated
tokens, tokens.map(&:tok).join will be equal to code.
## ripper_lex_without_warning(code , local_variables: []) [](#method-c-ripper_lex_without_warning)

#Instance Methods
## assignment_expression?(code, local_variables:) [](#method-i-assignment_expression?)

**@return** [Boolean] 

## calc_indent_level(opens) [](#method-i-calc_indent_level)

## check_code_state(code, local_variables:) [](#method-i-check_code_state)

## check_code_syntax(code, local_variables:) [](#method-i-check_code_syntax)

## check_termination_in_prev_line(code, local_variables:) [](#method-i-check_termination_in_prev_line)

## code_terminated?(code, tokens, opens, local_variables:) [](#method-i-code_terminated?)

**@return** [Boolean] 

## free_indent_token?(token) [](#method-i-free_indent_token?)

**@return** [Boolean] 

## indent_difference(lines, line_results, line_index) [](#method-i-indent_difference)
Calculates the difference of pasted code's indent and indent calculated from
tokens

## ltype_from_open_tokens(opens) [](#method-i-ltype_from_open_tokens)

## process_indent_level(tokens, lines, line_index, is_newline) [](#method-i-process_indent_level)

## should_continue?(tokens) [](#method-i-should_continue?)

**@return** [Boolean] 

