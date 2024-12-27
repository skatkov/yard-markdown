# Class: OpenStruct
**Inherits:** Object
    

An OpenStruct is a data structure, similar to a Hash, that allows the
definition of arbitrary attributes with their accompanying values. This is
accomplished by using Ruby's metaprogramming to define methods on the class
itself.

## Examples

    require "ostruct"

    person = OpenStruct.new
    person.name = "John Smith"
    person.age  = 70

    person.name      # => "John Smith"
    person.age       # => 70
    person.address   # => nil

An OpenStruct employs a Hash internally to store the attributes and values and
can even be initialized with one:

    australia = OpenStruct.new(:country => "Australia", :capital => "Canberra")
      # => #<OpenStruct country="Australia", capital="Canberra">

Hash keys with spaces or characters that could normally not be used for method
calls (e.g. `()[]*`) will not be immediately available on the OpenStruct
object as a method for retrieval or assignment, but can still be reached
through the Object#send method or using [].

    measurements = OpenStruct.new("length (in inches)" => 24)
    measurements[:"length (in inches)"]       # => 24
    measurements.send("length (in inches)")   # => 24

    message = OpenStruct.new(:queued? => true)
    message.queued?                           # => true
    message.send("queued?=", false)
    message.queued?                           # => false

Removing the presence of an attribute requires the execution of the
delete_field method as setting the property value to `nil` will not remove the
attribute.

    first_pet  = OpenStruct.new(:name => "Rowdy", :owner => "John Smith")
    second_pet = OpenStruct.new(:name => "Rowdy")

    first_pet.owner = nil
    first_pet                 # => #<OpenStruct name="Rowdy", owner=nil>
    first_pet == second_pet   # => false

    first_pet.delete_field(:owner)
    first_pet                 # => #<OpenStruct name="Rowdy">
    first_pet == second_pet   # => true

Ractor compatibility: A frozen OpenStruct with shareable values is itself
shareable.

## Caveats

An OpenStruct utilizes Ruby's method lookup structure to find and define the
necessary methods for properties. This is accomplished through the methods
method_missing and define_singleton_method.

This should be a consideration if there is a concern about the performance of
the objects that are created, as there is much more overhead in the setting of
these properties compared to using a Hash or a Struct. Creating an open struct
from a small Hash and accessing a few of the entries can be 200 times slower
than accessing the hash directly.

This is a potential security issue; building OpenStruct from untrusted user
data (e.g. JSON web request) may be susceptible to a "symbol denial of
service" attack since the keys create methods and names of methods are never
garbage collected.

This may also be the source of incompatibilities between Ruby versions:

    o = OpenStruct.new
    o.then # => nil in Ruby < 2.6, enumerator for Ruby >= 2.6

Builtin methods may be overwritten this way, which may be a source of bugs or
security issues:

    o = OpenStruct.new
    o.methods # => [:to_h, :marshal_load, :marshal_dump, :each_pair, ...
    o.methods = [:foo, :bar]
    o.methods # => [:foo, :bar]

To help remedy clashes, OpenStruct uses only protected/private methods ending
with `!` and defines aliases for builtin public methods by adding a `!`:

    o = OpenStruct.new(make: 'Bentley', class: :luxury)
    o.class # => :luxury
    o.class! # => OpenStruct

It is recommended (but not enforced) to not use fields ending in `!`; Note
that a subclass' methods may not be overwritten, nor can OpenStruct's own
methods ending with `!`.

For all these reasons, consider not using OpenStruct at all.


# Class Methods
## json_create(object ) [](#method-c-json_create)
See #as_json.
# Attributes
## table[RW] [](#attribute-i-table)
:nodoc:


#Instance Methods
## ==(other) [](#method-i-==)
Compares this object and `other` for equality.  An OpenStruct is equal to
`other` when `other` is an OpenStruct and the two objects' Hash tables are
equal.

    require "ostruct"
    first_pet  = OpenStruct.new("name" => "Rowdy")
    second_pet = OpenStruct.new(:name  => "Rowdy")
    third_pet  = OpenStruct.new("name" => "Rowdy", :age => nil)

    first_pet == second_pet   # => true
    first_pet == third_pet    # => false

## [](name) [](#method-i-[])
:call-seq:
    ostruct[name]  -> object

Returns the value of an attribute, or `nil` if there is no such attribute.

    require "ostruct"
    person = OpenStruct.new("name" => "John Smith", "age" => 70)
    person[:age]   # => 70, same as person.age

