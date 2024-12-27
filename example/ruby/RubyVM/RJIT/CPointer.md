# Module: RubyVM::RJIT::CPointer
    

Every class under this namespace is a pointer. Even if the type is immediate,
it shouldn't be dereferenced until `*` is called.


# Class Methods
## with_class_name(prefix , name , cache: false, &block ) [](#method-c-with_class_name)
Give a name to a dynamic CPointer class to see it on inspect

