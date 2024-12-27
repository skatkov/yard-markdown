# Class: Prism::Translation::Parser::Compiler
**Inherits:** Prism::Compiler
    

A visitor that knows how to convert a prism syntax tree into the
whitequark/parser gem's syntax tree.


# Attributes
## builder[RW] [](#attribute-i-builder)
The Parser::Builders::Default instance that is being used to build the AST.

## forwarding[RW] [](#attribute-i-forwarding)
The types of values that can be forwarded in the current scope.

## in_destructure[RW] [](#attribute-i-in_destructure)
Whether or not the current node is in a destructure.

## in_pattern[RW] [](#attribute-i-in_pattern)
Whether or not the current node is in a pattern.

## offset_cache[RW] [](#attribute-i-offset_cache)
The offset cache that is used to map between byte and character offsets in the
file.

## parser[RW] [](#attribute-i-parser)
The Parser::Base instance that is being used to build the AST.

## source_buffer[RW] [](#attribute-i-source_buffer)
The Parser::Source::Buffer instance that is holding a reference to the source
code.


#Instance Methods
## initialize(parser, offset_cache, forwarding:[], in_destructure:false, in_pattern:false) [](#method-i-initialize)
Initialize a new compiler with the given parser, offset cache, and options.

**@return** [Compiler] a new instance of Compiler

## visit_alias_global_variable_node(node) [](#method-i-visit_alias_global_variable_node)
alias $foo $bar ^^^^^^^^^^^^^^^

## visit_alias_method_node(node) [](#method-i-visit_alias_method_node)
alias foo bar ^^^^^^^^^^^^^

## visit_alternation_pattern_node(node) [](#method-i-visit_alternation_pattern_node)
foo => bar | baz
    ^^^^^^^^^

## visit_and_node(node) [](#method-i-visit_and_node)
a and b ^^^^^^^

## visit_arguments_node(node) [](#method-i-visit_arguments_node)
foo(bar)
    ^^^

## visit_array_node(node) [](#method-i-visit_array_node)
:   ^^


## visit_array_pattern_node(node) [](#method-i-visit_array_pattern_node)
foo => [bar]
    ^^^^^

## visit_assoc_node(node) [](#method-i-visit_assoc_node)
{ a: 1 }
    ^^^^

## visit_assoc_splat_node(node) [](#method-i-visit_assoc_splat_node)
def foo(**); bar(**); end
    ^^

{ **foo }
    ^^^^^

## visit_back_reference_read_node(node) [](#method-i-visit_back_reference_read_node)
$+ ^^

## visit_begin_node(node) [](#method-i-visit_begin_node)
begin end ^^^^^^^^^

## visit_block_argument_node(node) [](#method-i-visit_block_argument_node)
foo(&bar)
    ^^^^

## visit_block_local_variable_node(node) [](#method-i-visit_block_local_variable_node)
foo { |; bar| }
    ^^^

## visit_block_node(node) [](#method-i-visit_block_node)
A block on a keyword or method call.

**@raise** [CompilationError] 

## visit_block_parameter_node(node) [](#method-i-visit_block_parameter_node)
def foo(&bar); end
    ^^^^

## visit_block_parameters_node(node) [](#method-i-visit_block_parameters_node)
A block's parameters.

## visit_break_node(node) [](#method-i-visit_break_node)
break ^^^^^

break foo ^^^^^^^^^

## visit_call_and_write_node(node) [](#method-i-visit_call_and_write_node)
foo.bar &&= baz ^^^^^^^^^^^^^^^

## visit_call_node(node) [](#method-i-visit_call_node)
foo ^^^

foo.bar ^^^^^^^

foo.bar() {} ^^^^^^^^^^^^

## visit_call_operator_write_node(node) [](#method-i-visit_call_operator_write_node)
foo.bar += baz ^^^^^^^^^^^^^^^

## visit_call_or_write_node(node) [](#method-i-visit_call_or_write_node)
foo.bar ||= baz ^^^^^^^^^^^^^^^

## visit_call_target_node(node) [](#method-i-visit_call_target_node)
foo.bar, = 1 ^^^^^^^

## visit_capture_pattern_node(node) [](#method-i-visit_capture_pattern_node)
foo => bar => baz
    ^^^^^^^^^^

