# Class: RDoc::Markdown::Literals
**Inherits:** Object
    

This set of literals is for Ruby 1.9 regular expressions and gives full
unicode support.

Unlike peg-markdown, this set of literals recognizes Unicode alphanumeric
characters, newlines and spaces.


# Class Methods
## rule_info(name , rendered ) [](#method-c-rule_info)
# Attributes
## failed_rule[RW] [](#attribute-i-failed_rule)
Returns the value of attribute failed_rule.

## failing_rule_offset[RW] [](#attribute-i-failing_rule_offset)
Returns the value of attribute failing_rule_offset.

## pos[RW] [](#attribute-i-pos)
Returns the value of attribute pos.

## result[RW] [](#attribute-i-result)
Returns the value of attribute result.

## string[RW] [](#attribute-i-string)
Returns the value of attribute string.


#Instance Methods
## _Alphanumeric() [](#method-i-_Alphanumeric)
Alphanumeric = /p{Word}/

## _AlphanumericAscii() [](#method-i-_AlphanumericAscii)
AlphanumericAscii = /[A-Za-z0-9]/

## _BOM() [](#method-i-_BOM)
BOM = "uFEFF"

## _Newline() [](#method-i-_Newline)
Newline = /n|r\n?|p{Zl}|p{Zp}/

## _NonAlphanumeric() [](#method-i-_NonAlphanumeric)
NonAlphanumeric = /p{^Word}/

## _Spacechar() [](#method-i-_Spacechar)
Spacechar = /t|p{Zs}/

## apply(rule) [](#method-i-apply)

## apply_with_args(rule, *args) [](#method-i-apply_with_args)

## current_character(targetpos) [](#method-i-current_character)

## current_column(targetpos) [](#method-i-current_column)

## current_line(targetpos) [](#method-i-current_line)

## current_pos_info(targetpos) [](#method-i-current_pos_info)

## external_invoke(other, rule, *args) [](#method-i-external_invoke)

## failure_caret() [](#method-i-failure_caret)

## failure_character() [](#method-i-failure_character)

## failure_info() [](#method-i-failure_info)

## failure_oneline() [](#method-i-failure_oneline)

## get_byte() [](#method-i-get_byte)

## get_line(no) [](#method-i-get_line)

## get_text(start) [](#method-i-get_text)

## grow_lr(rule, args, start_pos, m) [](#method-i-grow_lr)

## initialize(str, debugfalse) [](#method-i-initialize)
This is distinct from setup_parser so that a standalone parser can redefine
#initialize and still have access to the proper parser setup code.

**@return** [Literals] a new instance of Literals

## lines() [](#method-i-lines)

## match_string(str) [](#method-i-match_string)

## parse(rulenil) [](#method-i-parse)

## position_line_offsets() [](#method-i-position_line_offsets)

## raise_error() [](#method-i-raise_error)

**@raise** [ParseError] 

## scan(reg) [](#method-i-scan)

## set_failed_rule(name) [](#method-i-set_failed_rule)

## set_string(string, pos) [](#method-i-set_string)
Sets the string and current parsing position for the parser.

## setup_foreign_grammar() [](#method-i-setup_foreign_grammar)
:startdoc: :stopdoc:

## setup_parser(str, debugfalse) [](#method-i-setup_parser)
Prepares for parsing `str`.  If you define a custom initialize you must call
this method before #parse

## show_error(ioSTDOUT) [](#method-i-show_error)

## show_pos() [](#method-i-show_pos)

