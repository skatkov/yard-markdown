# Class: SyntaxSuggest::AroundBlockScan
**Inherits:** Object
    

This class is useful for exploring contents before and after a block

It searches above and below the passed in block to match for whatever criteria
you give it:

Example:

    def dog         # 1
      puts "bark"   # 2
      puts "bark"   # 3
    end             # 4

    scan = AroundBlockScan.new(
      code_lines: code_lines
      block: CodeBlock.new(lines: code_lines[1])
    )

    scan.scan_while { true }

    puts scan.before_index # => 0
    puts scan.after_index  # => 3



#Instance Methods
## code_block() [](#method-i-code_block)
Return the currently matched lines as a `CodeBlock`

When a `CodeBlock` is created it will gather metadata about itself, so this is
not a free conversion. Avoid allocating more CodeBlock's than needed

## force_add_empty() [](#method-i-force_add_empty)
When using this flag, `scan_while` will bypass the block it's given and always
add a line that responds truthy to `CodeLine#empty?`

Empty lines contain no code, only whitespace such as leading spaces a newline.

## force_add_hidden() [](#method-i-force_add_hidden)
When using this flag, `scan_while` will bypass the block it's given and always
add a line that responds truthy to `CodeLine#hidden?`

Lines are hidden when they've been evaluated by the parser as part of a block
and found to contain valid code.

## initialize(code_lines:, block:) [](#method-i-initialize)

**@return** [AroundBlockScan] a new instance of AroundBlockScan

## inspect() [](#method-i-inspect)
Manageable rspec errors

## lines() [](#method-i-lines)
Returns the lines matched by the current scan as an array of CodeLines

## lookahead_balance_one_line() [](#method-i-lookahead_balance_one_line)
Scanning is intentionally conservative because we have no way of rolling back
an aggressive block (at this time)

If a block was stopped for some trivial reason, (like an empty line) but the
next line would have caused it to be balanced then we can check that condition
and grab just one more line either up or down.

For example, below if we're scanning up, line 2 might cause the scanning to
stop. This is because empty lines might denote logical breaks where the user
intended to chunk code which is a good place to stop and check validity.
Unfortunately it also means we might have a "dangling" keyword or end.

    1 def bark
    2
    3 end

If lines 2 and 3 are in the block, then when this method is run it would see
it is unbalanced, but that acquiring line 1 would make it balanced, so that's
what it does.

## scan_adjacent_indent() [](#method-i-scan_adjacent_indent)
Scan blocks based on indentation of next line above/below block

Determines indentaion of the next line above/below the current block.

Normally this is called when a block has expanded to capture all "neighbors"
at the same (or greater) indentation and needs to expand out. For example the
`def/end` lines surrounding a method.

## scan_neighbors_not_empty() [](#method-i-scan_neighbors_not_empty)
Finds code lines at the same or greater indentation and adds them to the block

## scan_while() [](#method-i-scan_while)
Main work method

The scan_while method takes a block that yields lines above and below the
block. If the yield returns true, the @before_index or @after_index are
modified to include the matched line.

In addition to yielding individual lines, the internals of this object give a
mini DSL to handle common situations such as stopping if we've found a
keyword/end mis-match in one direction or the other.

## stop_after_kw() [](#method-i-stop_after_kw)
Tells `scan_while` to look for mismatched keyword/end-s

When scanning up, if we see more keywords then end-s it will stop. This might
happen when scanning outside of a method body. the first scan line up would be
a keyword and this setting would trigger a stop.

When scanning down, stop if there are more end-s than keywords.

