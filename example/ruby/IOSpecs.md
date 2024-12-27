# Module: IOSpecs
    



# Class Methods
## closed_io() [](#method-c-closed_io)
Returns a closed instance of IO that was opened to reference a fixture file
(i.e. the IO instance was perfectly valid at one point but is now closed).
## collector() [](#method-c-collector)
## io_fixture(name , mode "r:utf-8") [](#method-c-io_fixture)
Creates an IO instance for an existing fixture file. The file should obviously
not be deleted.
## io_mock(obj , method , &block ) [](#method-c-io_mock)
Defines `method` on `obj` using the provided `block`. This special helper is
needed for e.g. IO.open specs to avoid mock methods preventing IO#close from
running.
## lines() [](#method-c-lines)
## lines_arbitrary_separator() [](#method-c-lines_arbitrary_separator)
## lines_empty_separator() [](#method-c-lines_empty_separator)
## lines_limit() [](#method-c-lines_limit)
## lines_r_separator() [](#method-c-lines_r_separator)
## lines_space_separator() [](#method-c-lines_space_separator)
## lines_space_separator_limit() [](#method-c-lines_space_separator_limit)
## lines_space_separator_without_trailing_spaces() [](#method-c-lines_space_separator_without_trailing_spaces)
## lines_without_newline_characters() [](#method-c-lines_without_newline_characters)
## paragraphs() [](#method-c-paragraphs)
## paragraphs_without_trailing_new_line_characters() [](#method-c-paragraphs_without_trailing_new_line_characters)
## pipe_fixture(content ) [](#method-c-pipe_fixture)
Creates a pipe-based IO fixture containing the specified contents

