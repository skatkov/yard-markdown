# Class: RDoc::AnyMethod
**Inherits:** RDoc::MethodAttr
    
**Includes:** RDoc::TokenStream
  

AnyMethod is the base class for objects representing methods


# Attributes
## c_function[RW] [](#attribute-i-c_function)
The C function that implements this method (if it was defined in a C file)

## calls_super[RW] [](#attribute-i-calls_super)
If true this method uses `super` to call a superclass version

## dont_rename_initialize[RW] [](#attribute-i-dont_rename_initialize)
Don't rename #initialize to ::new

## params[RW] [](#attribute-i-params)
Parameters for this method

## section_title[RW] [](#attribute-i-section_title)
The section title of the method (if defined in a C file via `:category:`)


#Instance Methods
## add_alias(an_alias, contextnil) [](#method-i-add_alias)
Adds `an_alias` as an alias for this method in `context`.

## add_token(token) [](#method-i-add_token)
Adds one `token` to the collected tokens

## add_tokens(tokens) [](#method-i-add_tokens)
Adds `tokens` to the collected tokens

## aref_prefix() [](#method-i-aref_prefix)
Prefix for `aref` is 'method'.

## arglists() [](#method-i-arglists)
The call_seq or the param_seq with method name, if there is no call_seq.

Use this for displaying a method's argument lists.

## call_seq() [](#method-i-call_seq)
Different ways to call this method

## call_seq=(call_seq) [](#method-i-call_seq=)
Sets the different ways you can call this method.  If an empty `call_seq` is
given nil is assumed.

See also #param_seq

## collect_tokens() [](#method-i-collect_tokens)
Starts collecting tokens

## has_call_seq?() [](#method-i-has_call_seq?)
Whether the method has a call-seq.

**@return** [Boolean] 

## initialize(text, name) [](#method-i-initialize)
Creates a new AnyMethod with a token stream `text` and `name`

**@return** [AnyMethod] a new instance of AnyMethod

## is_alias_for() [](#method-i-is_alias_for)
Loads is_alias_for from the internal name.  Returns nil if the alias cannot be
found.

## marshal_dump() [](#method-i-marshal_dump)
Dumps this AnyMethod for use by ri.  See also #marshal_load

## marshal_load(array) [](#method-i-marshal_load)
Loads this AnyMethod from `array`.  For a loaded AnyMethod the following
methods will return cached values:

*   #full_name
*   #parent_name

## name() [](#method-i-name)
Method name

If the method has no assigned name, it extracts it from #call_seq.

## param_list() [](#method-i-param_list)
A list of this method's method and yield parameters.  `call-seq` params are
preferred over parsed method and block params.

## param_seq() [](#method-i-param_seq)
Pretty parameter list for this method.  If the method's parameters were given
by `call-seq` it is preferred over the parsed values.

## pop_token() [](#method-i-pop_token)
Remove the last token from the collected tokens

## skip_description?() [](#method-i-skip_description?)
Whether to skip the method description, true for methods that have aliases
with a call-seq that doesn't include the method name.

**@return** [Boolean] 

## store=(store) [](#method-i-store=)
Sets the store for this method and its referenced code objects.

## superclass_method() [](#method-i-superclass_method)
For methods that `super`, find the superclass method that would be called.

## token_stream() [](#method-i-token_stream)
Current token stream

## tokens_to_s() [](#method-i-tokens_to_s)
Returns a string representation of the token stream

