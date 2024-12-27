# Class: ENV
**Inherits:** Object
    

`ENV` is a hash-like accessor for environment variables.

### Interaction with the Operating System

The `ENV` object interacts with the operating system's environment variables:

*   When you get the value for a name in `ENV`, the value is retrieved from
    among the current environment variables.
*   When you create or set a name-value pair in `ENV`, the name and value are
    immediately set in the environment variables.
*   When you delete a name-value pair in `ENV`, it is immediately deleted from
    the environment variables.

### Names and Values

Generally, a name or value is a String.

#### Valid Names and Values

Each name or value must be one of the following:

*   A String.
*   An object that responds to #to_str by returning a String, in which case
    that String will be used as the name or value.

#### Invalid Names and Values

A new name:

*   May not be the empty string:
        ENV[''] = '0'
        # Raises Errno::EINVAL (Invalid argument - ruby_setenv())

*   May not contain character `"="`:
        ENV['='] = '0'
        # Raises Errno::EINVAL (Invalid argument - ruby_setenv(=))

A new name or value:

*   May not be a non-String that does not respond to #to_str:

        ENV['foo'] = Object.new
        # Raises TypeError (no implicit conversion of Object into String)
        ENV[Object.new] = '0'
        # Raises TypeError (no implicit conversion of Object into String)

*   May not contain the NUL character `"\0"`:

        ENV['foo'] = "\0"
        # Raises ArgumentError (bad environment variable value: contains null byte)
        ENV["\0"] == '0'
        # Raises ArgumentError (bad environment variable name: contains null byte)

*   May not have an ASCII-incompatible encoding such as UTF-16LE or
    ISO-2022-JP:

        ENV['foo'] = '0'.force_encoding(Encoding::ISO_2022_JP)
        # Raises ArgumentError (bad environment variable name: ASCII incompatible encoding: ISO-2022-JP)
        ENV["foo".force_encoding(Encoding::ISO_2022_JP)] = '0'
        # Raises ArgumentError (bad environment variable name: ASCII incompatible encoding: ISO-2022-JP)

### About Ordering

`ENV` enumerates its name/value pairs in the order found in the operating
system's environment variables. Therefore the ordering of `ENV` content is
OS-dependent, and may be indeterminate.

This will be seen in:
*   A Hash returned by an `ENV` method.
*   An Enumerator returned by an `ENV` method.
*   An Array returned by ENV.keys, ENV.values, or ENV.to_a.
*   The String returned by ENV.inspect.
*   The Array returned by ENV.shift.
*   The name returned by ENV.key.

### About the Examples
Some methods in `ENV` return `ENV` itself. Typically, there are many
environment variables. It's not useful to display a large `ENV` in the
examples here, so most example snippets begin by resetting the contents of
`ENV`:
*   ENV.replace replaces `ENV` with a new collection of entries.
*   ENV.clear empties `ENV`.

### What's Here

First, what's elsewhere. Class `ENV`:

*   Inherits from [class Object](rdoc-ref:Object@What-27s+Here).
*   Extends [module Enumerable](rdoc-ref:Enumerable@What-27s+Here),

Here, class `ENV` provides methods that are useful for:

*   [Querying](rdoc-ref:ENV@Methods+for+Querying)
*   [Assigning](rdoc-ref:ENV@Methods+for+Assigning)
*   [Deleting](rdoc-ref:ENV@Methods+for+Deleting)
*   [Iterating](rdoc-ref:ENV@Methods+for+Iterating)
*   [Converting](rdoc-ref:ENV@Methods+for+Converting)
*   [And more ....](rdoc-ref:ENV@More+Methods)

#### Methods for Querying

*   ::[]: Returns the value for the given environment variable name if it
    exists:
*   ::empty?: Returns whether `ENV` is empty.
*   ::has_value?, ::value?: Returns whether the given value is in `ENV`.
*   ::include?, ::has_key?, ::key?, ::member?: Returns whether the given name
        is in +ENV+.

*   ::key: Returns the name of the first entry with the given value.
*   ::size, ::length: Returns the number of entries.
*   ::value?: Returns whether any entry has the given value.

#### Methods for Assigning

*   ::[]=, ::store: Creates, updates, or deletes the named environment
    variable.
*   ::clear: Removes every environment variable; returns `ENV`:
*   ::update, ::merge!: Adds to `ENV` each key/value pair in the given hash.
*   ::replace: Replaces the entire content of the `ENV` with the name/value
    pairs in the given hash.

#### Methods for Deleting

*   ::delete: Deletes the named environment variable name if it exists.
*   ::delete_if: Deletes entries selected by the block.
*   ::keep_if: Deletes entries not selected by the block.
*   ::reject!: Similar to #delete_if, but returns `nil` if no change was made.
*   ::select!, ::filter!: Deletes entries selected by the block.
*   ::shift: Removes and returns the first entry.

#### Methods for Iterating

*   ::each, ::each_pair: Calls the block with each name/value pair.
*   ::each_key: Calls the block with each name.
*   ::each_value: Calls the block with each value.

#### Methods for Converting

*   ::assoc: Returns a 2-element array containing the name and value of the
    named environment variable if it exists:
*   ::clone: Returns `ENV` (and issues a warning).
*   ::except: Returns a hash of all name/value pairs except those given.
*   ::fetch: Returns the value for the given name.
*   ::inspect: Returns the contents of `ENV` as a string.
*   ::invert: Returns a hash whose keys are the `ENV` values,
        and whose values are the corresponding +ENV+ names.

*   ::keys: Returns an array of all names.
*   ::rassoc: Returns the name and value of the first found entry that has the
    given value.
*   ::reject: Returns a hash of those entries not rejected by the block.
*   ::select, ::filter: Returns a hash of name/value pairs selected by the
    block.
*   ::slice: Returns a hash of the given names and their corresponding values.
*   ::to_a: Returns the entries as an array of 2-element Arrays.
*   ::to_h: Returns a hash of entries selected by the block.
*   ::to_hash: Returns a hash of all entries.
*   ::to_s: Returns the string `'ENV'`.
*   ::values: Returns all values as an array.
*   ::values_at: Returns an array of the values for the given name.

#### More Methods

*   ::dup: Raises an exception.
*   ::freeze: Raises an exception.
*   ::rehash: Returns `nil`, without modifying `ENV`.


# Class Methods
## pretty_print(q ) [](#method-c-pretty_print)
:nodoc:

