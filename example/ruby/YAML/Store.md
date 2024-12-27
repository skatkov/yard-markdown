# Class: YAML::Store
**Inherits:** PStore
    

YAML::Store provides the same functionality as PStore, except it uses YAML to
dump objects instead of Marshal.

## Example

    require 'yaml/store'

    Person = Struct.new :first_name, :last_name

    people = [Person.new("Bob", "Smith"), Person.new("Mary", "Johnson")]

    store = YAML::Store.new "test.store"

    store.transaction do
      store["people"] = people
      store["greeting"] = { "hello" => "world" }
    end

After running the above code, the contents of "test.store" will be:

    ---
    people:
    - !ruby/struct:Person
      first_name: Bob
      last_name: Smith
    - !ruby/struct:Person
      first_name: Mary
      last_name: Johnson
    greeting:
      hello: world



#Instance Methods
## dump(table) [](#method-i-dump)
:stopdoc:

## empty_marshal_checksum() [](#method-i-empty_marshal_checksum)

## empty_marshal_data() [](#method-i-empty_marshal_data)

## initialize(*o) [](#method-i-initialize)
:call-seq:
    initialize( file_name, yaml_opts = {} )
    initialize( file_name, thread_safe = false, yaml_opts = {} )

Creates a new YAML::Store object, which will store data in `file_name`. If the
file does not already exist, it will be created.

YAML::Store objects are always reentrant. But if *thread_safe* is set to true,
then it will become thread-safe at the cost of a minor performance hit.

Options passed in through `yaml_opts` will be used when converting the store
to YAML via Hash#to_yaml().

**@return** [Store] a new instance of Store

## load(content) [](#method-i-load)

## marshal_dump_supports_canonical_option?() [](#method-i-marshal_dump_supports_canonical_option?)

**@return** [Boolean] 

## old_load() [](#method-i-old_load)

