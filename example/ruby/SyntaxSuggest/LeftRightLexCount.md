# Class: SyntaxSuggest::LeftRightLexCount
**Inherits:** Object
    

Find mis-matched syntax based on lexical count

Used for detecting missing pairs of elements each keyword needs an end, each
'{' needs a '}' etc.

Example:

    left_right = LeftRightLexCount.new
    left_right.count_kw
    left_right.missing.first
    # => "end"

    left_right = LeftRightLexCount.new
    source = "{ a: b, c: d" # Note missing '}'
    LexAll.new(source: source).each do |lex|
      left_right.count_lex(lex)
    end
    left_right.missing.first
    # => "}"



#Instance Methods
## count_end() [](#method-i-count_end)

## count_for_char(char) [](#method-i-count_for_char)

## count_kw() [](#method-i-count_kw)

## count_lex(lex) [](#method-i-count_lex)
Count source code characters

Example:

    left_right = LeftRightLexCount.new
    left_right.count_lex(LexValue.new(1, :on_lbrace, "{", Ripper::EXPR_BEG))
    left_right.count_for_char("{")
    # => 1
    left_right.count_for_char("}")
    # => 0

## initialize() [](#method-i-initialize)

**@return** [LeftRightLexCount] a new instance of LeftRightLexCount

## missing() [](#method-i-missing)
Returns an array of missing syntax characters or `"end"` or `"keyword"`

    left_right.missing
    # => ["}"]

