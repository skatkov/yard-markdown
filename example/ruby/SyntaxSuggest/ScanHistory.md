# Class: SyntaxSuggest::ScanHistory
**Inherits:** Object
    

Scans up/down from the given block

You can try out a change, stash it, or commit it to save for later

Example:

    scanner = ScanHistory.new(code_lines: code_lines, block: block)
    scanner.scan(
      up: ->(_, _, _) { true },
      down: ->(_, _, _) { true }
    )
    scanner.changed? # => true
    expect(scanner.lines).to eq(code_lines)

    scanner.stash_changes

    expect(scanner.lines).to_not eq(code_lines)


# Attributes
## after_index[RW] [](#attribute-i-after_index)
Returns the value of attribute after_index.

## before_index[RW] [](#attribute-i-before_index)
Returns the value of attribute before_index.


#Instance Methods
## changed?() [](#method-i-changed?)

**@return** [Boolean] 

## commit_if_changed() [](#method-i-commit_if_changed)

## initialize(code_lines:, block:) [](#method-i-initialize)

**@return** [ScanHistory] a new instance of ScanHistory

## lines() [](#method-i-lines)

## next_down() [](#method-i-next_down)

## next_up() [](#method-i-next_up)

## revert_last_commit() [](#method-i-revert_last_commit)
Discard changes that have not been committed and revert the last commit

Cannot revert the first commit

## scan(up:, down:) [](#method-i-scan)
Iterates up and down

Returns line, kw_count, end_count for each iteration

## stash_changes() [](#method-i-stash_changes)
Discards any changes that have not been committed

