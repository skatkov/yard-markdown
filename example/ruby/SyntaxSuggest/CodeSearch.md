# Class: SyntaxSuggest::CodeSearch
**Inherits:** Object
    

Searches code for a syntax error

There are three main phases in the algorithm:

1.  Sanitize/format input source
2.  Search for invalid blocks
3.  Format invalid blocks into something meaninful

This class handles the part.

The bulk of the heavy lifting is done in:

    - CodeFrontier (Holds information for generating blocks and determining if we can stop searching)
    - ParseBlocksFromLine (Creates blocks into the frontier)
    - BlockExpand (Expands existing blocks to search more code)

## Syntax error detection

When the frontier holds the syntax error, we can stop searching

    search = CodeSearch.new(<<~EOM)
      def dog
        def lol
      end
    EOM

    search.call

    search.invalid_blocks.map(&:to_s) # =>
    # => ["def lol\n"]


# Attributes
## code_lines[RW] [](#attribute-i-code_lines)
Returns the value of attribute code_lines.

## invalid_blocks[RW] [](#attribute-i-invalid_blocks)
Returns the value of attribute invalid_blocks.

## record_dir[RW] [](#attribute-i-record_dir)
Returns the value of attribute record_dir.


#Instance Methods
## call() [](#method-i-call)
Main search loop

## create_blocks_from_untracked_lines() [](#method-i-create_blocks_from_untracked_lines)
Parses the most indented lines into blocks that are marked and added to the
frontier

## expand_existing() [](#method-i-expand_existing)
Given an already existing block in the frontier, expand it to see if it
contains our invalid syntax

## initialize(source, record_dir:DEFAULT_VALUE) [](#method-i-initialize)

**@return** [CodeSearch] a new instance of CodeSearch

## push(block, name:) [](#method-i-push)

## record(block:, name:"record") [](#method-i-record)
Used for debugging

