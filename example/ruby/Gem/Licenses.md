# Class: Gem::Licenses
**Inherits:** Object
  
**Extended by:** Gem::Text
    



# Class Methods
## clean_text(text ) [](#method-c-clean_text)
Remove any non-printable characters and make the text suitable for printing.
## deprecated_exception_id?(license ) [](#method-c-deprecated_exception_id?)
**@return** [Boolean] 

## deprecated_license_id?(license ) [](#method-c-deprecated_license_id?)
**@return** [Boolean] 

## format_text(text , wrap , indent 0) [](#method-c-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters
## levenshtein_distance(str1 , str2 ) [](#method-c-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37
## match?(license ) [](#method-c-match?)
**@return** [Boolean] 

## min3(a , b , c ) [](#method-c-min3)
:nodoc:
## suggestions(license ) [](#method-c-suggestions)
## truncate_text(text , description , max_length 100_000) [](#method-c-truncate_text)
**@raise** [ArgumentError] 


