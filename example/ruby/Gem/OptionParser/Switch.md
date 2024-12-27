# Class: Gem::OptionParser::Switch
**Inherits:** Object
    

Individual switch class.  Not important to the user.

Defined within Switch are several Switch-derived classes: NoArgument,
RequiredArgument, etc.


# Class Methods
## guess(arg ) [](#method-c-guess)
Guesses argument style from `arg`.  Returns corresponding
Gem::OptionParser::Switch class (OptionalArgument, etc.).
## incompatible_argument_styles(arg , t ) [](#method-c-incompatible_argument_styles)
**@raise** [ArgumentError] 

## pattern() [](#method-c-pattern)
# Attributes
## arg[RW] [](#attribute-i-arg)
:nodoc:

## block[RW] [](#attribute-i-block)
:nodoc:

## conv[RW] [](#attribute-i-conv)
:nodoc:

## desc[RW] [](#attribute-i-desc)
:nodoc:

## long[RW] [](#attribute-i-long)
:nodoc:

## pattern[RW] [](#attribute-i-pattern)
:nodoc:

## short[RW] [](#attribute-i-short)
:nodoc:


#Instance Methods
## add_banner(to) [](#method-i-add_banner)
:nodoc:

## compsys(sdone, ldone) [](#method-i-compsys)
:nodoc:

## initialize(patternnil, convnil, shortnil, longnil, argnil, desc([] if short or long), blocknil, &_block) [](#method-i-initialize)

**@return** [Switch] a new instance of Switch

## match_nonswitch?(str) [](#method-i-match_nonswitch?)
:nodoc:

**@return** [Boolean] 

## omitted_argument(val) [](#method-i-omitted_argument)
:nodoc:

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## pretty_print_contents(q) [](#method-i-pretty_print_contents)
:nodoc:

## summarize(sdone{}, ldone{}, width1, maxwidth - 1, indent"") [](#method-i-summarize)
Produces the summary text. Each line of the summary is yielded to the block
(without newline).

`sdone`
:   Already summarized short style options keyed hash.

`ldone`
:   Already summarized long style options keyed hash.

`width`
:   Width of left side (option part). In other words, the right side
    (description part) starts after `width` columns.

`max`
:   Maximum width of left side -> the options are filled within `max` columns.

`indent`
:   Prefix string indents all summarized lines.


## switch_name() [](#method-i-switch_name)
Main name of the switch.

