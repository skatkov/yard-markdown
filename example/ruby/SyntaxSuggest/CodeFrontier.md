# Class: SyntaxSuggest::CodeFrontier
**Inherits:** Object
    

There are three main phases in the algorithm:

1.  Sanitize/format input source
2.  Search for invalid blocks
3.  Format invalid blocks into something meaningful

The Code frontier is a critical part of the second step

## Knowing where we've been

Once a code block is generated it is added onto the frontier. Then it will be
sorted by indentation and frontier can be filtered. Large blocks that fully
enclose a smaller block will cause the smaller block to be evicted.

    CodeFrontier#<<(block) # Adds block to frontier
    CodeFrontier#pop # Removes block from frontier

## Knowing where we can go

Internally the frontier keeps track of "unvisited" lines which are exposed via
`next_indent_line` when called, this method returns, a line of code with the
highest indentation.

The returned line of code can be used to build a CodeBlock and then that code
block is added back to the frontier. Then, the lines are removed from the
"unvisited" so we don't double-create the same block.

    CodeFrontier#next_indent_line # Shows next line
    CodeFrontier#register_indent_block(block) # Removes lines from unvisited

## Knowing when to stop

The frontier knows how to check the entire document for a syntax error. When
blocks are added onto the frontier, they're removed from the document. When
all code containing syntax errors has been added to the frontier, the document
will be parsable without a syntax error and the search can stop.

    CodeFrontier#holds_all_syntax_errors? # Returns true when frontier holds all syntax errors

## Filtering false positives

Once the search is completed, the frontier may have multiple blocks that do
not contain the syntax error. To limit the result to the smallest subset of
"invalid blocks" call:

    CodeFrontier#detect_invalid_blocks


# Class Methods
## combination(array ) [](#method-c-combination)
Example:

    combination([:a, :b, :c, :d])
    # => [[:a], [:b], [:c], [:d], [:a, :b], [:a, :c], [:a, :d], [:b, :c], [:b, :d], [:c, :d], [:a, :b, :c], [:a, :b, :d], [:a, :c, :d], [:b, :c, :d], [:a, :b, :c, :d]]

#Instance Methods
## <<(block) [](#method-i-<<)
Add a block to the frontier

This method ensures the frontier always remains sorted (in indentation order)
and that each code block's lines are removed from the indentation hash so we
don't re-evaluate the same line multiple times.

## count() [](#method-i-count)

## detect_invalid_blocks() [](#method-i-detect_invalid_blocks)
Given that we know our syntax error exists somewhere in our frontier, we want
to find the smallest possible set of blocks that contain all the syntax errors

## expand?() [](#method-i-expand?)

**@return** [Boolean] 

## holds_all_syntax_errors?(block_array@queue, can_cache:true) [](#method-i-holds_all_syntax_errors?)
Returns true if the document is valid with all lines removed. By default it
checks all blocks in present in the frontier array, but can be used for
arbitrary arrays of codeblocks as well

**@return** [Boolean] 

## initialize(code_lines:, unvisited:UnvisitedLines.new(code_lines: code_lines)) [](#method-i-initialize)

**@return** [CodeFrontier] a new instance of CodeFrontier

## next_indent_line() [](#method-i-next_indent_line)

## pop() [](#method-i-pop)
Returns a code block with the largest indentation possible

## register_engulf_block(block) [](#method-i-register_engulf_block)
When one element fully encapsulates another we remove the smaller block from
the frontier. This prevents double expansions and all-around weird behavior.
However this guarantee is quite expensive to maintain

## register_indent_block(block) [](#method-i-register_indent_block)
Keeps track of what lines have been added to blocks and which are not yet
visited.

