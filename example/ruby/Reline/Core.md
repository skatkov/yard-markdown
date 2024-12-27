# Class: Reline::Core
**Inherits:** Object
  
**Extended by:** Forwardable
    



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
## config[RW] [](#attribute-i-config)
Returns the value of attribute config.

## key_stroke[RW] [](#attribute-i-key_stroke)
Returns the value of attribute key_stroke.

## last_incremental_search[RW] [](#attribute-i-last_incremental_search)
Returns the value of attribute last_incremental_search.

## line_editor[RW] [](#attribute-i-line_editor)
Returns the value of attribute line_editor.

## output[RW] [](#attribute-i-output)
Returns the value of attribute output.


#Instance Methods
## add_dialog_proc(name_sym, p, contextnil) [](#method-i-add_dialog_proc)

**@raise** [ArgumentError] 

## ambiguous_width() [](#method-i-ambiguous_width)

## auto_indent_proc=(p) [](#method-i-auto_indent_proc=)

**@raise** [ArgumentError] 

## basic_quote_characters=(v) [](#method-i-basic_quote_characters=)

## basic_word_break_characters=(v) [](#method-i-basic_word_break_characters=)

## completer_quote_characters=(v) [](#method-i-completer_quote_characters=)

## completer_word_break_characters=(v) [](#method-i-completer_word_break_characters=)

## completion_append_character=(val) [](#method-i-completion_append_character=)

## completion_case_fold() [](#method-i-completion_case_fold)

## completion_case_fold=(v) [](#method-i-completion_case_fold=)

## completion_proc=(p) [](#method-i-completion_proc=)

**@raise** [ArgumentError] 

## completion_quote_character() [](#method-i-completion_quote_character)

## dialog_proc(name_sym) [](#method-i-dialog_proc)

## dig_perfect_match_proc=(p) [](#method-i-dig_perfect_match_proc=)

**@raise** [ArgumentError] 

## emacs_editing_mode() [](#method-i-emacs_editing_mode)

## emacs_editing_mode?() [](#method-i-emacs_editing_mode?)

**@return** [Boolean] 

## encoding() [](#method-i-encoding)

## filename_quote_characters=(v) [](#method-i-filename_quote_characters=)

## get_screen_size() [](#method-i-get_screen_size)

## initialize() [](#method-i-initialize)

**@return** [Core] a new instance of Core

**@yield** [_self] 

**@yieldparam** [Reline::Core] the object that the method was called on

## input=(val) [](#method-i-input=)

**@raise** [TypeError] 

## io_gate() [](#method-i-io_gate)

## output_modifier_proc=(p) [](#method-i-output_modifier_proc=)

**@raise** [ArgumentError] 

## pre_input_hook=(p) [](#method-i-pre_input_hook=)

## prompt_proc=(p) [](#method-i-prompt_proc=)

**@raise** [ArgumentError] 

## readline(prompt'', add_histfalse) [](#method-i-readline)

## readmultiline(prompt'', add_histfalse, &confirm_multiline_termination) [](#method-i-readmultiline)

## special_prefixes=(v) [](#method-i-special_prefixes=)

## vi_editing_mode() [](#method-i-vi_editing_mode)

## vi_editing_mode?() [](#method-i-vi_editing_mode?)

**@return** [Boolean] 

