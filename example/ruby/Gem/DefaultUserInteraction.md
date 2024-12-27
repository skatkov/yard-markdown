# Module: Gem::DefaultUserInteraction
    
**Includes:** Gem::Text
  

Module that defines the default UserInteraction.  Any class including this
module will have access to the `ui` method that returns the default UI.


# Class Methods
## ui() [](#method-c-ui)
Return the default UI.
## ui=(new_ui ) [](#method-c-ui=)
Set the default UI.  If the default UI is never explicitly set, a simple
console based UserInteraction will be used automatically.
## use_ui(new_ui ) [](#method-c-use_ui)
Use `new_ui` for the duration of `block`.

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

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