## []=(name, value) [](#method-i-[]=)
:call-seq:
    ostruct[name] = obj  -> obj

Sets the value of an attribute.

    require "ostruct"
    person = OpenStruct.new("name" => "John Smith", "age" => 70)
    person[:age] = 42   # equivalent to person.age = 42
    person.age          # => 42

## as_json() [](#method-i-as_json)
Methods `OpenStruct#as_json` and `OpenStruct.json_create` may be used to
serialize and deserialize a OpenStruct object; see
[Marshal](rdoc-ref:Marshal).

Method `OpenStruct#as_json` serializes `self`, returning a 2-element hash
representing `self`:

    require 'json/add/ostruct'
    x = OpenStruct.new('name' => 'Rowdy', :age => nil).as_json
    # => {"json_class"=>"OpenStruct", "t"=>{:name=>'Rowdy', :age=>nil}}

Method `JSON.create` deserializes such a hash, returning a OpenStruct object:

    OpenStruct.json_create(x)
    # => #<OpenStruct name='Rowdy', age=nil>

## delete_field(name, &block) [](#method-i-delete_field)
Removes the named field from the object and returns the value the field
contained if it was defined. You may optionally provide a block. If the field
is not defined, the result of the block is returned, or a NameError is raised
if no block was given.

    require "ostruct"

    person = OpenStruct.new(name: "John", age: 70, pension: 300)

    person.delete_field!("age")  # => 70
    person                       # => #<OpenStruct name="John", pension=300>

Setting the value to `nil` will not remove the attribute:

    person.pension = nil
    person                 # => #<OpenStruct name="John", pension=nil>

    person.delete_field('number')  # => NameError

    person.delete_field('number') { 8675_309 } # => 8675309

## dig(name, *names) [](#method-i-dig)
:call-seq:
    ostruct.dig(name, *identifiers) -> object

Finds and returns the object in nested objects that is specified by `name` and
`identifiers`. The nested objects may be instances of various classes. See
[Dig Methods](rdoc-ref:dig_methods.rdoc).

Examples:
    require "ostruct"
    address = OpenStruct.new("city" => "Anytown NC", "zip" => 12345)
    person  = OpenStruct.new("name" => "John Smith", "address" => address)
    person.dig(:address, "zip") # => 12345
    person.dig(:business_address, "zip") # => nil

## each_pair() [](#method-i-each_pair)
:call-seq:
    ostruct.each_pair {|name, value| block }  -> ostruct
    ostruct.each_pair                         -> Enumerator

Yields all attributes (as symbols) along with the corresponding values or
returns an enumerator if no block is given.

    require "ostruct"
    data = OpenStruct.new("country" => "Australia", :capital => "Canberra")
    data.each_pair.to_a   # => [[:country, "Australia"], [:capital, "Canberra"]]

## encode_with(coder) [](#method-i-encode_with)
Provides marshalling support for use by the YAML library.

## eql?(other) [](#method-i-eql?)
Compares this object and `other` for equality.  An OpenStruct is eql? to
`other` when `other` is an OpenStruct and the two objects' Hash tables are
eql?.

**@return** [Boolean] 

## freeze() [](#method-i-freeze)

## hash() [](#method-i-hash)
Computes a hash code for this OpenStruct.

## init_with(coder) [](#method-i-init_with)
Provides marshalling support for use by the YAML library.

## initialize(hashnil) [](#method-i-initialize)
Creates a new OpenStruct object.  By default, the resulting OpenStruct object
will have no attributes.

The optional `hash`, if given, will generate attributes and values (can be a
Hash, an OpenStruct or a Struct). For example:

    require "ostruct"
    hash = { "country" => "Australia", :capital => "Canberra" }
    data = OpenStruct.new(hash)

    data   # => #<OpenStruct country="Australia", capital="Canberra">

**@return** [OpenStruct] a new instance of OpenStruct

## inspect() [](#method-i-inspect)
Returns a string containing a detailed summary of the keys and values.

## marshal_dump() [](#method-i-marshal_dump)
Provides marshalling support for use by the Marshal library.

## to_h(&block) [](#method-i-to_h)

## to_json(*args) [](#method-i-to_json)
Returns a JSON string representing `self`:

    require 'json/add/ostruct'
    puts OpenStruct.new('name' => 'Rowdy', :age => nil).to_json

Output:

    {"json_class":"OpenStruct","t":{'name':'Rowdy',"age":null}}

