# Class: RDoc::Parser::PrismRuby
**Inherits:** RDoc::Parser
    

Parse and collect document from Ruby source code. RDoc::Parser::PrismRuby is
compatible with RDoc::Parser::Ruby and aims to replace it.


# Attributes
## container[RW] [](#attribute-i-container)
Returns the value of attribute container.

## singleton[RW] [](#attribute-i-singleton)
Returns the value of attribute singleton.

## visibility[RW] [](#attribute-i-visibility)
Returns the value of attribute visibility.


#Instance Methods
## add_alias_method(old_name, new_name, line_no) [](#method-i-add_alias_method)
Handles `alias foo bar` and `alias_method :foo, :bar`

## add_attributes(names, rw, line_no) [](#method-i-add_attributes)
Handles `attr :a, :b`, `attr_reader :a, :b`, `attr_writer :a, :b` and
`attr_accessor :a, :b`

## add_constant(constant_name, rhs_name, start_line, end_line) [](#method-i-add_constant)
Adds a constant

## add_extends(names, line_no) [](#method-i-add_extends)
Handle `extend Foo, Bar`

## add_includes(names, line_no) [](#method-i-add_includes)
Handle `include Foo, Bar`

## add_includes_extends(names, rdoc_class, line_no) [](#method-i-add_includes_extends)
:nodoc:

## add_method(name, receiver_name:, receiver_fallback_type:, visibility:, singleton:, params:, calls_super:, block_params:, tokens:, start_line:, end_line:) [](#method-i-add_method)
Adds a method defined by `def` syntax

## add_module_or_class(module_name, start_line, end_line, is_class:false, superclass_name:nil) [](#method-i-add_module_or_class)
Adds module or class

## call_node_name_arguments(call_node) [](#method-i-call_node_name_arguments)
:nodoc:

## change_method_to_module_function(names) [](#method-i-change_method_to_module_function)
Handles `module_function :foo, :bar`

## change_method_visibility(names, visibility, singleton:@singleton) [](#method-i-change_method_visibility)
Handles `public :foo, :bar` `private :foo, :bar` and `protected :foo, :bar`

## consecutive_comment(line_no) [](#method-i-consecutive_comment)
Returns consecutive comment linked to the given line number

## file_line_comment_token(line_no) [](#method-i-file_line_comment_token)
:nodoc:

## find_or_create_constant_owner_name(constant_path) [](#method-i-find_or_create_constant_owner_name)
Returns a pair of owner module and constant name from a given constant path.
Creates owner module if it does not exist.

## find_or_create_module_path(module_name, create_mode) [](#method-i-find_or_create_module_path)
Find or create module or class from a given module name. If module or class
does not exist, creates a module or a class according to `create_mode`
argument.

## handle_consecutive_comment_directive(code_object, comment) [](#method-i-handle_consecutive_comment_directive)
:nodoc:

## handle_meta_method_comment(comment, node) [](#method-i-handle_meta_method_comment)
Handles meta method comments

## handle_modifier_directive(code_object, line_no) [](#method-i-handle_modifier_directive)
:nodoc:

## handle_standalone_consecutive_comment_directive(comment, line_no, start_line) [](#method-i-handle_standalone_consecutive_comment_directive)
:nodoc:

## initialize(top_level, file_name, content, options, stats) [](#method-i-initialize)

**@return** [PrismRuby] a new instance of PrismRuby

## normal_comment_treat_as_ghost_method_for_now?(comment_text, line_no) [](#method-i-normal_comment_treat_as_ghost_method_for_now?)
:nodoc:

**@return** [Boolean] 

## parse_comment_tomdoc(container, comment, line_no, start_line) [](#method-i-parse_comment_tomdoc)
Creates an RDoc::Method on `container` from `comment` if there is a Signature
section in the comment

## prepare_comments(comments) [](#method-i-prepare_comments)
Prepares comments for processing. Comments are grouped into consecutive.
Consecutive comment is linked to the next non-blank line.

Example:
    01| class A # modifier comment 1
    02|   def foo; end # modifier comment 2
    03|
    04|   # consecutive comment 1 start_line: 4
    05|   # consecutive comment 1 linked to line: 7
    06|
    07|   # consecutive comment 2 start_line: 7
    08|   # consecutive comment 2 linked to line: 10
    09|
    10|   def bar; end # consecutive comment 2 linked to this line
    11| end

## prepare_line_nodes(node) [](#method-i-prepare_line_nodes)
Assign AST node to a line. This is used to show meta-method source code in the
documentation.

## process_comments_until(line_no_until) [](#method-i-process_comments_until)
Processes consecutive comments that were not linked to any documentable code
until the given line number

## record_location(container) [](#method-i-record_location)
Records the location of this `container` in the file for this parser and adds
it to the list of classes and modules in the file.

## resolve_constant_path(constant_path) [](#method-i-resolve_constant_path)
Resolves constant path to a full path by searching module nesting

## scan() [](#method-i-scan)
Scans this Ruby file for Ruby constructs

## should_document?(code_object) [](#method-i-should_document?)
:nodoc:

**@return** [Boolean] 

## skip_comments_until(line_no_until) [](#method-i-skip_comments_until)
Skips all undocumentable consecutive comments until the given line number.
Undocumentable comments are comments written inside `def` or inside
undocumentable class/module

## slice_tokens(start_pos, end_pos) [](#method-i-slice_tokens)
:nodoc:

## visible_tokens_from_location(location) [](#method-i-visible_tokens_from_location)
Returns tokens from the given location

## with_container(container, singleton:false) [](#method-i-with_container)
Dive into another container

