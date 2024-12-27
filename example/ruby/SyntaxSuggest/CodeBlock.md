# Class: SyntaxSuggest::CodeBlock
**Inherits:** Object
    

Multiple lines form a singular CodeBlock

Source code is made of multiple CodeBlocks.

Example:

    code_block.to_s # =>
      #   def foo
      #     puts "foo"
      #   end

    code_block.valid? # => true
    code_block.in_valid? # => false


# Attributes
## ends_at[RW] [](#attribute-i-ends_at)
Returns the value of attribute ends_at.

## lines[RW] [](#attribute-i-lines)
Returns the value of attribute lines.

## starts_at[RW] [](#attribute-i-starts_at)
Returns the value of attribute starts_at.


#Instance Methods
## <=>(other) [](#method-i-<=>)
This is used for frontier ordering, we are searching from the largest
indentation to the smallest. This allows us to populate an array with multiple
code blocks then call `sort!` on it without having to specify the sorting
criteria

## current_indent() [](#method-i-current_indent)

## delete() [](#method-i-delete)

## deleted?() [](#method-i-deleted?)

**@return** [Boolean] 

## hidden?() [](#method-i-hidden?)

**@return** [Boolean] 

## initialize(lines:[]) [](#method-i-initialize)

**@return** [CodeBlock] a new instance of CodeBlock

## invalid?() [](#method-i-invalid?)

**@return** [Boolean] 

## is_end?() [](#method-i-is_end?)

**@return** [Boolean] 

## mark_invisible() [](#method-i-mark_invisible)

## to_s() [](#method-i-to_s)

## valid?() [](#method-i-valid?)

**@return** [Boolean] 

## visible_lines() [](#method-i-visible_lines)

