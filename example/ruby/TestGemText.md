# Class: TestGemText
**Inherits:** Gem::TestCase
    
**Includes:** Gem::Text
  




#Instance Methods
## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## test_clean_text() [](#method-i-test_clean_text)

## test_format_removes_nonprintable_characters() [](#method-i-test_format_removes_nonprintable_characters)

## test_format_text() [](#method-i-test_format_text)

## test_format_text_indent() [](#method-i-test_format_text_indent)

## test_format_text_no_space() [](#method-i-test_format_text_no_space)

## test_format_text_none() [](#method-i-test_format_text_none)

## test_format_text_none_indent() [](#method-i-test_format_text_none_indent)

## test_format_text_trailing() [](#method-i-test_format_text_trailing)
for two spaces after .

## test_levenshtein_distance_add() [](#method-i-test_levenshtein_distance_add)

## test_levenshtein_distance_all() [](#method-i-test_levenshtein_distance_all)

## test_levenshtein_distance_empty() [](#method-i-test_levenshtein_distance_empty)

## test_levenshtein_distance_remove() [](#method-i-test_levenshtein_distance_remove)

## test_levenshtein_distance_replace() [](#method-i-test_levenshtein_distance_replace)

## test_min3() [](#method-i-test_min3)

## test_truncate_text() [](#method-i-test_truncate_text)

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

