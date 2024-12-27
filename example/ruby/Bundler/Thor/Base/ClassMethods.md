# Module: Bundler::Thor::Base::ClassMethods
    




#Instance Methods
## all_commands() [](#method-i-all_commands)
Returns the commands for this Bundler::Thor class and all subclasses.

#### Returns
Hash
:   An ordered hash with commands names as keys and Bundler::Thor::Command
    objects as values.


## allow_incompatible_default_type!() [](#method-i-allow_incompatible_default_type!)
If you want to use defaults that don't match the type of an option, either
specify `check_default_type: false` or call `allow_incompatible_default_type!`

## argument(name, options{}) [](#method-i-argument)
Adds an argument to the class and creates an attr_accessor for it.

Arguments are different from options in several aspects. The first one is how
they are parsed from the command line, arguments are retrieved from position:

    thor command NAME

Instead of:

    thor command --name=NAME

Besides, arguments are used inside your code as an accessor (self.argument),
while options are all kept in a hash (self.options).

Finally, arguments cannot have type :default or :boolean but can be optional
(supplying :optional => :true or :required => false), although you cannot have
a required argument after a non-required argument. If you try it, an error is
raised.

#### Parameters
name<Symbol>
:   The name of the argument.

options<Hash>
:   Described below.


#### Options
:desc     - Description for the argument. :required - If the argument is
required or not. :optional - If the argument is optional or not. :type     -
The type of the argument, can be :string, :hash, :array, :numeric. :default  -
Default value for this argument. It cannot be required and have default
values. :banner   - String to show on usage notes.

#### Errors
ArgumentError
:   Raised if you supply a required argument after a non required one.


## arguments() [](#method-i-arguments)
Returns this class arguments, looking up in the ancestors chain.

#### Returns
[Array](Bundler::Thor::Argument)

## attr_accessor() [](#method-i-attr_accessor)
:nodoc:

## attr_reader() [](#method-i-attr_reader)
:nodoc:

## attr_writer() [](#method-i-attr_writer)
:nodoc:

## check_default_type() [](#method-i-check_default_type)
:nodoc:

## check_default_type!() [](#method-i-check_default_type!)
If you want to raise an error when the default value of an option does not
match the type call check_default_type! This will be the default; for
compatibility a deprecation warning is issued if necessary.

## check_unknown_options() [](#method-i-check_unknown_options)
:nodoc:

## check_unknown_options!() [](#method-i-check_unknown_options!)
If you want to raise an error for unknown options, call check_unknown_options!
This is disabled by default to allow dynamic invocations.

## check_unknown_options?(config) [](#method-i-check_unknown_options?)
:nodoc:

**@return** [Boolean] 

## class_at_least_one(*args, &block) [](#method-i-class_at_least_one)
Adds and declares option group for required at least one of options in the
block and arguments. You can declare options as the outside of the block.

#### Examples

    class_at_least_one do
      class_option :one
      class_option :two
     end

Or

    class_option :one
    class_option :two
    class_at_least_one :one, :two

If you do not give "--one" and "--two" AtLeastOneRequiredArgumentError will be
raised.

You can use class_at_least_one and class_exclusive at the same time.

    class_exclusive do
      class_at_least_one do
        class_option :one
        class_option :two
      end
    end

Then it is required either only one of "--one" or "--two".

## class_at_least_one_option_names() [](#method-i-class_at_least_one_option_names)
Returns this class at least one of required options array set, looking up in
the ancestors chain.

#### Returns
[Array[Array](Bundler::Thor::Option.name)]

## class_exclusive(*args, &block) [](#method-i-class_exclusive)
Adds and declares option group for exclusive options in the block and
arguments. You can declare options as the outside of the block.

#### Parameters
[Array](Bundler::Thor::Option.name)

#### Examples

    class_exclusive do
      class_option :one
      class_option :two
     end

Or

    class_option :one
    class_option :two
    class_exclusive :one, :two

If you give "--one" and "--two" at the same time ExclusiveArgumentsError will
be raised.

## class_exclusive_option_names() [](#method-i-class_exclusive_option_names)
Returns this class exclusive options array set, looking up in the ancestors
chain.

#### Returns
[Array[Array](Bundler::Thor::Option.name)]

## class_option(name, options{}) [](#method-i-class_option)
Adds an option to the set of class options

#### Parameters
name<Symbol>
:   The name of the argument.

options<Hash>
:   Described below.


#### Options
:desc
:   -- Description for the argument.

:required
:   -- If the argument is required or not.

:default
:   -- Default value for this argument.

:group
:   -- The group for this options. Use by class options to output options in
    different levels.

:aliases
:   -- Aliases for this option. **Note:** Bundler::Thor follows a convention
    of one-dash-one-letter options. Thus aliases like "-something" wouldn't be
    parsed; use either "--something" or "-s" instead.

