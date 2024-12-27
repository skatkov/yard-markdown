# Class: Lrama::Grammar
**Inherits:** Object
  
**Extended by:** Forwardable
    

Grammar is the result of parsing an input grammar file


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
## instance_delegate(hash ) [](#method-c-instance_delegate)
Takes a hash as its argument.  The key is a symbol or an array of symbols. 
These symbols correspond to method names, instance variable names, or constant
names (see def_delegator).  The value is the accessor to which the methods
will be delegated.

:call-seq:
    delegate method => accessor
    delegate [method, method, ...] => accessor
# Attributes
## accept_symbol[RW] [](#attribute-i-accept_symbol)
Returns the value of attribute accept_symbol.

## after_pop_stack[RW] [](#attribute-i-after_pop_stack)
Returns the value of attribute after_pop_stack.

## after_reduce[RW] [](#attribute-i-after_reduce)
Returns the value of attribute after_reduce.

## after_shift[RW] [](#attribute-i-after_shift)
Returns the value of attribute after_shift.

## after_shift_error_token[RW] [](#attribute-i-after_shift_error_token)
Returns the value of attribute after_shift_error_token.

## aux[RW] [](#attribute-i-aux)
Returns the value of attribute aux.

## before_reduce[RW] [](#attribute-i-before_reduce)
Returns the value of attribute before_reduce.

## eof_symbol[RW] [](#attribute-i-eof_symbol)
Returns the value of attribute eof_symbol.

## error_symbol[RW] [](#attribute-i-error_symbol)
Returns the value of attribute error_symbol.

## error_tokens[RW] [](#attribute-i-error_tokens)
Returns the value of attribute error_tokens.

## expect[RW] [](#attribute-i-expect)
Returns the value of attribute expect.

## initial_action[RW] [](#attribute-i-initial_action)
Returns the value of attribute initial_action.

## lex_param[RW] [](#attribute-i-lex_param)
Returns the value of attribute lex_param.

## locations[RW] [](#attribute-i-locations)
Returns the value of attribute locations.

## no_stdlib[RW] [](#attribute-i-no_stdlib)
Returns the value of attribute no_stdlib.

## parameterizing_rule_resolver[RW] [](#attribute-i-parameterizing_rule_resolver)
Returns the value of attribute parameterizing_rule_resolver.

## parse_param[RW] [](#attribute-i-parse_param)
Returns the value of attribute parse_param.

## percent_codes[RW] [](#attribute-i-percent_codes)
Returns the value of attribute percent_codes.

## printers[RW] [](#attribute-i-printers)
Returns the value of attribute printers.

## rule_builders[RW] [](#attribute-i-rule_builders)
Returns the value of attribute rule_builders.

## rules[RW] [](#attribute-i-rules)
Returns the value of attribute rules.

## sym_to_rules[RW] [](#attribute-i-sym_to_rules)
Returns the value of attribute sym_to_rules.

## symbols_resolver[RW] [](#attribute-i-symbols_resolver)
Returns the value of attribute symbols_resolver.

## types[RW] [](#attribute-i-types)
Returns the value of attribute types.

## undef_symbol[RW] [](#attribute-i-undef_symbol)
Returns the value of attribute undef_symbol.

## union[RW] [](#attribute-i-union)
Returns the value of attribute union.


#Instance Methods
## add_destructor(ident_or_tags:, token_code:, lineno:) [](#method-i-add_destructor)

## add_error_token(ident_or_tags:, token_code:, lineno:) [](#method-i-add_error_token)

## add_left(sym, precedence) [](#method-i-add_left)

## add_nonassoc(sym, precedence) [](#method-i-add_nonassoc)

## add_parameterizing_rule(rule) [](#method-i-add_parameterizing_rule)

## add_percent_code(id:, code:) [](#method-i-add_percent_code)

## add_precedence(sym, precedence) [](#method-i-add_precedence)

## add_printer(ident_or_tags:, token_code:, lineno:) [](#method-i-add_printer)

## add_right(sym, precedence) [](#method-i-add_right)

## add_rule_builder(builder) [](#method-i-add_rule_builder)

## add_type(id:, tag:) [](#method-i-add_type)

## create_rule_builder(rule_counter, midrule_action_counter) [](#method-i-create_rule_builder)

## epilogue=(epilogue) [](#method-i-epilogue=)

## epilogue_first_lineno=(epilogue_first_lineno) [](#method-i-epilogue_first_lineno=)

## find_rules_by_symbol(sym) [](#method-i-find_rules_by_symbol)

## find_rules_by_symbol!(sym) [](#method-i-find_rules_by_symbol!)

## initialize(rule_counter) [](#method-i-initialize)

**@return** [Grammar] a new instance of Grammar

## insert_before_parameterizing_rules(rules) [](#method-i-insert_before_parameterizing_rules)

## parameterizing_rules() [](#method-i-parameterizing_rules)

## prepare() [](#method-i-prepare)

## prologue=(prologue) [](#method-i-prologue=)

## prologue_first_lineno=(prologue_first_lineno) [](#method-i-prologue_first_lineno=)

## set_precedence(sym, precedence) [](#method-i-set_precedence)

## set_union(code, lineno) [](#method-i-set_union)

## validate!() [](#method-i-validate!)
TODO: More validation methods

*   Validation for no_declared_type_reference