## visit_case_match_node(node) [](#method-i-visit_case_match_node)
case foo; in bar; end ^^^^^^^^^^^^^^^^^^^^^

## visit_case_node(node) [](#method-i-visit_case_node)
case foo; when bar; end ^^^^^^^^^^^^^^^^^^^^^^^

## visit_class_node(node) [](#method-i-visit_class_node)
class Foo; end ^^^^^^^^^^^^^^

## visit_class_variable_and_write_node(node) [](#method-i-visit_class_variable_and_write_node)
@@foo &&= bar ^^^^^^^^^^^^^

## visit_class_variable_operator_write_node(node) [](#method-i-visit_class_variable_operator_write_node)
@@foo += bar ^^^^^^^^^^^^

## visit_class_variable_or_write_node(node) [](#method-i-visit_class_variable_or_write_node)
@@foo ||= bar ^^^^^^^^^^^^^

## visit_class_variable_read_node(node) [](#method-i-visit_class_variable_read_node)
@@foo ^^^^^

## visit_class_variable_target_node(node) [](#method-i-visit_class_variable_target_node)
@@foo, = bar ^^^^^

## visit_class_variable_write_node(node) [](#method-i-visit_class_variable_write_node)
@@foo = 1 ^^^^^^^^^

## visit_constant_and_write_node(node) [](#method-i-visit_constant_and_write_node)
Foo &&= bar ^^^^^^^^^^^^

## visit_constant_operator_write_node(node) [](#method-i-visit_constant_operator_write_node)
Foo += bar ^^^^^^^^^^^

## visit_constant_or_write_node(node) [](#method-i-visit_constant_or_write_node)
Foo ||= bar ^^^^^^^^^^^^

## visit_constant_path_and_write_node(node) [](#method-i-visit_constant_path_and_write_node)
Foo::Bar &&= baz ^^^^^^^^^^^^^^^^

## visit_constant_path_node(node) [](#method-i-visit_constant_path_node)
Foo::Bar ^^^^^^^^

## visit_constant_path_operator_write_node(node) [](#method-i-visit_constant_path_operator_write_node)
Foo::Bar += baz ^^^^^^^^^^^^^^^

## visit_constant_path_or_write_node(node) [](#method-i-visit_constant_path_or_write_node)
Foo::Bar ||= baz ^^^^^^^^^^^^^^^^

## visit_constant_path_target_node(node) [](#method-i-visit_constant_path_target_node)
Foo::Bar, = baz ^^^^^^^^

## visit_constant_path_write_node(node) [](#method-i-visit_constant_path_write_node)
Foo::Bar = 1 ^^^^^^^^^^^^

Foo::Foo, Bar::Bar = 1 ^^^^^^^^  ^^^^^^^^

## visit_constant_read_node(node) [](#method-i-visit_constant_read_node)
Foo ^^^

## visit_constant_target_node(node) [](#method-i-visit_constant_target_node)
Foo, = bar ^^^

## visit_constant_write_node(node) [](#method-i-visit_constant_write_node)
Foo = 1 ^^^^^^^

Foo, Bar = 1 ^^^  ^^^

## visit_def_node(node) [](#method-i-visit_def_node)
def foo; end ^^^^^^^^^^^^

def self.foo; end ^^^^^^^^^^^^^^^^^

## visit_defined_node(node) [](#method-i-visit_defined_node)
defined? a ^^^^^^^^^^

defined?(a) ^^^^^^^^^^^

## visit_else_node(node) [](#method-i-visit_else_node)
if foo then bar else baz end
    ^^^^^^^^^^^^

## visit_embedded_statements_node(node) [](#method-i-visit_embedded_statements_node)
"foo #{bar}"
    ^^^^^^

## visit_embedded_variable_node(node) [](#method-i-visit_embedded_variable_node)
"foo #@bar"
    ^^^^^

## visit_ensure_node(node) [](#method-i-visit_ensure_node)
begin; foo; ensure; bar; end
    ^^^^^^^^^^^^

**@raise** [CompilationError] 

## visit_false_node(node) [](#method-i-visit_false_node)
false ^^^^^

