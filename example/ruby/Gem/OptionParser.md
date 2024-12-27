# Class: Gem::OptionParser
**Inherits:** Object
    

--
## Developer Documentation (not for RDoc output)

### Class tree

    Gem::OptionParser
:       front end

    Gem::OptionParser::Switch
:       each switches

    Gem::OptionParser::List
:       options list

    Gem::OptionParser::ParseError
:       errors on parsing

    *   Gem::OptionParser::AmbiguousOption
    *   Gem::OptionParser::NeedlessArgument
    *   Gem::OptionParser::MissingArgument
    *   Gem::OptionParser::InvalidOption
    *   Gem::OptionParser::InvalidArgument
        *   Gem::OptionParser::AmbiguousArgument

### Object relationship diagram

    +--------------+
    | Gem::OptionParser |<>-----+
    +--------------+       |                      +--------+
                           |                    ,-| Switch |
         on_head -------->+---------------+    /  +--------+
         accept/reject -->| List          |<|>-
                          |               |<|>-  +----------+
         on ------------->+---------------+    `-| argument |
                            :           :        |  class   |
                          +---------------+      |==========|
         on_tail -------->|               |      |pattern   |
                          +---------------+      |----------|
    Gem::OptionParser.accept ->| DefaultList   |      |converter |
                 reject   |(shared between|      +----------+
                          | all instances)|
                          +---------------+

++

## Gem::OptionParser

### New to `Gem::OptionParser`?

See the [Tutorial](optparse/tutorial.rdoc).

### Introduction

Gem::OptionParser is a class for command-line option analysis.  It is much
more advanced, yet also easier to use, than GetoptLong, and is a more
Ruby-oriented solution.

### Features

1.  The argument specification and the code to handle it are written in the
    same place.
2.  It can output an option summary; you don't need to maintain this string
    separately.
3.  Optional and mandatory arguments are specified very gracefully.
4.  Arguments can be automatically converted to a specified class.
5.  Arguments can be restricted to a certain set.

All of these features are demonstrated in the examples below.  See
#make_switch for full documentation.

### Minimal example

    require 'rubygems/vendor/optparse/lib/optparse'

    options = {}
    Gem::OptionParser.new do |parser|
      parser.banner = "Usage: example.rb [options]"

      parser.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = v
      end
    end.parse!

    p options
    p ARGV

### Generating Help

Gem::OptionParser can be used to automatically generate help for the commands
you write:

    require 'rubygems/vendor/optparse/lib/optparse'

    Options = Struct.new(:name)

    class Parser
      def self.parse(options)
        args = Options.new("world")

        opt_parser = Gem::OptionParser.new do |parser|
          parser.banner = "Usage: example.rb [options]"

          parser.on("-nNAME", "--name=NAME", "Name to say hello to") do |n|
            args.name = n
          end

          parser.on("-h", "--help", "Prints this help") do
            puts parser
            exit
          end
        end

        opt_parser.parse!(options)
        return args
      end
    end
    options = Parser.parse %w[--help]

    #=>
       # Usage: example.rb [options]
       #     -n, --name=NAME                  Name to say hello to
       #     -h, --help                       Prints this help

### Required Arguments

For options that require an argument, option specification strings may include
an option name in all caps. If an option is used without the required
argument, an exception will be raised.

    require 'rubygems/vendor/optparse/lib/optparse'

    options = {}
    Gem::OptionParser.new do |parser|
      parser.on("-r", "--require LIBRARY",
                "Require the LIBRARY before executing your script") do |lib|
        puts "You required #{lib}!"
      end
    end.parse!

Used:

    $ ruby optparse-test.rb -r
    optparse-test.rb:9:in `<main>': missing argument: -r (Gem::OptionParser::MissingArgument)
    $ ruby optparse-test.rb -r my-library
    You required my-library!

### Type Coercion

Gem::OptionParser supports the ability to coerce command line arguments into
objects for us.

Gem::OptionParser comes with a few ready-to-use kinds of type coercion. They
are:

*   Date  -- Anything accepted by `Date.parse` (need to require
    `optparse/date`)
*   DateTime -- Anything accepted by `DateTime.parse` (need to require
    `optparse/date`)
*   Time -- Anything accepted by `Time.httpdate` or `Time.parse` (need to
    require `optparse/time`)
*   URI  -- Anything accepted by `Gem::URI.parse` (need to require
    `optparse/uri`)
*   Shellwords -- Anything accepted by `Shellwords.shellwords` (need to
    require `optparse/shellwords`)
*   String -- Any non-empty string
*   Integer -- Any integer. Will convert octal. (e.g. 124, -3, 040)
*   Float -- Any float. (e.g. 10, 3.14, -100E+13)
*   Numeric -- Any integer, float, or rational (1, 3.4, 1/3)
*   DecimalInteger -- Like `Integer`, but no octal format.
*   OctalInteger -- Like `Integer`, but no decimal format.
*   DecimalNumeric -- Decimal integer or float.
*   TrueClass --  Accepts '+, yes, true, -, no, false' and defaults as `true`
*   FalseClass -- Same as `TrueClass`, but defaults to `false`
*   Array -- Strings separated by ',' (e.g. 1,2,3)
*   Regexp -- Regular expressions. Also includes options.

We can also add our own coercions, which we will cover below.

#### Using Built-in Conversions

As an example, the built-in `Time` conversion is used. The other built-in
conversions behave in the same way. Gem::OptionParser will attempt to parse
the argument as a `Time`. If it succeeds, that time will be passed to the
handler block. Otherwise, an exception will be raised.

    require 'rubygems/vendor/optparse/lib/optparse'
    require 'rubygems/vendor/optparse/lib/optparse/time'
    Gem::OptionParser.new do |parser|
      parser.on("-t", "--time [TIME]", Time, "Begin execution at given time") do |time|
        p time
      end
    end.parse!

Used:

    $ ruby optparse-test.rb  -t nonsense
    ... invalid argument: -t nonsense (Gem::OptionParser::InvalidArgument)
    $ ruby optparse-test.rb  -t 10-11-12
    2010-11-12 00:00:00 -0500
    $ ruby optparse-test.rb  -t 9:30
    2014-08-13 09:30:00 -0400

#### Creating Custom Conversions

The `accept` method on Gem::OptionParser may be used to create converters. It
specifies which conversion block to call whenever a class is specified. The
example below uses it to fetch a `User` object before the `on` handler
receives it.

    require 'rubygems/vendor/optparse/lib/optparse'

    User = Struct.new(:id, :name)

    def find_user id
      not_found = ->{ raise "No User Found for id #{id}" }
      [ User.new(1, "Sam"),
        User.new(2, "Gandalf") ].find(not_found) do |u|
        u.id == id
      end
    end

    op = Gem::OptionParser.new
    op.accept(User) do |user_id|
      find_user user_id.to_i
    end

    op.on("--user ID", User) do |user|
      puts user
    end

    op.parse!

Used:

    $ ruby optparse-test.rb --user 1
    #<struct User id=1, name="Sam">
    $ ruby optparse-test.rb --user 2
    #<struct User id=2, name="Gandalf">
    $ ruby optparse-test.rb --user 3
    optparse-test.rb:15:in `block in find_user': No User Found for id 3 (RuntimeError)

### Store options to a Hash

The `into` option of `order`, `parse` and so on methods stores command line
options into a Hash.

    require 'rubygems/vendor/optparse/lib/optparse'

    options = {}
    Gem::OptionParser.new do |parser|
      parser.on('-a')
      parser.on('-b NUM', Integer)
      parser.on('-v', '--verbose')
    end.parse!(into: options)

    p options

Used:

    $ ruby optparse-test.rb -a
    {:a=>true}
    $ ruby optparse-test.rb -a -v
    {:a=>true, :verbose=>true}
    $ ruby optparse-test.rb -a -b 100
    {:a=>true, :b=>100}

### Complete example

The following example is a complete Ruby program.  You can run it and see the
effect of specifying various options.  This is probably the best way to learn
the features of `optparse`.

    require 'rubygems/vendor/optparse/lib/optparse'
    require 'rubygems/vendor/optparse/lib/optparse/time'
    require 'ostruct'
    require 'pp'

    class OptparseExample
      Version = '1.0.0'

      CODES = %w[iso-2022-jp shift_jis euc-jp utf8 binary]
      CODE_ALIASES = { "jis" => "iso-2022-jp", "sjis" => "shift_jis" }

      class ScriptOptions
        attr_accessor :library, :inplace, :encoding, :transfer_type,
                      :verbose, :extension, :delay, :time, :record_separator,
                      :list

        def initialize
          self.library = []
          self.inplace = false
          self.encoding = "utf8"
          self.transfer_type = :auto
          self.verbose = false
        end

        def define_options(parser)
          parser.banner = "Usage: example.rb [options]"
          parser.separator ""
          parser.separator "Specific options:"

          # add additional options
          perform_inplace_option(parser)
          delay_execution_option(parser)
          execute_at_time_option(parser)
          specify_record_separator_option(parser)
          list_example_option(parser)
          specify_encoding_option(parser)
          optional_option_argument_with_keyword_completion_option(parser)
          boolean_verbose_option(parser)

          parser.separator ""
          parser.separator "Common options:"
          # No argument, shows at tail.  This will print an options summary.
          # Try it and see!
          parser.on_tail("-h", "--help", "Show this message") do
            puts parser
            exit
          end
          # Another typical switch to print the version.
          parser.on_tail("--version", "Show version") do
            puts Version
            exit
          end
        end

        def perform_inplace_option(parser)
          # Specifies an optional option argument
          parser.on("-i", "--inplace [EXTENSION]",
                    "Edit ARGV files in place",
                    "(make backup if EXTENSION supplied)") do |ext|
            self.inplace = true
            self.extension = ext || ''
            self.extension.sub!(/\A\.?(?=.)/, ".")  # Ensure extension begins with dot.
          end
        end

        def delay_execution_option(parser)
          # Cast 'delay' argument to a Float.
          parser.on("--delay N", Float, "Delay N seconds before executing") do |n|
            self.delay = n
          end
        end

        def execute_at_time_option(parser)
          # Cast 'time' argument to a Time object.
          parser.on("-t", "--time [TIME]", Time, "Begin execution at given time") do |time|
            self.time = time
          end
        end

        def specify_record_separator_option(parser)
          # Cast to octal integer.
          parser.on("-F", "--irs [OCTAL]", Gem::OptionParser::OctalInteger,
                    "Specify record separator (default \\0)") do |rs|
            self.record_separator = rs
          end
        end

        def list_example_option(parser)
          # List of arguments.
          parser.on("--list x,y,z", Array, "Example 'list' of arguments") do |list|
            self.list = list
          end
        end

        def specify_encoding_option(parser)
          # Keyword completion.  We are specifying a specific set of arguments (CODES
          # and CODE_ALIASES - notice the latter is a Hash), and the user may provide
          # the shortest unambiguous text.
          code_list = (CODE_ALIASES.keys + CODES).join(', ')
          parser.on("--code CODE", CODES, CODE_ALIASES, "Select encoding",
                    "(#{code_list})") do |encoding|
            self.encoding = encoding
          end
        end

        def optional_option_argument_with_keyword_completion_option(parser)
          # Optional '--type' option argument with keyword completion.
          parser.on("--type [TYPE]", [:text, :binary, :auto],
                    "Select transfer type (text, binary, auto)") do |t|
            self.transfer_type = t
          end
        end

        def boolean_verbose_option(parser)
          # Boolean switch.
          parser.on("-v", "--[no-]verbose", "Run verbosely") do |v|
            self.verbose = v
          end
        end
      end

      #
      # Return a structure describing the options.
      #
      def parse(args)
        # The options specified on the command line will be collected in
        # *options*.

        @options = ScriptOptions.new
        @args = Gem::OptionParser.new do |parser|
          @options.define_options(parser)
          parser.parse!(args)
        end
        @options
      end

      attr_reader :parser, :options
    end  # class OptparseExample

    example = OptparseExample.new
    options = example.parse(ARGV)
    pp options # example.options
    pp ARGV

### Shell Completion

For modern shells (e.g. bash, zsh, etc.), you can use shell completion for
command line options.

### Further documentation

The above examples, along with the accompanying
[Tutorial](optparse/tutorial.rdoc), should be enough to learn how to use this
class. If you have any questions, file a ticket at http://bugs.ruby-lang.org.


# Class Methods
## accept(*args , &blk ) [](#method-c-accept)
See #accept.
## each_const(path , base ::Object) [](#method-c-each_const)
:stopdoc:
## getopts(*args , symbolize_names: false) [](#method-c-getopts)
See #getopts.
## inc(arg , default nil) [](#method-c-inc)
Returns an incremented value of `default` according to `arg`.
## reject(*args , &blk ) [](#method-c-reject)
See #reject.
## search_const(klass , name ) [](#method-c-search_const)
## show_version(*pkgs ) [](#method-c-show_version)
Shows version string in packages if Version is defined.

`pkgs`
:   package list

## terminate(arg nil) [](#method-c-terminate)
See #terminate.
## top() [](#method-c-top)
Returns the global top option list.

Do not use directly.
## with(*args , &block ) [](#method-c-with)
Initializes a new instance and evaluates the optional block in context of the
instance. Arguments `args` are passed to #new, see there for description of
parameters.

This method is **deprecated**, its behavior corresponds to the older #new
method.
# Attributes
## banner[RW] [](#attribute-i-banner)
Heading banner preceding summary.

## default_argv[RW] [](#attribute-i-default_argv)
Strings to be parsed in default.

## program_name[RW] [](#attribute-i-program_name)
Program name to be emitted in error message and default banner, defaults to
$0.

## raise_unknown[RW] [](#attribute-i-raise_unknown)
Whether to raise at unknown option.

## release[RW] [](#attribute-i-release)
Release code

## require_exact[RW] [](#attribute-i-require_exact)
Whether to require that options match exactly (disallows providing abbreviated
long option as short option).

## summary_indent[RW] [](#attribute-i-summary_indent)
Indentation for summary. Must be String (or have + String method).

## summary_width[RW] [](#attribute-i-summary_width)
Width for option list portion of summary. Must be Numeric.

## version[RW] [](#attribute-i-version)
Version


#Instance Methods
## abort(mesg$!) [](#method-i-abort)
Shows message with the program name then aborts.

`mesg`
:   Message, defaulted to +$!+.


See Kernel#abort.

## accept(*args, &blk) [](#method-i-accept)
Directs to accept specified class `t`. The argument string is passed to the
block in which it should be converted to the desired class.

`t`
:   Argument class specifier, any object including Class.

`pat`
:   Pattern for argument, defaults to `t` if it responds to match.


    accept(t, pat, &block)

## add_officious() [](#method-i-add_officious)
:nodoc:

## additional_message(typ, opt) [](#method-i-additional_message)
Returns additional info.

## base() [](#method-i-base)
Subject of #on_tail.

## candidate(word) [](#method-i-candidate)
Return candidates for `word`.

## compsys(to, nameFile.basename($0)) [](#method-i-compsys)
:nodoc:

## define(*opts, &block) [](#method-i-define)
:call-seq:
    define(*params, &block)

:include: ../doc/optparse/creates_option.rdoc

## define_by_keywords(options, method, **params) [](#method-i-define_by_keywords)
:call-seq:
    define_by_keywords(options, method, **params)

:include: ../../doc/optparse/creates_option.rdoc

Defines options which set in to *options* for keyword parameters of *method*.

Parameters for each keywords are given as elements of *params*.

## define_head(*opts, &block) [](#method-i-define_head)
:call-seq:
    define_head(*params, &block)

:include: ../doc/optparse/creates_option.rdoc

## define_tail(*opts, &block) [](#method-i-define_tail)
:call-seq:
    define_tail(*params, &block)

:include: ../doc/optparse/creates_option.rdoc

## environment(envFile.basename($0, '.*'), **keywords) [](#method-i-environment)
Parses environment variable `env` or its uppercase with splitting like a
shell.

`env` defaults to the basename of the program.

## getopts(*args, symbolize_names:false, **keywords) [](#method-i-getopts)
Wrapper method for getopts.rb.

    params = ARGV.getopts("ab:", "foo", "bar:", "zot:Z;zot option")
    # params["a"] = true   # -a
    # params["b"] = "1"    # -b1
    # params["foo"] = "1"  # --foo
    # params["bar"] = "x"  # --bar x
    # params["zot"] = "z"  # --zot Z

Option `symbolize_names` (boolean) specifies whether returned Hash keys should
be Symbols; defaults to `false` (use Strings).

    params = ARGV.getopts("ab:", "foo", "bar:", "zot:Z;zot option", symbolize_names: true)
    # params[:a] = true   # -a
    # params[:b] = "1"    # -b1
    # params[:foo] = "1"  # --foo
    # params[:bar] = "x"  # --bar x
    # params[:zot] = "z"  # --zot Z

## help() [](#method-i-help)
Returns option summary string.

## help_exit() [](#method-i-help_exit)

## inc(*args) [](#method-i-inc)
See self.inc

## initialize(bannernil, width32, indent' ' * 4) [](#method-i-initialize)
Initializes the instance and yields itself if called with a block.

`banner`
:   Banner message.

`width`
:   Summary width.

`indent`
:   Summary indent.


**@return** [OptionParser] a new instance of OptionParser

**@yield** [_self] 

**@yieldparam** [Gem::OptionParser] the object that the method was called on

## inspect() [](#method-i-inspect)
:nodoc:

## load(filenamenil, **keywords) [](#method-i-load)
Loads options from file names as `filename`. Does nothing when the file is not
present. Returns whether successfully loaded.

`filename` defaults to basename of the program without suffix in a directory
~/.options, then the basename with '.options' suffix under XDG and Haiku
standard places.

The optional `into` keyword argument works exactly like that accepted in
method #parse.

## make_switch(opts, blocknil) [](#method-i-make_switch)
:call-seq:
    make_switch(params, block = nil)

:include: ../doc/optparse/creates_option.rdoc

## new() [](#method-i-new)
Pushes a new List.

If a block is given, yields `self` and returns the result of the block,
otherwise returns `self`.

## on(*opts, &block) [](#method-i-on)
:call-seq:
    on(*params, &block)

:include: ../doc/optparse/creates_option.rdoc

## on_head(*opts, &block) [](#method-i-on_head)
:call-seq:
    on_head(*params, &block)

:include: ../doc/optparse/creates_option.rdoc

The new option is added at the head of the summary.

## on_tail(*opts, &block) [](#method-i-on_tail)
:call-seq:
    on_tail(*params, &block)

:include: ../doc/optparse/creates_option.rdoc

The new option is added at the tail of the summary.

## order(*argv, **keywords, &nonopt) [](#method-i-order)
Parses command line arguments `argv` in order. When a block is given, each
non-option argument is yielded. When optional `into` keyword argument is
provided, the parsed option values are stored there via `[]=` method (so it
can be Hash, or OpenStruct, or other similar object).

Returns the rest of `argv` left unparsed.

## order!(argvdefault_argv, into:nil, **keywords, &nonopt) [](#method-i-order!)
Same as #order, but removes switches destructively. Non-option arguments
remain in `argv`.

## parse(*argv, **keywords) [](#method-i-parse)
Parses command line arguments `argv` in order when environment variable
POSIXLY_CORRECT is set, and in permutation mode otherwise. When optional
`into` keyword argument is provided, the parsed option values are stored there
via `[]=` method (so it can be Hash, or OpenStruct, or other similar object).

## parse!(argvdefault_argv, **keywords) [](#method-i-parse!)
Same as #parse, but removes switches destructively. Non-option arguments
remain in `argv`.

## permute(*argv, **keywords) [](#method-i-permute)
Parses command line arguments `argv` in permutation mode and returns list of
non-option arguments. When optional `into` keyword argument is provided, the
parsed option values are stored there via `[]=` method (so it can be Hash, or
OpenStruct, or other similar object).

## permute!(argvdefault_argv, **keywords) [](#method-i-permute!)
Same as #permute, but removes switches destructively. Non-option arguments
remain in `argv`.

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## reject(*args, &blk) [](#method-i-reject)
Directs to reject specified class argument.

`type`
:   Argument class specifier, any object including Class.


    reject(type)

## remove() [](#method-i-remove)
Removes the last List.

## separator(string) [](#method-i-separator)
Add separator in summary.

## summarize(to[], width@summary_width, maxwidth - 1, indent@summary_indent, &blk) [](#method-i-summarize)
Puts option summary into `to` and returns `to`. Yields each line if a block is
given.

`to`
:   Output destination, which must have method <<. Defaults to [].

`width`
:   Width of left side, defaults to @summary_width.

`max`
:   Maximum length allowed for left side, defaults to `width` - 1.

`indent`
:   Indentation, defaults to @summary_indent.


## terminate(argnil) [](#method-i-terminate)
Terminates option parsing. Optional parameter `arg` is a string pushed back to
be the first non-option argument.

## to_a() [](#method-i-to_a)
Returns option summary list.

## top() [](#method-i-top)
Subject of #on / #on_head, #accept / #reject

## ver() [](#method-i-ver)
Returns version string from program_name, version and release.

## warn(mesg$!) [](#method-i-warn)
Shows warning message with the program name

`mesg`
:   Message, defaulted to +$!+.


See Kernel#warn.

