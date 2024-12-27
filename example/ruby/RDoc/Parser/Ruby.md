# Class: RDoc::Parser::Ruby
**Inherits:** RDoc::Parser
    
**Includes:** RDoc::Parser::RubyTools, RDoc::TokenStream
  

Extracts code elements from a source file returning a TopLevel object
containing the constituent file elements.

This file is based on rtags

RubyParser understands how to document:
*   classes
*   modules
*   methods
*   constants
*   aliases
*   private, public, protected
*   private_class_function, public_class_function
*   private_constant, public_constant
*   module_function
*   attr, attr_reader, attr_writer, attr_accessor
*   extra accessors given on the command line
*   metaprogrammed methods
*   require
*   include

## Method Arguments

-- NOTE: I don't think this works, needs tests, remove the paragraph following
this block when known to work

The parser extracts the arguments from the method definition.  You can
override this with a custom argument definition using the :args: directive:

    ##
    # This method tries over and over until it is tired

    def go_go_go(thing_to_try, tries = 10) # :args: thing_to_try
      puts thing_to_try
      go_go_go thing_to_try, tries - 1
    end

If you have a more-complex set of overrides you can use the :call-seq:
directive: ++

The parser extracts the arguments from the method definition.  You can
override this with a custom argument definition using the :call-seq:
directive:

    ##
    # This method can be called with a range or an offset and length
    #
    # :call-seq:
    #   my_method(Range)
    #   my_method(offset, length)

    def my_method(*args)
    end

The parser extracts `yield` expressions from method bodies to gather the
yielded argument names.  If your method manually calls a block instead of
yielding or you want to override the discovered argument names use the
:yields: directive:

    ##
    # My method is awesome

    def my_method(&block) # :yields: happy, times
      block.call 1, 2
    end

## Metaprogrammed Methods

To pick up a metaprogrammed method, the parser looks for a comment starting
with '##' before an identifier:

    ##
    # This is a meta-programmed method!

    add_my_method :meta_method, :arg1, :arg2

The parser looks at the token after the identifier to determine the name, in
this example, :meta_method.  If a name cannot be found, a warning is printed
and 'unknown is used.

You can force the name of a method using the :method: directive:

    ##
    # :method: some_method!

By default, meta-methods are instance methods.  To indicate that a method is a
singleton method instead use the :singleton-method: directive:

    ##
    # :singleton-method:

You can also use the :singleton-method: directive with a name:

    ##
    # :singleton-method: some_method!

You can define arguments for metaprogrammed methods via either the :call-seq:,
:arg: or :args: directives.

Additionally you can mark a method as an attribute by using :attr:,
:attr_reader:, :attr_writer: or :attr_accessor:.  Just like for :method:, the
name is optional.

    ##
    # :attr_reader: my_attr_name

## Hidden methods and attributes

You can provide documentation for methods that don't appear using the
:method:, :singleton-method: and :attr: directives:

    ##
    # :attr_writer: ghost_writer
    # There is an attribute here, but you can't see it!

    ##
    # :method: ghost_method
    # There is a method here, but you can't see it!

    ##
    # this is a comment for a regular method

    def regular_method() end

Note that by default, the :method: directive will be ignored if there is a
standard rdocable item following it.



#Instance Methods
## add_token(token) [](#method-i-add_token)
Adds one `token` to the collected tokens

## add_token_listener(obj) [](#method-i-add_token_listener)
Adds a token listener `obj`, but you should probably use token_listener

## add_tokens(tokens) [](#method-i-add_tokens)
Adds `tokens` to the collected tokens

## collect_first_comment() [](#method-i-collect_first_comment)
Look for the first comment in a file that isn't a shebang line.

## collect_tokens() [](#method-i-collect_tokens)
Starts collecting tokens

## consume_trailing_spaces() [](#method-i-consume_trailing_spaces)
Consumes trailing whitespace from the token stream

## create_attr(container, single, name, rw, comment) [](#method-i-create_attr)
Creates a new attribute in `container` with `name`.

