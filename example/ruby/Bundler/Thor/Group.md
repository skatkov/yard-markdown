# Class: Bundler::Thor::Group
**Inherits:** Object
    
**Includes:** Bundler::Thor::Base
  

Bundler::Thor has a special class called Bundler::Thor::Group. The main
difference to Bundler::Thor class is that it invokes all commands at once. It
also include some methods that allows invocations to be done at the class
method, which are not available to Bundler::Thor commands.


# Class Methods
## class_options_help(shell , groups {}) [](#method-c-class_options_help)
Overwrite class options help to allow invoked generators options to be shown
recursively when invoking a generator.
## command_exists?(command_name ) [](#method-c-command_exists?)
Checks if a specified command exists.

#### Parameters
command_name<String>
:   The name of the command to check for existence.


#### Returns
Boolean
:   `true` if the command exists, `false` otherwise.

**@return** [Boolean] 

## desc(description nil) [](#method-c-desc)
The description for this Bundler::Thor::Group. If none is provided, but a
source root exists, tries to find the USAGE one folder above it, otherwise
searches in the superclass.

#### Parameters
description<String>
:   The description for this Bundler::Thor::Group.

## get_options_from_invocations(group_options , base_options ) [](#method-c-get_options_from_invocations)
Get invocations array and merge options from invocations. Those options are
added to group_options hash. Options that already exists in base_options are
not added twice.
## handle_argument_error(command , error , _args , arity ) [](#method-c-handle_argument_error)
:nodoc:
**@raise** [error] 

## help(shell ) [](#method-c-help)
Prints help information.

#### Options
short
:   When true, shows only usage.

## invocation_blocks() [](#method-c-invocation_blocks)
Stores invocation blocks used on invoke_from_option.
## invocations() [](#method-c-invocations)
Stores invocations for this class merging with superclass values.
## invoke(*names , &block ) [](#method-c-invoke)
Invoke the given namespace or class given. It adds an instance method that
will invoke the klass and command. You can give a block to configure how it
will be invoked.

The namespace/class given will have its options showed on the help usage.
Check invoke_from_option for more information.
## invoke_from_option(*names , &block ) [](#method-c-invoke_from_option)
Invoke a thor class based on the value supplied by the user to the given
option named "name". A class option must be created before this method is
invoked for each name given.

#### Examples

    class GemGenerator < Bundler::Thor::Group
      class_option :test_framework, :type => :string
      invoke_from_option :test_framework
    end

#### Boolean options

In some cases, you want to invoke a thor class if some option is true or
false. This is automatically handled by invoke_from_option. Then the option
name is used to invoke the generator.

#### Preparing for invocation

In some cases you want to customize how a specified hook is going to be
invoked. You can do that by overwriting the class method
prepare_for_invocation. The class method must necessarily return a klass and
an optional command.

#### Custom invocations

You can also supply a block to customize how the option is going to be
invoked. The block receives two parameters, an instance of the current class
and the klass to be invoked.
## printable_commands() [](#method-c-printable_commands)
Returns commands ready to be printed.
## remove_invocation(*names ) [](#method-c-remove_invocation)
Remove a previously added invocation.

#### Examples

    remove_invocation :test_framework

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


