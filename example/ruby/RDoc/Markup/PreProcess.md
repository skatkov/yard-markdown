# Class: RDoc::Markup::PreProcess
**Inherits:** Object
    

Handle common directives that can occur in a block of text:

    \:include: filename

Directives can be escaped by preceding them with a backslash.

RDoc plugin authors can register additional directives to be handled by using
RDoc::Markup::PreProcess::register.

Any directive that is not built-in to RDoc (including those registered via
plugins) will be stored in the metadata hash on the CodeObject the comment is
attached to.  See RDoc::Markup@Directives for the list of built-in directives.


# Class Methods
## post_process(&block ) [](#method-c-post_process)
Adds a post-process handler for directives.  The handler will be called with
the result RDoc::Comment (or text String) and the code object for the comment
(if any).
## post_processors() [](#method-c-post_processors)
Registered post-processors
## register(directive , &block ) [](#method-c-register)
Registers `directive` as one handled by RDoc.  If a block is given the
directive will be replaced by the result of the block, otherwise the directive
will be removed from the processed text.

The block will be called with the directive name and the directive parameter:

    RDoc::Markup::PreProcess.register 'my-directive' do |directive, param|
      # replace text, etc.
    end
## registered() [](#method-c-registered)
Registered directives
## reset() [](#method-c-reset)
Clears all registered directives and post-processors
# Attributes
## options[RW] [](#attribute-i-options)
An RDoc::Options instance that will be filled in with overrides from
directives


#Instance Methods
## find_include_file(name) [](#method-i-find_include_file)
Look for the given file in the directory containing the current file, and then
in each of the directories specified in the RDOC_INCLUDE path

## handle(text, code_objectnil, &block) [](#method-i-handle)
Look for directives in the given `text`.

Options that we don't handle are yielded.  If the block returns false the
directive is restored to the text.  If the block returns nil or no block was
given the directive is handled according to the registered directives. If a
String was returned the directive is replaced with the string.

If no matching directive was registered the directive is restored to the text.

If `code_object` is given and the directive is unknown then the directive's
parameter is set as metadata on the `code_object`.  See
RDoc::CodeObject#metadata for details.

## handle_directive(prefix, directive, param, code_objectnil, encodingnil, linenil) [](#method-i-handle_directive)
Performs the actions described by `directive` and its parameter `param`.

`code_object` is used for directives that operate on a class or module.
`prefix` is used to ensure the replacement for handled directives is correct. 
`encoding` is used for the `include` directive.

For a list of directives in RDoc see RDoc::Markup. -- When 1.8.7 support is
ditched prefix can be defaulted to ''

## include_file(name, indent, encoding) [](#method-i-include_file)
Handles the `:include: *filename`* directive.

If the first line of the included file starts with '#', and contains an
encoding information in the form 'coding:' or 'coding=', it is removed.

If all lines in the included file start with a '#', this leading '#' is
removed before inclusion. The included content is indented like the
`:include:` directive. -- so all content will be verbatim because of the
likely space after '#'? TODO shift left the whole file content in that case
TODO comment stop/start #-- and #++ in included file must be processed here

## initialize(input_file_name, include_path) [](#method-i-initialize)
Creates a new pre-processor for `input_file_name` that will look for included
files in `include_path`

**@return** [PreProcess] a new instance of PreProcess

