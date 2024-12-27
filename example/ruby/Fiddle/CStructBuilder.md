# Module: Fiddle::CStructBuilder
    

Used to construct C classes (CUnion, CStruct, etc)

Fiddle::Importer#struct and Fiddle::Importer#union wrap this functionality in
an easy-to-use manner.


# Class Methods
## create(klass , types , members ) [](#method-c-create)
Construct a new class given a C:
*   class `klass` (CUnion, CStruct, or other that provide an #entity_class)
*   `types` (Fiddle::TYPE_INT, Fiddle::TYPE_SIZE_T, etc., see the C types
    constants)
*   corresponding `members`

Fiddle::Importer#struct and Fiddle::Importer#union wrap this functionality in
an easy-to-use manner.

Examples:

    require 'fiddle/struct'
    require 'fiddle/cparser'

    include Fiddle::CParser

    types, members = parse_struct_signature(['int i','char c'])

    MyStruct = Fiddle::CStructBuilder.create(Fiddle::CUnion, types, members)

    MyStruct.malloc(Fiddle::RUBY_FREE) do |obj|
      ...
    end

    obj = MyStruct.malloc(Fiddle::RUBY_FREE)
    begin
      ...
    ensure
      obj.call_free
    end

    obj = MyStruct.malloc
    begin
      ...
    ensure
      Fiddle.free obj.to_ptr
    end

