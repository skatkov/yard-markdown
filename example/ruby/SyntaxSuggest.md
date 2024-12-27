# Module: SyntaxSuggest
    



# Class Methods
## call(source: , filename: DEFAULT_VALUE, terminal: DEFAULT_VALUE, record_dir: DEFAULT_VALUE, timeout: TIMEOUT_DEFAULT, io: $stderr) [](#method-c-call)
SyntaxSuggest.call [Private]

Main private interface
## handle_error(e , re_raise: true, io: $stderr) [](#method-c-handle_error)
SyntaxSuggest.handle_error [Public]

Takes a `SyntaxError` exception, uses the error message to locate the file.
Then the file will be analyzed to find the location of the syntax error and
emit that location to stderr.

Example:

    begin
      require 'bad_file'
    rescue => e
      SyntaxSuggest.handle_error(e)
    end

By default it will re-raise the exception unless `re_raise: false`. The
message output location can be configured using the `io: $stderr` input.

If a valid filename cannot be determined, the original exception will be
re-raised (even with `re_raise: false`).
## invalid?(source ) [](#method-c-invalid?)
**@return** [Boolean] 

## module_for_detailed_message() [](#method-c-module_for_detailed_message)
SyntaxSuggest.module_for_detailed_message [Private]

Used to monkeypatch SyntaxError via Module.prepend
## record_dir(dir ) [](#method-c-record_dir)
SyntaxSuggest.record_dir [Private]

Used to generate a unique directory to record search steps for debugging
## use_prism_parser?() [](#method-c-use_prism_parser?)
SyntaxSuggest.use_prism_parser? [Private]

Tells us if the prism parser is available for use or if we should fallback to
`Ripper`
**@return** [Boolean] 

## valid?(source ) [](#method-c-valid?)
SyntaxSuggest.valid? [Private]

Returns truthy if a given input source is valid syntax

    SyntaxSuggest.valid?(<<~EOM) # => true
      def foo
      end
    EOM

    SyntaxSuggest.valid?(<<~EOM) # => false
      def foo
        def bar # Syntax error here
      end
    EOM

You can also pass in an array of lines and they'll be joined before evaluating

    SyntaxSuggest.valid?(
      [
        "def foo\n",
        "end\n"
      ]
    ) # => true

    SyntaxSuggest.valid?(
      [
        "def foo\n",
        "  def bar\n", # Syntax error here
        "end\n"
      ]
    ) # => false

As an FYI the CodeLine class instances respond to `to_s` so passing a CodeLine
in as an object or as an array will convert it to it's code representation.
**@return** [Boolean] 

## valid_without?(without_lines: , code_lines: ) [](#method-c-valid_without?)
SyntaxSuggest.valid_without? [Private]

This will tell you if the `code_lines` would be valid if you removed the
`without_lines`. In short it's a way to detect if we've found the lines with
syntax errors in our document yet.

    code_lines = [
      CodeLine.new(line: "def foo\n",   index: 0)
      CodeLine.new(line: "  def bar\n", index: 1)
      CodeLine.new(line: "end\n",       index: 2)
    ]

    SyntaxSuggest.valid_without?(
      without_lines: code_lines[1],
      code_lines: code_lines
    )                                    # => true

    SyntaxSuggest.valid?(code_lines) # => false
**@return** [Boolean] 


