# Class: Gem::StreamUI::SimpleProgressReporter
**Inherits:** Object
    
**Includes:** Gem::DefaultUserInteraction
  

A basic dotted progress reporter.


# Attributes
## count[RW] [](#attribute-i-count)
The number of progress items counted so far.


#Instance Methods
## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## done() [](#method-i-done)
Prints out the terminal message.

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## initialize(out_stream, size, initial_message, terminal_message"complete") [](#method-i-initialize)
Creates a new progress reporter that will write to `out_stream` for `size`
items.  Shows the given `initial_message` when progress starts and the
`terminal_message` when it is complete.

**@return** [SimpleProgressReporter] a new instance of SimpleProgressReporter

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

## updated(message) [](#method-i-updated)
Prints out a dot and ignores `message`.

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