## visit_find_pattern_node(node) [](#method-i-visit_find_pattern_node)
foo => [*, bar, *]
    ^^^^^^^^^^^

## visit_float_node(node) [](#method-i-visit_float_node)
1.0 ^^^

## visit_for_node(node) [](#method-i-visit_for_node)
for foo in bar do end ^^^^^^^^^^^^^^^^^^^^^

## visit_forwarding_arguments_node(node) [](#method-i-visit_forwarding_arguments_node)
def foo(...); bar(...); end
    ^^^

## visit_forwarding_parameter_node(node) [](#method-i-visit_forwarding_parameter_node)
def foo(...); end
    ^^^

## visit_forwarding_super_node(node) [](#method-i-visit_forwarding_super_node)
super ^^^^^

super {} ^^^^^^^^

## visit_global_variable_and_write_node(node) [](#method-i-visit_global_variable_and_write_node)
$foo &&= bar ^^^^^^^^^^^^

## visit_global_variable_operator_write_node(node) [](#method-i-visit_global_variable_operator_write_node)
$foo += bar ^^^^^^^^^^^

## visit_global_variable_or_write_node(node) [](#method-i-visit_global_variable_or_write_node)
$foo ||= bar ^^^^^^^^^^^^

## visit_global_variable_read_node(node) [](#method-i-visit_global_variable_read_node)
$foo ^^^^

## visit_global_variable_target_node(node) [](#method-i-visit_global_variable_target_node)
$foo, = bar ^^^^

## visit_global_variable_write_node(node) [](#method-i-visit_global_variable_write_node)
$foo = 1 ^^^^^^^^

## visit_hash_node(node) [](#method-i-visit_hash_node)
{} ^^

## visit_hash_pattern_node(node) [](#method-i-visit_hash_pattern_node)
foo => {}
    ^^

## visit_if_node(node) [](#method-i-visit_if_node)
if foo then bar end ^^^^^^^^^^^^^^^^^^^

bar if foo ^^^^^^^^^^

foo ? bar : baz ^^^^^^^^^^^^^^^

## visit_imaginary_node(node) [](#method-i-visit_imaginary_node)
1i ^^

## visit_implicit_node(node) [](#method-i-visit_implicit_node)
{ foo: }
    ^^^^

**@raise** [CompilationError] 

## visit_implicit_rest_node(node) [](#method-i-visit_implicit_rest_node)
foo { |bar,| }
    ^

**@raise** [CompilationError] 

## visit_in_node(node) [](#method-i-visit_in_node)
case foo; in bar; end ^^^^^^^^^^^^^^^^^^^^^

## visit_index_and_write_node(node) [](#method-i-visit_index_and_write_node)
[foo](bar) &&= baz ^^^^^^^^^^^^^^^^

## visit_index_operator_write_node(node) [](#method-i-visit_index_operator_write_node)
[foo](bar) += baz ^^^^^^^^^^^^^^^

## visit_index_or_write_node(node) [](#method-i-visit_index_or_write_node)
[foo](bar) ||= baz ^^^^^^^^^^^^^^^^

## visit_index_target_node(node) [](#method-i-visit_index_target_node)
[foo](bar), = 1 ^^^^^^^^

## visit_instance_variable_and_write_node(node) [](#method-i-visit_instance_variable_and_write_node)
^^^^^^^^^^^^

## visit_instance_variable_operator_write_node(node) [](#method-i-visit_instance_variable_operator_write_node)
^^^^^^^^^^^

## visit_instance_variable_or_write_node(node) [](#method-i-visit_instance_variable_or_write_node)
^^^^^^^^^^^^

## visit_instance_variable_read_node(node) [](#method-i-visit_instance_variable_read_node)
^^^^

## visit_instance_variable_target_node(node) [](#method-i-visit_instance_variable_target_node)
@foo, = bar ^^^^

## visit_instance_variable_write_node(node) [](#method-i-visit_instance_variable_write_node)
^^^^^^^^

## visit_integer_node(node) [](#method-i-visit_integer_node)
1 ^

## visit_interpolated_regular_expression_node(node) [](#method-i-visit_interpolated_regular_expression_node)
/foo #{bar}/ ^^^^^^^^^^^^