## create_module_alias(container, constant, rhs_name) [](#method-i-create_module_alias)
Creates a module alias in `container` at `rhs_name` (or at the top-level for
"::") with the name from `constant`.

## error(msg) [](#method-i-error)
Aborts with `msg`

## get_bool() [](#method-i-get_bool)
Looks for a true or false token.

## get_class_or_module(container, ignore_constantsfalse) [](#method-i-get_class_or_module)
Look for the name of a class of module (optionally with a leading
:   or

with
:   separated named) and return the ultimate name, the associated

container, and the given name (with the ::).

## get_class_specification() [](#method-i-get_class_specification)
Return a superclass, which can be either a constant of an expression

## get_constant() [](#method-i-get_constant)
Parse a constant, which might be qualified by one or more class or module
names

## get_end_token(tk) [](#method-i-get_end_token)
Little hack going on here. In the statement:

    f = 2*(1+yield)

We see the RPAREN as the next token, so we need to exit early.  This still
won't catch all cases (such as "a = yield + 1"

## get_included_module_with_optional_parens() [](#method-i-get_included_module_with_optional_parens)
Get an included module that may be surrounded by parens

## get_method_container(container, name_t) [](#method-i-get_method_container)
Retrieves the method container for a singleton method.

## get_symbol_or_name() [](#method-i-get_symbol_or_name)
Extracts a name or symbol from the token stream.

## get_tk() [](#method-i-get_tk)
Fetches the next token from the scanner

## get_tk_until(*tokens) [](#method-i-get_tk_until)
Reads and returns all tokens up to one of `tokens`.  Leaves the matched token
in the token list.

## get_tkread() [](#method-i-get_tkread)
Retrieves a String representation of the read tokens

## get_tkread_clean(pattern, replacement) [](#method-i-get_tkread_clean)
Retrieves the read token stream and replaces `pattern` with `replacement`
using gsub.  If the result is only a ";" returns an empty string.

## get_visibility_information(tk, single) [](#method-i-get_visibility_information)
Extracts the visibility information for the visibility token `tk` and `single`
class type identifier.

Returns the visibility type (a string), the visibility (a symbol) and
`singleton` if the methods following should be converted to singleton methods.

## initialize(top_level, file_name, content, options, stats) [](#method-i-initialize)
Creates a new Ruby parser.

**@return** [Ruby] a new instance of Ruby

## look_for_directives_in(container, comment) [](#method-i-look_for_directives_in)
Look for directives in a normal comment block:

    # :stopdoc:
    # Don't display comment from this point forward

This routine modifies its `comment` parameter.

## make_message(message) [](#method-i-make_message)
Adds useful info about the parser to `message`

## new_comment(comment, line_nonil) [](#method-i-new_comment)
Creates a comment with the correct format

## parse_alias(context, single, tk, comment) [](#method-i-parse_alias)
Parses an `alias` in `context` with `comment`

## parse_attr(context, single, tk, comment) [](#method-i-parse_attr)
Creates an RDoc::Attr for the name following `tk`, setting the comment to
`comment`.

## parse_attr_accessor(context, single, tk, comment) [](#method-i-parse_attr_accessor)
Creates an RDoc::Attr for each attribute listed after `tk`, setting the
comment for each to `comment`.

## parse_call_parameters(tk) [](#method-i-parse_call_parameters)
Extracts call parameters from the token stream.

## parse_class(container, single, tk, comment) [](#method-i-parse_class)
Parses a class in `context` with `comment`

## parse_class_regular(container, declaration_context, single, name_t, given_name, comment) [](#method-i-parse_class_regular)
Parses and creates a regular class

## parse_class_singleton(container, name, comment) [](#method-i-parse_class_singleton)
Parses a singleton class in `container` with the given `name` and `comment`.

## parse_comment(container, tk, comment) [](#method-i-parse_comment)
Generates an RDoc::Method or RDoc::Attr from `comment` by looking for :method:
or :attr: directives in `comment`.

## parse_comment_attr(container, type, name, comment) [](#method-i-parse_comment_attr)
Parse a comment that is describing an attribute in `container` with the given
`name` and `comment`.

