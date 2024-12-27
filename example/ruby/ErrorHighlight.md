# Module: ErrorHighlight
    



# Class Methods
## formatter() [](#method-c-formatter)
## formatter=(formatter ) [](#method-c-formatter=)
## spot(obj , **opts ) [](#method-c-spot)
Identify the code fragment at that a given exception occurred.

Options:

point_type: :name | :args
    :name (default) points the method/variable name that the exception occurred.
    :args points the arguments of the method call that the exception occurred.

backtrace_location: Thread::Backtrace::Location
    It locates the code fragment of the given backtrace_location.
    By default, it uses the first frame of backtrace_locations of the given exception.

Returns:
    {
      first_lineno: Integer,
      first_column: Integer,
      last_lineno: Integer,
      last_column: Integer,
      snippet: String,
      script_lines: [String],
    } | nil

Limitations:

Currently, ErrorHighlight.spot only supports a single-line code fragment.
Therefore, if the return value is not nil, first_lineno and last_lineno will
have the same value. If the relevant code fragment spans multiple lines (e.g.,
Array#[] of +[ary]((newline)expr(newline))+), the method will return nil. This
restriction may be removed in the future.

