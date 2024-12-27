# Module: Bundler::Thor::Base
    



# Class Methods
## included(base ) [](#method-c-included)
:nodoc:
## register_klass_file(klass ) [](#method-c-register_klass_file)
Whenever a class inherits from Bundler::Thor or Bundler::Thor::Group, we
should track the class and the file on Bundler::Thor::Base. This is the method
responsible for it.
## subclass_files() [](#method-c-subclass_files)
Returns the files where the subclasses are kept.

#### Returns
Hash[path<String> => Class]
## subclasses() [](#method-c-subclasses)
Returns the classes that inherits from Bundler::Thor or Bundler::Thor::Group.

#### Returns
[Array](Class)
# Attributes
## shell[RW] [](#attribute-c-shell)
Returns the shell used in all Bundler::Thor classes. If you are in a Unix
platform it will use a colored log, otherwise it will use a basic one without
color.

## args[RW] [](#attribute-i-args)
Returns the value of attribute args.

## options[RW] [](#attribute-i-options)
Returns the value of attribute options.

## parent_options[RW] [](#attribute-i-parent_options)
Returns the value of attribute parent_options.


#Instance Methods
## initialize(args[], local_options{}, config{}) [](#method-i-initialize)
It receives arguments in an Array and two hashes, one for options and other
for configuration.

Notice that it does not check if all required arguments were supplied. It
should be done by the parser.

#### Parameters
[args<Array](Object)>
:   An array of objects. The objects are applied to their respective accessors
    declared with `argument`.


options<Hash>
:   An options hash that will be available as self.options. The hash given is
    converted to a hash with indifferent access, magic predicates
    (options.skip?) and then frozen.


config<Hash>
:   Configuration for this Bundler::Thor class.