## parse_comment_ghost(container, text, name, column, line_no, comment) [](#method-i-parse_comment_ghost)
:nodoc:

## parse_comment_tomdoc(container, tk, comment) [](#method-i-parse_comment_tomdoc)
Creates an RDoc::Method on `container` from `comment` if there is a Signature
section in the comment

## parse_constant(container, tk, comment, ignore_constantsfalse) [](#method-i-parse_constant)
Parses a constant in `context` with `comment`.  If `ignore_constants` is true,
no found constants will be added to RDoc.

## parse_constant_body(container, constant, is_array_or_hash) [](#method-i-parse_constant_body)
:nodoc:

## parse_constant_visibility(container, single, tk) [](#method-i-parse_constant_visibility)
Parses a Module#private_constant or Module#public_constant call from `tk`.

## parse_extend_or_include(klass, container, comment) [](#method-i-parse_extend_or_include)
Parses an `include` or `extend`, indicated by the `klass` and adds it to
`container` # with `comment`

## parse_identifier(container, single, tk, comment) [](#method-i-parse_identifier)
Parses identifiers that can create new methods or change visibility.

Returns true if the comment was not consumed.

## parse_included_with_activesupport_concern(container, comment) [](#method-i-parse_included_with_activesupport_concern)
Parses an `included` with a block feature of ActiveSupport::Concern.

## parse_meta_attr(context, single, tk, comment) [](#method-i-parse_meta_attr)
Parses a meta-programmed attribute and creates an RDoc::Attr.

To create foo and bar attributes on class C with comment "My attributes":

    class C

      ##
      # :attr:
      #
      # My attributes

      my_attr :foo, :bar

    end

To create a foo attribute on class C with comment "My attribute":

    class C

      ##
      # :attr: foo
      #
      # My attribute

      my_attr :foo, :bar

    end

## parse_meta_method(container, single, tk, comment) [](#method-i-parse_meta_method)
Parses a meta-programmed method

## parse_meta_method_name(comment, tk) [](#method-i-parse_meta_method_name)
Parses the name of a metaprogrammed method.  `comment` is used to determine
the name while `tk` is used in an error message if the name cannot be
determined.

## parse_meta_method_params(container, single, meth, tk, comment) [](#method-i-parse_meta_method_params)
Parses the parameters and block for a meta-programmed method.

## parse_method(container, single, tk, comment) [](#method-i-parse_method)
Parses a normal method defined by `def`

## parse_method_dummy(container) [](#method-i-parse_method_dummy)
Parses a method that needs to be ignored.

## parse_method_name(container) [](#method-i-parse_method_name)
Parses the name of a method in `container`.

Returns the method name, the container it is in (for def Foo.name) and if it
is a singleton or regular method.

## parse_method_name_regular(container, name_t) [](#method-i-parse_method_name_regular)
For the given `container` and initial name token `name_t` the method name is
parsed from the token stream for a regular method.

## parse_method_name_singleton(container, name_t) [](#method-i-parse_method_name_singleton)
For the given `container` and initial name token `name_t` the method name and
the new `container` (if necessary) are parsed from the token stream for a
singleton method.

## parse_method_or_yield_parameters(methodnil, modifiersRDoc::METHOD_MODIFIERS) [](#method-i-parse_method_or_yield_parameters)
Extracts `yield` parameters from `method`

## parse_method_parameters(method) [](#method-i-parse_method_parameters)
Capture the method's parameters. Along the way, look for a comment containing:

    # yields: ....

and add this as the block_params for the method

## parse_method_params_and_body(container, single, meth, added_container) [](#method-i-parse_method_params_and_body)
Parses the parameters and body of `meth`

## parse_module(container, single, tk, comment) [](#method-i-parse_module)
Parses an RDoc::NormalModule in `container` with `comment`

## parse_require(context, comment) [](#method-i-parse_require)
Parses an RDoc::Require in `context` containing `comment`

## parse_rescue() [](#method-i-parse_rescue)
Parses a rescue

## parse_statements(container, singleNORMAL, current_methodnil, commentnew_comment('')) [](#method-i-parse_statements)
The core of the Ruby parser.

## parse_symbol_arg(nonil) [](#method-i-parse_symbol_arg)
Parse up to `no` symbol arguments

## parse_symbol_arg_paren(no) [](#method-i-parse_symbol_arg_paren)
Parses up to `no` symbol arguments surrounded by () and places them in `args`.

## parse_symbol_arg_space(no, tk) [](#method-i-parse_symbol_arg_space)
Parses up to `no` symbol arguments separated by spaces and places them in
`args`.

## parse_symbol_in_arg() [](#method-i-parse_symbol_in_arg)
Returns symbol text from the next token

## parse_top_level_statements(container) [](#method-i-parse_top_level_statements)
Parses statements in the top-level `container`

## parse_visibility(container, single, tk) [](#method-i-parse_visibility)
Determines the visibility in `container` from `tk`

## parse_yield(context, single, tk, method) [](#method-i-parse_yield)
Determines the block parameter for `context`

## peek_read() [](#method-i-peek_read)
Peek equivalent for get_tkread

## peek_tk() [](#method-i-peek_tk)
Peek at the next token, but don't remove it from the stream

## pop_token() [](#method-i-pop_token)
Remove the last token from the collected tokens

## read_directive(allowed) [](#method-i-read_directive)
Directives are modifier comments that can appear after class, module, or
method names. For example:

    def fred # :yields: a, b

or:

    class MyClass # :nodoc:

We return the directive name and any parameters as a two element array if the
name is in `allowed`.  A directive can be found anywhere up to the end of the
current line.

## read_documentation_modifiers(context, allowed) [](#method-i-read_documentation_modifiers)
Handles directives following the definition for `context` (any
RDoc::CodeObject) if the directives are `allowed` at this point.

See also RDoc::Markup::PreProcess#handle_directive

## record_location(container) [](#method-i-record_location)
Records the location of this `container` in the file for this parser and adds
it to the list of classes and modules in the file.

## remove_token_listener(obj) [](#method-i-remove_token_listener)
Removes the token listener `obj`

## reset() [](#method-i-reset)
Resets the tools

## retrieve_comment_body(tk) [](#method-i-retrieve_comment_body)
Retrieve comment body without =begin/=end

## scan() [](#method-i-scan)
Scans this Ruby file for Ruby constructs

## skip_for_variable() [](#method-i-skip_for_variable)
skip the var [in] part of a 'for' statement

## skip_method(container) [](#method-i-skip_method)
Skips the next method in `container`

## skip_optional_do_after_expression() [](#method-i-skip_optional_do_after_expression)
while, until, and for have an optional do

## skip_parentheses(&block) [](#method-i-skip_parentheses)
Skip opening parentheses and yield the block. Skip closing parentheses too
when exists.

## skip_tkspace() [](#method-i-skip_tkspace)
Skips whitespace tokens including newlines

## skip_tkspace_comment(skip_nltrue) [](#method-i-skip_tkspace_comment)
Skip spaces until a comment is found

## skip_tkspace_without_nl() [](#method-i-skip_tkspace_without_nl)
Skips whitespace tokens excluding newlines

## suppress_parents(container, ancestor) [](#method-i-suppress_parents)
Marks containers between `container` and `ancestor` as ignored

## tk_nl?(tk) [](#method-i-tk_nl?)
Return `true` if `tk` is a newline.

**@return** [Boolean] 

## token_listener(obj) [](#method-i-token_listener)
Has `obj` listen to tokens

## token_stream() [](#method-i-token_stream)
Current token stream

## tokens_to_s() [](#method-i-tokens_to_s)
Returns a string representation of the token stream

## unget_tk(tk) [](#method-i-unget_tk)
Returns `tk` to the scanner

## update_visibility(container, vis_type, vis, singleton) [](#method-i-update_visibility)
Updates visibility in `container` from `vis_type` and `vis`.

## warn(message) [](#method-i-warn)
Prints `message` to +$stderr+ unless we're being quiet