## visit_interpolated_string_node(node) [](#method-i-visit_interpolated_string_node)
"foo #{bar}" ^^^^^^^^^^^^

## visit_interpolated_symbol_node(node) [](#method-i-visit_interpolated_symbol_node)
:"foo #{bar}" ^^^^^^^^^^^^^

## visit_interpolated_x_string_node(node) [](#method-i-visit_interpolated_x_string_node)
`foo #{bar}` ^^^^^^^^^^^^

## visit_it_local_variable_read_node(node) [](#method-i-visit_it_local_variable_read_node)
-> { it }
    ^^

## visit_it_parameters_node(node) [](#method-i-visit_it_parameters_node)
-> { it } ^^^^^^^^^

## visit_keyword_hash_node(node) [](#method-i-visit_keyword_hash_node)
foo(bar: baz)
    ^^^^^^^^

## visit_keyword_rest_parameter_node(node) [](#method-i-visit_keyword_rest_parameter_node)
def foo(**bar); end
    ^^^^^

def foo(**); end
    ^^

## visit_lambda_node(node) [](#method-i-visit_lambda_node)
-> {} ^^^^^

## visit_local_variable_and_write_node(node) [](#method-i-visit_local_variable_and_write_node)
foo &&= bar ^^^^^^^^^^^

## visit_local_variable_operator_write_node(node) [](#method-i-visit_local_variable_operator_write_node)
foo += bar ^^^^^^^^^^

## visit_local_variable_or_write_node(node) [](#method-i-visit_local_variable_or_write_node)
foo ||= bar ^^^^^^^^^^^

## visit_local_variable_read_node(node) [](#method-i-visit_local_variable_read_node)
foo ^^^

## visit_local_variable_target_node(node) [](#method-i-visit_local_variable_target_node)
foo, = bar ^^^

## visit_local_variable_write_node(node) [](#method-i-visit_local_variable_write_node)
foo = 1 ^^^^^^^

## visit_match_predicate_node(node) [](#method-i-visit_match_predicate_node)
foo in bar ^^^^^^^^^^

## visit_match_required_node(node) [](#method-i-visit_match_required_node)
foo => bar ^^^^^^^^^^

## visit_match_write_node(node) [](#method-i-visit_match_write_node)
/(?<foo>foo)/ =~ bar ^^^^^^^^^^^^^^^^^^^^

## visit_missing_node(node) [](#method-i-visit_missing_node)
A node that is missing from the syntax tree. This is only used in the case of
a syntax error. The parser gem doesn't have such a concept, so we invent our
own here.

## visit_module_node(node) [](#method-i-visit_module_node)
module Foo; end ^^^^^^^^^^^^^^^

## visit_multi_target_node(node) [](#method-i-visit_multi_target_node)
foo, bar = baz ^^^^^^^^

## visit_multi_write_node(node) [](#method-i-visit_multi_write_node)
foo, bar = baz ^^^^^^^^^^^^^^

## visit_next_node(node) [](#method-i-visit_next_node)
next ^^^^

next foo ^^^^^^^^

## visit_nil_node(node) [](#method-i-visit_nil_node)
nil ^^^

## visit_no_keywords_parameter_node(node) [](#method-i-visit_no_keywords_parameter_node)
def foo(**nil); end
    ^^^^^

## visit_numbered_parameters_node(node) [](#method-i-visit_numbered_parameters_node)
-> { _1 + _2 } ^^^^^^^^^^^^^^

## visit_numbered_reference_read_node(node) [](#method-i-visit_numbered_reference_read_node)
$1 ^^

## visit_optional_keyword_parameter_node(node) [](#method-i-visit_optional_keyword_parameter_node)
def foo(bar: baz); end
    ^^^^^^^^

## visit_optional_parameter_node(node) [](#method-i-visit_optional_parameter_node)
def foo(bar = 1); end
    ^^^^^^^

## visit_or_node(node) [](#method-i-visit_or_node)
a or b ^^^^^^

## visit_parameters_node(node) [](#method-i-visit_parameters_node)
def foo(bar, *baz); end
    ^^^^^^^^^

## visit_parentheses_node(node) [](#method-i-visit_parentheses_node)
() ^^

(1) ^^^

