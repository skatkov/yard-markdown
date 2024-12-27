# Class: ERB::Compiler
**Inherits:** Object
    

-- ERB::Compiler

Compiles ERB templates into Ruby code; the compiled code produces the template
result when evaluated. ERB::Compiler provides hooks to define how generated
output is handled.

Internally ERB does something like this to generate the code returned by
ERB#src:

    compiler = ERB::Compiler.new('<>')
    compiler.pre_cmd    = ["_erbout=+''"]
    compiler.put_cmd    = "_erbout.<<"
    compiler.insert_cmd = "_erbout.<<"
    compiler.post_cmd   = ["_erbout"]

    code, enc = compiler.compile("Got <%= obj %>!\n")
    puts code

*Generates*:

    #coding:UTF-8
    _erbout=+''; _erbout.<< "Got ".freeze; _erbout.<<(( obj ).to_s); _erbout.<< "!\n".freeze; _erbout

By default the output is sent to the print method.  For example:

    compiler = ERB::Compiler.new('<>')
    code, enc = compiler.compile("Got <%= obj %>!\n")
    puts code

*Generates*:

    #coding:UTF-8
    print "Got ".freeze; print(( obj ).to_s); print "!\n".freeze

## Evaluation

The compiled code can be used in any context where the names in the code
correctly resolve. Using the last example, each of these print 'Got It!'

Evaluate using a variable:

    obj = 'It'
    eval code

Evaluate using an input:

    mod = Module.new
    mod.module_eval %{
      def get(obj)
        #{code}
      end
    }
    extend mod
    get('It')

Evaluate using an accessor:

    klass = Class.new Object
    klass.class_eval %{
      attr_accessor :obj
      def initialize(obj)
        @obj = obj
      end
      def get_it
        #{code}
      end
    }
    klass.new('It').get_it

Good! See also ERB#def_method, ERB#def_module, and ERB#def_class.


# Attributes
## insert_cmd[RW] [](#attribute-i-insert_cmd)
The command to handle text that is inserted prior to a newline

## percent[RW] [](#attribute-i-percent)
Returns the value of attribute percent.

## post_cmd[RW] [](#attribute-i-post_cmd)
An array of commands appended to compiled code

## pre_cmd[RW] [](#attribute-i-pre_cmd)
An array of commands prepended to compiled code

## put_cmd[RW] [](#attribute-i-put_cmd)
The command to handle text that ends with a newline

## trim_mode[RW] [](#attribute-i-trim_mode)
Returns the value of attribute trim_mode.


#Instance Methods
## add_insert_cmd(out, content) [](#method-i-add_insert_cmd)

## add_put_cmd(out, content) [](#method-i-add_put_cmd)

## compile(s) [](#method-i-compile)
Compiles an ERB template into Ruby code.  Returns an array of the code and
encoding like ["code", Encoding].

**@raise** [ArgumentError] 

## compile_content(stag, out) [](#method-i-compile_content)

## compile_etag(etag, out, scanner) [](#method-i-compile_etag)

## compile_stag(stag, out, scanner) [](#method-i-compile_stag)

## initialize(trim_mode) [](#method-i-initialize)
Construct a new compiler using the trim_mode. See ERB::new for available trim
modes.

**@return** [Compiler] a new instance of Compiler

## make_scanner(src) [](#method-i-make_scanner)
:nodoc:

## prepare_trim_mode(mode) [](#method-i-prepare_trim_mode)
:nodoc:

