# Module: Bundler::Thor::Invocation
    



# Class Methods
## included(base ) [](#method-c-included)
:nodoc:

#Instance Methods
## current_command_chain() [](#method-i-current_command_chain)
Make the current command chain accessible with in a Bundler::Thor-(sub)command

## initialize(args[], options{}, config{}, &block) [](#method-i-initialize)
Make initializer aware of invocations and the initialization args.

## invoke(namenil, *args) [](#method-i-invoke)
Receives a name and invokes it. The name can be a string (either "command" or
"namespace:command"), a Bundler::Thor::Command, a Class or a Bundler::Thor
instance. If the command cannot be guessed by name, it can also be supplied as
second argument.

You can also supply the arguments, options and configuration values for the
command to be invoked, if none is given, the same values used to initialize
the invoker are used to initialize the invoked.

When no name is given, it will invoke the default command of the current
class.

#### Examples

    class A < Bundler::Thor
      def foo
        invoke :bar
        invoke "b:hello", ["Erik"]
      end

      def bar
        invoke "b:hello", ["Erik"]
      end
    end

    class B < Bundler::Thor
      def hello(name)
        puts "hello #{name}"
      end
    end

You can notice that the method "foo" above invokes two commands: "bar", which
belongs to the same class and "hello" which belongs to the class B.

By using an invocation system you ensure that a command is invoked only once.
In the example above, invoking "foo" will invoke "b:hello" just once, even if
it's invoked later by "bar" method.

When class A invokes class B, all arguments used on A initialization are
supplied to B. This allows lazy parse of options. Let's suppose you have some
rspec commands:

    class Rspec < Bundler::Thor::Group
      class_option :mock_framework, :type => :string, :default => :rr

      def invoke_mock_framework
        invoke "rspec:#{options[:mock_framework]}"
      end
    end

As you noticed, it invokes the given mock framework, which might have its own
options:

    class Rspec::RR < Bundler::Thor::Group
      class_option :style, :type => :string, :default => :mock
    end

Since it's not rspec concern to parse mock framework options, when RR is
invoked all options are parsed again, so RR can extract only the options that
it's going to use.

If you want Rspec::RR to be initialized with its own set of options, you have
to do that explicitly:

    invoke "rspec:rr", [], :style => :foo

Besides giving an instance, you can also give a class to invoke:

    invoke Rspec::RR, [], :style => :foo

## invoke_all() [](#method-i-invoke_all)
Invoke all commands for the current instance.

## invoke_command(command, *args) [](#method-i-invoke_command)
Invoke the given command if the given args.

## invoke_with_padding(*args) [](#method-i-invoke_with_padding)
Invokes using shell padding.

