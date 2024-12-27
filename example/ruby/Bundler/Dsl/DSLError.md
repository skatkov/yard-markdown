# Exception: Bundler::Dsl::DSLError
**Inherits:** Bundler::GemfileError
    



# Attributes
## backtrace[RW] [](#attribute-i-backtrace)

**@return** [Exception] the backtrace of the exception raised by the
evaluation of the dsl file.

## description[RW] [](#attribute-i-description)

**@return** [String] the description that should be presented to the user.

## dsl_path[RW] [](#attribute-i-dsl_path)

**@return** [String] the path of the dsl file that raised the exception.


#Instance Methods
## contents() [](#method-i-contents)

**@return** [String] the contents of the DSL that cause the exception to
be raised.

## initialize(description, dsl_path, backtrace, contentsnil) [](#method-i-initialize)

**@param** [Exception] @see backtrace

**@param** [String] @see dsl_path

**@return** [DSLError] a new instance of DSLError

## status_code() [](#method-i-status_code)

## to_s() [](#method-i-to_s)
The message of the exception reports the content of podspec for the line that
generated the original exception.

**@return** [String] the message of the exception.


**@example**
```ruby

Invalid podspec at `RestKit.podspec` - undefined method
`exclude_header_search_paths=' for #<Pod::Specification for
`RestKit/Network (0.9.3)`>

    from spec-repos/master/RestKit/0.9.3/RestKit.podspec:36
    -------------------------------------------
        # because it would break: #import <CoreData/CoreData.h>
 >      ns.exclude_header_search_paths = 'Code/RestKit.h'
      end
    -------------------------------------------
```