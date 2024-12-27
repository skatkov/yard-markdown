# Module: IRB::NestingParser
    



# Class Methods
## open_tokens(tokens ) [](#method-c-open_tokens)
## parse_by_line(tokens ) [](#method-c-parse_by_line)
Calculates token information [line_tokens, prev_opens, next_opens, min_depth]
for each line. Example code
    ["hello
    world"+(

First line
    line_tokens: [[lbracket, '['], [tstring_beg, '"'], [tstring_content("hello\nworld"), "hello\n"]]
    prev_opens:  []
    next_tokens: [lbracket, tstring_beg]
    min_depth:   0 (minimum at beginning of line)

Second line
    line_tokens: [[tstring_content("hello\nworld"), "world"], [tstring_end, '"'], [op, '+'], [lparen, '(']]
    prev_opens:  [lbracket, tstring_beg]
    next_tokens: [lbracket, lparen]
    min_depth:   1 (minimum just after tstring_end)
## scan_opens(tokens ) [](#method-c-scan_opens)
Scan each token and call the given block with array of token and other
information for parsing

