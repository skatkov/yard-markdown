# Class: SyntaxSuggest::ParseBlocksFromIndentLine
**Inherits:** Object
    

This class is responsible for generating initial code blocks that will then
later be expanded.

The biggest concern when guessing code blocks, is accidentally grabbing one
that contains only an "end". In this example:

    def dog
      begonn # misspelled `begin`
      puts "bark"
      end
    end

The following lines would be matched (from bottom to top):

    1) end

    2) puts "bark"
       end

    3) begonn
       puts "bark"
       end

At this point it has no where else to expand, and it will yield this inner
code as a block


# Attributes
## code_lines[RW] [](#attribute-i-code_lines)
Returns the value of attribute code_lines.


#Instance Methods
## each_neighbor_block(target_line) [](#method-i-each_neighbor_block)
Builds blocks from bottom up

## initialize(code_lines:) [](#method-i-initialize)

**@return** [ParseBlocksFromIndentLine] a new instance of ParseBlocksFromIndentLine

