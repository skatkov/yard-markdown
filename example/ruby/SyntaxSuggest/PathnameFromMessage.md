# Class: SyntaxSuggest::PathnameFromMessage
**Inherits:** Object
    

Converts a SyntaxError message to a path

Handles the case where the filename has a colon in it such as on a windows
file system: https://github.com/ruby/syntax_suggest/issues/111

Example:

    message = "/tmp/scratch:2:in `require_relative': /private/tmp/bad.rb:1: syntax error, unexpected `end' (SyntaxError)"
    puts PathnameFromMessage.new(message).call.name
    # => "/tmp/scratch.rb"


# Attributes
## name[RW] [](#attribute-i-name)
Returns the value of attribute name.


#Instance Methods
## call() [](#method-i-call)

## initialize(message, io:$stderr) [](#method-i-initialize)

**@return** [PathnameFromMessage] a new instance of PathnameFromMessage

## skip_missing_file_name?() [](#method-i-skip_missing_file_name?)

**@return** [Boolean] 

## stop?() [](#method-i-stop?)

**@return** [Boolean] 

