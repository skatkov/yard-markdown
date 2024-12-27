# Class: Bundler::Thor
**Inherits:** Object
    
**Includes:** Bundler::Thor::Base
  



# Class Methods
## check_unknown_options!(options {}) [](#method-c-check_unknown_options!)
Extend check unknown options to accept a hash of conditions.

### Parameters
options<Hash>: A hash containing :only and/or :except keys
## check_unknown_options?(config ) [](#method-c-check_unknown_options?)
Overwrite check_unknown_options? to take subcommands and options into account.
**@return** [Boolean] 

## command_exists?(command_name ) [](#method-c-command_exists?)
Checks if a specified command exists.

#### Parameters
command_name<String>
:   The name of the command to check for existence.


#### Returns
Boolean
:   `true` if the command exists, `false` otherwise.

**@return** [Boolean] 

## command_help(shell , command_name ) [](#method-c-command_help)
Prints help information for the given command.

#### Parameters
shell<Bundler::Thor::Shell> command_name<String>
## default_command(meth nil) [](#method-c-default_command)
Sets the default command when thor is executed without an explicit command to
be called.

#### Parameters
meth<Symbol>
:   name of the default command

## deprecation_warning(message ) [](#method-c-deprecation_warning)
:nodoc:
## desc(usage , description , options {}) [](#method-c-desc)
Defines the usage and the description of the next command.

#### Parameters
usage<String> description<String> options<String>
## disable_required_check!(*command_names ) [](#method-c-disable_required_check!)
Disable the check for required options for the given commands. This is useful
if you have a command that does not need the required options to work, like
help.

#### Parameters
Symbol ...
:   A list of commands that should be affected.

## disable_required_check?(command ) [](#method-c-disable_required_check?)
:nodoc:
**@return** [Boolean] 

## help(shell , subcommand false) [](#method-c-help)
Prints help information for this class.

#### Parameters
shell<Bundler::Thor::Shell>
## long_desc(long_description , options {}) [](#method-c-long_desc)
Defines the long description of the next command.

Long description is by default indented, line-wrapped and repeated whitespace
merged. In order to print long description verbatim, with indentation and
spacing exactly as found in the code, use the `wrap` option

    long_desc 'your very long description', wrap: false

#### Parameters
long description<String> options<Hash>
## map(mappings nil, **kw ) [](#method-c-map)
Maps an input to a command. If you define:

    map "-T" => "list"

Running:

    thor -T

Will invoke the list command.

#### Parameters
Hash[String|Array => Symbol]
:   Maps the string or the strings in the array to the given command.

## method_at_least_one(*args , &block ) [](#method-c-method_at_least_one)
Adds and declares option group for required at least one of options in the
block of arguments. You can declare options as the outside of the block.

If :for is given as option, it allows you to change the options from a
previous defined command.

#### Parameters
[Array](Bundler::Thor::Option.name)
options<Hash>
:   :for is applied for previous defined command.


#### Examples

    at_least_one do
      option :one
      option :two
    end

Or

    option :one
    option :two
    at_least_one :one, :two

If you do not give "--one" and "--two" AtLeastOneRequiredArgumentError will be
raised.

You can use at_least_one and exclusive at the same time.

    exclusive do
      at_least_one do
        option :one
        option :two
      end
    end

Then it is required either only one of "--one" or "--two".
## method_exclusive(*args , &block ) [](#method-c-method_exclusive)
Adds and declares option group for exclusive options in the block and
arguments. You can declare options as the outside of the block.

If :for is given as option, it allows you to change the options from a
previous defined command.

#### Parameters
[Array](Bundler::Thor::Option.name)
options<Hash>
:   :for is applied for previous defined command.


#### Examples

    exclusive do
      option :one
      option :two
    end

Or

    option :one
    option :two
    exclusive :one, :two

If you give "--one" and "--two" at the same time ExclusiveArgumentsError will
be raised.
## method_option(name , options {}) [](#method-c-method_option)
Adds an option to the set of method options. If :for is given as option, it
allows you to change the options from a previous defined command.

    def previous_command
      # magic
    end

    method_option :foo, :for => :previous_command

    def next_command
      # magic
    end

#### Parameters
name<Symbol>
:   The name of the argument.

options<Hash>
:   Described below.


#### Options
:desc     - Description for the argument. :required - If the argument is
required or not. :default  - Default value for this argument. It cannot be
required and have default values. :aliases  - Aliases for this option. :type  
  - The type of the argument, can be :string, :hash, :array, :numeric or
:boolean. :banner   - String to show on usage notes. :hide     - If you want
to hide this option from the help.
## method_options(options nil) [](#method-c-method_options)
Declares the options for the next command to be declared.

#### Parameters
Hash[Symbol => Object]
:   The hash key is the name of the option and the value

is the type of the option. Can be :string, :array, :hash, :boolean, :numeric
or :required (string). If you give a value, the type of the value is used.
## package_name(name , _ {}) [](#method-c-package_name)
Allows for custom "Command" package naming.

### Parameters
name<String> options<Hash>
## printable_commands(all true, subcommand false) [](#method-c-printable_commands)
Returns commands ready to be printed.
## register(klass , subcommand_name , usage , description , options {}) [](#method-c-register)
Registers another Bundler::Thor subclass as a command.

#### Parameters
klass<Class>
:   Bundler::Thor subclass to register

command<String>
:   Subcommand name to use

usage<String>
:   Short usage for the subcommand

description<String>
:   Description for the subcommand

## stop_on_unknown_option!(*command_names ) [](#method-c-stop_on_unknown_option!)
Stop parsing of options as soon as an unknown option or a regular argument is
encountered.  All remaining arguments are passed to the command. This is
useful if you have a command that can receive arbitrary additional options,
and where those additional options should not be handled by Bundler::Thor.

#### Example

To better understand how this is useful, let's consider a command that calls
an external command.  A user may want to pass arbitrary options and arguments
to that command.  The command itself also accepts some options, which should
be handled by Bundler::Thor.

    class_option "verbose",  :type => :boolean
    stop_on_unknown_option! :exec
    check_unknown_options!  :except => :exec

    desc "exec", "Run a shell command"
    def exec(*args)
      puts "diagnostic output" if options[:verbose]
      Kernel.exec(*args)
    end

Here `exec` can be called with `--verbose` to get diagnostic output, e.g.:

    $ thor exec --verbose echo foo
    diagnostic output
    foo

But if `--verbose` is given after `echo`, it is passed to `echo` instead:

    $ thor exec echo --verbose foo
    --verbose foo

#### Parameters
Symbol ...
:   A list of commands that should be affected.

## stop_on_unknown_option?(command ) [](#method-c-stop_on_unknown_option?)
:nodoc:
**@return** [Boolean] 

## subcommand(subcommand , subcommand_class ) [](#method-c-subcommand)
## subcommand_classes() [](#method-c-subcommand_classes)
## subcommands() [](#method-c-subcommands)

#Instance Methods
## help(commandnil, subcommandfalse) [](#method-i-help)

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