:type
:   -- The type of the argument, can be :string, :hash, :array, :numeric or
    :boolean.

:banner
:   -- String to show on usage notes.

:hide
:   -- If you want to hide this option from the help.


## class_options(optionsnil) [](#method-i-class_options)
Adds a bunch of options to the set of class options.

    class_options :foo => false, :bar => :required, :baz => :string

If you prefer more detailed declaration, check class_option.

#### Parameters
Hash[Symbol => Object]

## commands() [](#method-i-commands)
Returns the commands for this Bundler::Thor class.

#### Returns
Hash
:   An ordered hash with commands names as keys and Bundler::Thor::Command
    objects as values.


## disable_required_check?(command_name) [](#method-i-disable_required_check?)
If true, option set will not suspend the execution of the command when a
required option is not provided.

**@return** [Boolean] 

## exit_on_failure?() [](#method-i-exit_on_failure?)
A flag that makes the process exit with status 1 if any error happens.

**@return** [Boolean] 

## group(namenil) [](#method-i-group)
Defines the group. This is used when thor list is invoked so you can specify
that only commands from a pre-defined group will be shown. Defaults to
standard.

#### Parameters
name<String|Symbol>

## handle_argument_error(command, error, args, arity) [](#method-i-handle_argument_error)
:nodoc:

**@raise** [InvocationError] 

## handle_no_command_error(command, has_namespace$thor_runner) [](#method-i-handle_no_command_error)
:nodoc:

**@raise** [UndefinedCommandError] 

## namespace(namenil) [](#method-i-namespace)
Sets the namespace for the Bundler::Thor or Bundler::Thor::Group class. By
default the namespace is retrieved from the class name. If your Bundler::Thor
class is named Scripts::MyScript, the help method, for example, will be called
as:

    thor scripts:my_script -h

If you change the namespace:

    namespace :my_scripts

You change how your commands are invoked:

    thor my_scripts -h

Finally, if you change your namespace to default:

    namespace :default

Your commands can be invoked with a shortcut. Instead of:

    thor :my_command

## no_commands(&block) [](#method-i-no_commands)
All methods defined inside the given block are not added as commands.

So you can do:

    class MyScript < Bundler::Thor
      no_commands do
        def this_is_not_a_command
        end
      end
    end

You can also add the method and remove it from the command list:

    class MyScript < Bundler::Thor
      def this_is_not_a_command
      end
      remove_command :this_is_not_a_command
    end

## no_commands?() [](#method-i-no_commands?)

**@return** [Boolean] 

## no_commands_context() [](#method-i-no_commands_context)

## public_command(*names) [](#method-i-public_command)
Allows to use private methods from parent in child classes as commands.

#### Parameters
    names<Array>:: Method names to be used as commands

#### Examples

    public_command :foo
    public_command :foo, :bar, :baz

## remove_argument(*names) [](#method-i-remove_argument)
Removes a previous defined argument. If :undefine is given, undefine accessors
as well.

#### Parameters
names<Array>
:   Arguments to be removed


#### Examples

    remove_argument :foo
    remove_argument :foo, :bar, :baz, :undefine => true

## remove_class_option(*names) [](#method-i-remove_class_option)
Removes a previous defined class option.

#### Parameters
names<Array>
:   Class options to be removed


#### Examples

    remove_class_option :foo
    remove_class_option :foo, :bar, :baz

## remove_command(*names) [](#method-i-remove_command)
Removes a given command from this Bundler::Thor class. This is usually done if
you are inheriting from another class and don't want it to be available
anymore.

By default it only remove the mapping to the command. But you can supply
:undefine => true to undefine the method from the class as well.

#### Parameters
name<Symbol|String>
:   The name of the command to be removed

options<Hash>
:   You can give :undefine => true if you want commands the method to be
    undefined from the class as well.


## start(given_argsARGV, config{}) [](#method-i-start)
Parses the command and options from the given args, instantiate the class and
invoke the command. This method is used when the arguments must be parsed from
an array. If you are inside Ruby and want to use a Bundler::Thor class, you
can simply initialize it:

    script = MyScript.new(args, options, config)
    script.invoke(:command, first_arg, second_arg, third_arg)

## stop_on_unknown_option?(command_name) [](#method-i-stop_on_unknown_option?)
If true, option parsing is suspended as soon as an unknown option or a regular
argument is encountered.  All remaining arguments are passed to the command as
regular arguments.

**@return** [Boolean] 

## strict_args_position() [](#method-i-strict_args_position)
:nodoc:

## strict_args_position!() [](#method-i-strict_args_position!)
If you want only strict string args (useful when cascading thor classes), call
strict_args_position! This is disabled by default to allow dynamic
invocations.

## strict_args_position?(config) [](#method-i-strict_args_position?)
:nodoc:

**@return** [Boolean] 

