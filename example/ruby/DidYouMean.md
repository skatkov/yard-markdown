# Module: DidYouMean
    

The `DidYouMean` gem adds functionality to suggest possible method/class names
upon errors such as `NameError` and `NoMethodError`. In Ruby 2.3 or later, it
is automatically activated during startup.

## Disabling `did_you_mean`

Occasionally, you may want to disable the `did_you_mean` gem for e.g.
debugging issues in the error object itself. You can disable it entirely by
specifying `--disable-did_you_mean` option to the `ruby` command:

    $ ruby --disable-did_you_mean -e "1.zeor?"
    -e:1:in `<main>': undefined method `zeor?' for 1:Integer (NameError)

When you do not have direct access to the `ruby` command (e.g. +rails
console+, `irb`), you could applyoptions using the `RUBYOPT` environment
variable:

    $ RUBYOPT='--disable-did_you_mean' irb
    irb:0> 1.zeor?
    # => NoMethodError (undefined method `zeor?' for 1:Integer)

## Getting the original error message

Sometimes, you do not want to disable the gem entirely, but need to get the
original error message without suggestions (e.g. testing). In this case, you
could use the `#original_message` method on the error object:

    no_method_error = begin
                        1.zeor?
                      rescue NoMethodError => error
                        error
                      end

    no_method_error.message
    # => NoMethodError (undefined method `zeor?' for 1:Integer)
    #    Did you mean?  zero?

    no_method_error.original_message
    # => NoMethodError (undefined method `zeor?' for 1:Integer)


**@example**
```ruby

methosd
# => NameError: undefined local variable or method `methosd' for main:Object
#   Did you mean?  methods
#                  method

OBject
# => NameError: uninitialized constant OBject
#    Did you mean?  Object

@full_name = "Yuki Nishijima"
first_name, last_name = full_name.split(" ")
# => NameError: undefined local variable or method `full_name' for main:Object
#    Did you mean?  @full_name

@@full_name = "Yuki Nishijima"
@@full_anme
# => NameError: uninitialized class variable @@full_anme in Object
#    Did you mean?  @@full_name

full_name = "Yuki Nishijima"
full_name.starts_with?("Y")
# => NoMethodError: undefined method `starts_with?' for "Yuki Nishijima":String
#    Did you mean?  start_with?

hash = {foo: 1, bar: 2, baz: 3}
hash.fetch(:fooo)
# => KeyError: key not found: :fooo
#    Did you mean?  :foo
```
# Class Methods
## correct_error(error_class , spell_checker ) [](#method-c-correct_error)
Adds `DidYouMean` functionality to an error using a given spell checker
## formatter() [](#method-c-formatter)
Returns the currently set formatter. By default, it is set to
`DidYouMean::Formatter`.
## formatter=(formatter ) [](#method-c-formatter=)
Updates the primary formatter used to format the suggestions.
## spell_checkers() [](#method-c-spell_checkers)
Returns a sharable hash map of error types and spell checker objects.