## visit_pinned_expression_node(node) [](#method-i-visit_pinned_expression_node)
foo => ^(bar)
    ^^^^^^

## visit_pinned_variable_node(node) [](#method-i-visit_pinned_variable_node)
foo = 1 and bar => ^foo
    ^^^^

## visit_post_execution_node(node) [](#method-i-visit_post_execution_node)
END {}

## visit_pre_execution_node(node) [](#method-i-visit_pre_execution_node)
BEGIN {}

## visit_program_node(node) [](#method-i-visit_program_node)
The top-level program node.

## visit_range_node(node) [](#method-i-visit_range_node)
0..5 ^^^^

## visit_rational_node(node) [](#method-i-visit_rational_node)
1r ^^

## visit_redo_node(node) [](#method-i-visit_redo_node)
redo ^^^^

## visit_regular_expression_node(node) [](#method-i-visit_regular_expression_node)
/foo/ ^^^^^

## visit_required_keyword_parameter_node(node) [](#method-i-visit_required_keyword_parameter_node)
def foo(bar:); end
    ^^^^

## visit_required_parameter_node(node) [](#method-i-visit_required_parameter_node)
def foo(bar); end
    ^^^

## visit_rescue_modifier_node(node) [](#method-i-visit_rescue_modifier_node)
foo rescue bar ^^^^^^^^^^^^^^

## visit_rescue_node(node) [](#method-i-visit_rescue_node)
begin; rescue; end
    ^^^^^^^

**@raise** [CompilationError] 

## visit_rest_parameter_node(node) [](#method-i-visit_rest_parameter_node)
def foo(*bar); end
    ^^^^

def foo(*); end
    ^

## visit_retry_node(node) [](#method-i-visit_retry_node)
retry ^^^^^

## visit_return_node(node) [](#method-i-visit_return_node)
return ^^^^^^

return 1 ^^^^^^^^

## visit_self_node(node) [](#method-i-visit_self_node)
self ^^^^

## visit_shareable_constant_node(node) [](#method-i-visit_shareable_constant_node)
A shareable constant.

## visit_singleton_class_node(node) [](#method-i-visit_singleton_class_node)
class << self; end ^^^^^^^^^^^^^^^^^^

## visit_source_encoding_node(node) [](#method-i-visit_source_encoding_node)
__ENCODING__ ^^^^^^^^^^^^

## visit_source_file_node(node) [](#method-i-visit_source_file_node)
__FILE__ ^^^^^^^^

## visit_source_line_node(node) [](#method-i-visit_source_line_node)
__LINE__ ^^^^^^^^

## visit_splat_node(node) [](#method-i-visit_splat_node)
foo(*bar)
    ^^^^

def foo((bar, *baz)); end
    ^^^^

def foo(*); bar(*); end
    ^

## visit_statements_node(node) [](#method-i-visit_statements_node)
A list of statements.

## visit_string_node(node) [](#method-i-visit_string_node)
"foo" ^^^^^

## visit_super_node(node) [](#method-i-visit_super_node)
super(foo) ^^^^^^^^^^

## visit_symbol_node(node) [](#method-i-visit_symbol_node)
:foo ^^^^

## visit_true_node(node) [](#method-i-visit_true_node)
true ^^^^

## visit_undef_node(node) [](#method-i-visit_undef_node)
undef foo ^^^^^^^^^

## visit_unless_node(node) [](#method-i-visit_unless_node)
unless foo; bar end ^^^^^^^^^^^^^^^^^^^

bar unless foo ^^^^^^^^^^^^^^

## visit_until_node(node) [](#method-i-visit_until_node)
until foo; bar end ^^^^^^^^^^^^^^^^^^

bar until foo ^^^^^^^^^^^^^

## visit_when_node(node) [](#method-i-visit_when_node)
case foo; when bar; end
    ^^^^^^^^^^^^^

## visit_while_node(node) [](#method-i-visit_while_node)
while foo; bar end ^^^^^^^^^^^^^^^^^^

bar while foo ^^^^^^^^^^^^^

## visit_x_string_node(node) [](#method-i-visit_x_string_node)
`foo` ^^^^^

## visit_yield_node(node) [](#method-i-visit_yield_node)
yield ^^^^^

yield 1 ^^^^^^^

