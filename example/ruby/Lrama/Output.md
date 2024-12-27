# Class: Lrama::Output
**Inherits:** Object
  
**Extended by:** Forwardable
    
**Includes:** Lrama::Report::Duration
  



# Class Methods
## def_instance_delegator(accessor , method , ali method) [](#method-c-def_instance_delegator)
Define `method` as delegator instance method with an optional alias name
`ali`. Method calls to `ali` will be delegated to `accessor.method`. 
`accessor` should be a method name, instance variable name, or constant name. 
Use the full path to the constant if providing the constant name. Returns the
name of the method defined.

    class MyQueue
      CONST = 1
      extend Forwardable
      attr_reader :queue
      def initialize
        @queue = []
      end

      def_delegator :@queue, :push, :mypush
      def_delegator 'MyQueue::CONST', :to_i
    end

    q = MyQueue.new
    q.mypush 42
    q.queue    #=> [42]
    q.push 23  #=> NoMethodError
    q.to_i     #=> 1
## def_instance_delegators(accessor , *methods ) [](#method-c-def_instance_delegators)
Shortcut for defining multiple delegator methods, but with no provision for
using a different name.  The following two code samples have the same effect:

    def_delegators :@records, :size, :<<, :map

    def_delegator :@records, :size
    def_delegator :@records, :<<
    def_delegator :@records, :map
## erb(input ) [](#method-c-erb)
## instance_delegate(hash ) [](#method-c-instance_delegate)
Takes a hash as its argument.  The key is a symbol or an array of symbols. 
These symbols correspond to method names, instance variable names, or constant
names (see def_delegator).  The value is the accessor to which the methods
will be delegated.

:call-seq:
    delegate method => accessor
    delegate [method, method, ...] => accessor
# Attributes
## context[RW] [](#attribute-i-context)
Returns the value of attribute context.

## error_recovery[RW] [](#attribute-i-error_recovery)
Returns the value of attribute error_recovery.

## grammar[RW] [](#attribute-i-grammar)
Returns the value of attribute grammar.

## grammar_file_path[RW] [](#attribute-i-grammar_file_path)
Returns the value of attribute grammar_file_path.

## include_header[RW] [](#attribute-i-include_header)
Returns the value of attribute include_header.


#Instance Methods
## after_pop_stack_function(len, comment"") [](#method-i-after_pop_stack_function)

## after_reduce_function(comment"") [](#method-i-after_reduce_function)

## after_shift_error_token_function(comment"") [](#method-i-after_shift_error_token_function)

## after_shift_function(comment"") [](#method-i-after_shift_function)

## aux() [](#method-i-aux)

## b4_cpp_guard__b4_spec_mapped_header_file() [](#method-i-b4_cpp_guard__b4_spec_mapped_header_file)

## before_reduce_function(comment"") [](#method-i-before_reduce_function)

## extract_param_name(param) [](#method-i-extract_param_name)

## initialize(out:, output_file_path:, template_name:, grammar_file_path:, context:, grammar:, header_out:nil, header_file_path:nil, error_recovery:false) [](#method-i-initialize)

**@return** [Output] a new instance of Output

## int_array_to_string(ary) [](#method-i-int_array_to_string)

## int_type_for(ary) [](#method-i-int_type_for)
b4_int_type_for

## lex_param() [](#method-i-lex_param)

## lex_param_name() [](#method-i-lex_param_name)

## omit_blanks(param) [](#method-i-omit_blanks)

## parse_param() [](#method-i-parse_param)
b4_parse_param

## parse_param_name() [](#method-i-parse_param_name)

## parse_param_use(val, loc) [](#method-i-parse_param_use)
b4_parse_param_use

## percent_code(name) [](#method-i-percent_code)
b4_percent_code_get

## render() [](#method-i-render)

## render_partial(file) [](#method-i-render_partial)

## report_duration(method_name) [](#method-i-report_duration)

## spec_mapped_header_file() [](#method-i-spec_mapped_header_file)

## symbol_actions_for_destructor() [](#method-i-symbol_actions_for_destructor)

## symbol_actions_for_error_token() [](#method-i-symbol_actions_for_error_token)

## symbol_actions_for_printer() [](#method-i-symbol_actions_for_printer)

## symbol_enum() [](#method-i-symbol_enum)
b4_symbol_enum

## table_value_equals(table, value, literal, symbol) [](#method-i-table_value_equals)
b4_table_value_equals

## template_basename() [](#method-i-template_basename)

## token_enums() [](#method-i-token_enums)
A part of b4_token_enums

## user_actions() [](#method-i-user_actions)
b4_user_actions

## user_args() [](#method-i-user_args)
b4_user_args

## user_formals() [](#method-i-user_formals)
b4_user_formals

## user_initial_action(comment"") [](#method-i-user_initial_action)
b4_user_initial_action

## yyerror_args() [](#method-i-yyerror_args)
b4_yyerror_args

## yylex_formals() [](#method-i-yylex_formals)
b4_yylex_formals

## yyrline() [](#method-i-yyrline)

## yytname() [](#method-i-yytname)

## yytranslate() [](#method-i-yytranslate)

## yytranslate_inverted() [](#method-i-yytranslate_inverted)

