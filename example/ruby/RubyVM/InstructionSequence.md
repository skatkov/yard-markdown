# Class: RubyVM::InstructionSequence
**Inherits:** Object
    

iseq_loader.rb - sample of compiler/loader for binary compiled file

Usage as a compiler: ruby iseq_loader.rb [file or directory] ...

    It compiles and stores specified files.
    If directories are specified, then compiles and stores all *.rb files.
    (using Dir.glob)

TODO: add remove option TODO: add verify option

Usage as a loader: simply require this file with the following setting.

Setting with environment variables.

    * RUBY_ISEQ_LOADER_STORAGE to select storage type
      * dbm: use dbm
      * fs: [default] use file system. locate a compiled binary files in same
        directory of scripts like Rubinius. foo.rb.yarb will be created for foo.rb.
      * fs2: use file system. locate compiled file in specified directory.
      * nothing: do nothing.

    * RUBY_ISEQ_LOADER_STORAGE_DIR to select directory
      * default: ~/.ruby_binaries/

    * RUBY_ISEQ_LOADER_STORAGE_COMPILE_IF_NOT_COMPILED
      * true: store compiled file if compiled data is not available.
      * false: [default] do nothing if there is no compiled iseq data.


# Class Methods
## compare_dump_and_load(i1 , dumper , loader ) [](#method-c-compare_dump_and_load)
## compile(*args ) [](#method-c-compile)
Takes `source`, which can be a string of Ruby code, or an open `File` object.
that contains Ruby source code.

Optionally takes `file`, `path`, and `line` which describe the file path, real
path and first line number of the ruby code in `source` which are metadata
attached to the returned `iseq`.

`file` is used for `__FILE__` and exception backtrace. `path` is used for
`require_relative` base. It is recommended these should be the same full path.

`options`, which can be `true`, `false` or a `Hash`, is used to modify the
default behavior of the Ruby iseq compiler.

For details regarding valid compile options see ::compile_option=.

    RubyVM::InstructionSequence.compile("a = 1 + 2")
    #=> <RubyVM::InstructionSequence:<compiled>@<compiled>>

    path = "test.rb"
    RubyVM::InstructionSequence.compile(File.read(path), path, File.expand_path(path))
    #=> <RubyVM::InstructionSequence:<compiled>@test.rb:1>

    file = File.open("test.rb")
    RubyVM::InstructionSequence.compile(file)
    #=> <RubyVM::InstructionSequence:<compiled>@<compiled>:1>

    path = File.expand_path("test.rb")
    RubyVM::InstructionSequence.compile(File.read(path), path, path)
    #=> <RubyVM::InstructionSequence:<compiled>@/absolute/path/to/test.rb:1>
**@overload** [] 

**@overload** [] 

## compile_and_save_iseq(fname ) [](#method-c-compile_and_save_iseq)
## compile_file(*args ) [](#method-c-compile_file)
Takes `file`, a String with the location of a Ruby source file, reads, parses
and compiles the file, and returns `iseq`, the compiled InstructionSequence
with source location metadata set.

Optionally takes `options`, which can be `true`, `false` or a `Hash`, to
modify the default behavior of the Ruby iseq compiler.

For details regarding valid compile options see ::compile_option=.

    # /tmp/hello.rb
    puts "Hello, world!"

    # elsewhere
    RubyVM::InstructionSequence.compile_file("/tmp/hello.rb")
    #=> <RubyVM::InstructionSequence:<main>@/tmp/hello.rb>
**@overload** [] 

## compile_file_prism(*args ) [](#method-c-compile_file_prism)
Takes `file`, a String with the location of a Ruby source file, reads, parses
and compiles the file, and returns `iseq`, the compiled InstructionSequence
with source location metadata set. It parses and compiles using prism.

Optionally takes `options`, which can be `true`, `false` or a `Hash`, to
modify the default behavior of the Ruby iseq compiler.

For details regarding valid compile options see ::compile_option=.

    # /tmp/hello.rb
    puts "Hello, world!"

    # elsewhere
    RubyVM::InstructionSequence.compile_file_prism("/tmp/hello.rb")
    #=> <RubyVM::InstructionSequence:<main>@/tmp/hello.rb>
**@overload** [] 

## compile_option() [](#method-c-compile_option)
Returns a hash of default options used by the Ruby iseq compiler.

For details, see InstructionSequence.compile_option=.
**@overload** [] 

## compile_option=(opt ) [](#method-c-compile_option=)
Sets the default values for various optimizations in the Ruby iseq compiler.

Possible values for `options` include `true`, which enables all options,
`false` which disables all options, and `nil` which leaves all options
unchanged.

You can also pass a `Hash` of `options` that you want to change, any options
not present in the hash will be left unchanged.

Possible option names (which are keys in `options`) which can be set to `true`
or `false` include:

*   `:inline_const_cache`
*   `:instructions_unification`
*   `:operands_unification`
*   `:peephole_optimization`
*   `:specialized_instruction`
*   `:tailcall_optimization`

Additionally, `:debug_level` can be set to an integer.

These default options can be overwritten for a single run of the iseq compiler
by passing any of the above values as the `options` parameter to ::new,
::compile and ::compile_file.
**@overload** [] 

## compile_parsey(*args ) [](#method-c-compile_parsey)
Takes `source`, which can be a string of Ruby code, or an open `File` object.
that contains Ruby source code. It parses and compiles using parse.y.

Optionally takes `file`, `path`, and `line` which describe the file path, real
path and first line number of the ruby code in `source` which are metadata
attached to the returned `iseq`.

`file` is used for `__FILE__` and exception backtrace. `path` is used for
`require_relative` base. It is recommended these should be the same full path.

`options`, which can be `true`, `false` or a `Hash`, is used to modify the
default behavior of the Ruby iseq compiler.

For details regarding valid compile options see ::compile_option=.

    RubyVM::InstructionSequence.compile_parsey("a = 1 + 2")
    #=> <RubyVM::InstructionSequence:<compiled>@<compiled>>

    path = "test.rb"
    RubyVM::InstructionSequence.compile_parsey(File.read(path), path, File.expand_path(path))
    #=> <RubyVM::InstructionSequence:<compiled>@test.rb:1>

    file = File.open("test.rb")
    RubyVM::InstructionSequence.compile_parsey(file)
    #=> <RubyVM::InstructionSequence:<compiled>@<compiled>:1>

    path = File.expand_path("test.rb")
    RubyVM::InstructionSequence.compile_parsey(File.read(path), path, path)
    #=> <RubyVM::InstructionSequence:<compiled>@/absolute/path/to/test.rb:1>
**@overload** [] 

## compile_prism(*args ) [](#method-c-compile_prism)
Takes `source`, which can be a string of Ruby code, or an open `File` object.
that contains Ruby source code. It parses and compiles using prism.

Optionally takes `file`, `path`, and `line` which describe the file path, real
path and first line number of the ruby code in `source` which are metadata
attached to the returned `iseq`.

`file` is used for `__FILE__` and exception backtrace. `path` is used for
`require_relative` base. It is recommended these should be the same full path.

`options`, which can be `true`, `false` or a `Hash`, is used to modify the
default behavior of the Ruby iseq compiler.

For details regarding valid compile options see ::compile_option=.

    RubyVM::InstructionSequence.compile_prism("a = 1 + 2")
    #=> <RubyVM::InstructionSequence:<compiled>@<compiled>>

    path = "test.rb"
    RubyVM::InstructionSequence.compile_prism(File.read(path), path, File.expand_path(path))
    #=> <RubyVM::InstructionSequence:<compiled>@test.rb:1>

    file = File.open("test.rb")
    RubyVM::InstructionSequence.compile_prism(file)
    #=> <RubyVM::InstructionSequence:<compiled>@<compiled>:1>

    path = File.expand_path("test.rb")
    RubyVM::InstructionSequence.compile_prism(File.read(path), path, path)
    #=> <RubyVM::InstructionSequence:<compiled>@/absolute/path/to/test.rb:1>
**@overload** [] 

## disasm(body ) [](#method-c-disasm)
Takes `body`, a Method or Proc object, and returns a String with the human
readable instructions for `body`.

For a Method object:

    # /tmp/method.rb
    def hello
      puts "hello, world"
    end

    puts RubyVM::InstructionSequence.disasm(method(:hello))

Produces:

    == disasm: <RubyVM::InstructionSequence:hello@/tmp/method.rb>============
    0000 trace            8                                               (   1)
    0002 trace            1                                               (   2)
    0004 putself
    0005 putstring        "hello, world"
    0007 send             :puts, 1, nil, 8, <ic:0>
    0013 trace            16                                              (   3)
    0015 leave                                                            (   2)

For a Proc:

    # /tmp/proc.rb
    p = proc { num = 1 + 2 }
    puts RubyVM::InstructionSequence.disasm(p)

Produces:

    == disasm: <RubyVM::InstructionSequence:block in <main>@/tmp/proc.rb>===
    == catch table
    | catch type: redo   st: 0000 ed: 0012 sp: 0000 cont: 0000
    | catch type: next   st: 0000 ed: 0012 sp: 0000 cont: 0012
    |------------------------------------------------------------------------
    local table (size: 2, argc: 0 [opts: 0, rest: -1, post: 0, block: -1] s1)
    [ 2] num
    0000 trace            1                                               (   1)
    0002 putobject        1
    0004 putobject        2
    0006 opt_plus         <ic:1>
    0008 dup
    0009 setlocal         num, 0
    0012 leave
**@overload** [] 

**@overload** [] 

## disassemble(body ) [](#method-c-disassemble)
Takes `body`, a Method or Proc object, and returns a String with the human
readable instructions for `body`.

For a Method object:

    # /tmp/method.rb
    def hello
      puts "hello, world"
    end

    puts RubyVM::InstructionSequence.disasm(method(:hello))

Produces:

    == disasm: <RubyVM::InstructionSequence:hello@/tmp/method.rb>============
    0000 trace            8                                               (   1)
    0002 trace            1                                               (   2)
    0004 putself
    0005 putstring        "hello, world"
    0007 send             :puts, 1, nil, 8, <ic:0>
    0013 trace            16                                              (   3)
    0015 leave                                                            (   2)

For a Proc:

    # /tmp/proc.rb
    p = proc { num = 1 + 2 }
    puts RubyVM::InstructionSequence.disasm(p)

Produces:

    == disasm: <RubyVM::InstructionSequence:block in <main>@/tmp/proc.rb>===
    == catch table
    | catch type: redo   st: 0000 ed: 0012 sp: 0000 cont: 0000
    | catch type: next   st: 0000 ed: 0012 sp: 0000 cont: 0012
    |------------------------------------------------------------------------
    local table (size: 2, argc: 0 [opts: 0, rest: -1, post: 0, block: -1] s1)
    [ 2] num
    0000 trace            1                                               (   1)
    0002 putobject        1
    0004 putobject        2
    0006 opt_plus         <ic:1>
    0008 dup
    0009 setlocal         num, 0
    0012 leave
**@overload** [] 

**@overload** [] 

## iseq_load(*args ) [](#method-c-iseq_load)
## load(*args ) [](#method-c-load)
:nodoc:
## load_from_binary(str ) [](#method-c-load_from_binary)
Load an iseq object from binary format String object created by
RubyVM::InstructionSequence.to_binary.

This loader does not have a verifier, so that loading broken/modified binary
causes critical problem.

You should not load binary data provided by others. You should use binary data
translated by yourself.
**@overload** [] 

## load_from_binary_extra_data(str ) [](#method-c-load_from_binary_extra_data)
Load extra data embed into binary format String object.
**@overload** [] 

## load_iseq(filepath ) [](#method-c-load_iseq)
If RUBY_ISEQ_DUMP_DEBUG is "prism", we'll set up InstructionSequence.load_iseq
to intercept loading filepaths to compile using prism.
## new(*args ) [](#method-c-new)
Takes `source`, which can be a string of Ruby code, or an open `File` object.
that contains Ruby source code.

Optionally takes `file`, `path`, and `line` which describe the file path, real
path and first line number of the ruby code in `source` which are metadata
attached to the returned `iseq`.

`file` is used for `__FILE__` and exception backtrace. `path` is used for
`require_relative` base. It is recommended these should be the same full path.

`options`, which can be `true`, `false` or a `Hash`, is used to modify the
default behavior of the Ruby iseq compiler.

For details regarding valid compile options see ::compile_option=.

    RubyVM::InstructionSequence.compile("a = 1 + 2")
    #=> <RubyVM::InstructionSequence:<compiled>@<compiled>>

    path = "test.rb"
    RubyVM::InstructionSequence.compile(File.read(path), path, File.expand_path(path))
    #=> <RubyVM::InstructionSequence:<compiled>@test.rb:1>

    file = File.open("test.rb")
    RubyVM::InstructionSequence.compile(file)
    #=> <RubyVM::InstructionSequence:<compiled>@<compiled>:1>

    path = File.expand_path("test.rb")
    RubyVM::InstructionSequence.compile(File.read(path), path, path)
    #=> <RubyVM::InstructionSequence:<compiled>@/absolute/path/to/test.rb:1>
**@overload** [] 

**@overload** [] 

## of(body ) [](#method-c-of)
Returns the instruction sequence containing the given proc or method.

For example, using irb:

# a proc > p = proc { num = 1 + 2 } > RubyVM::InstructionSequence.of(p) > #=>
<RubyVM::InstructionSequence:block in irb_binding@(irb)>

# for a method > def foo(bar); puts bar; end >
RubyVM::InstructionSequence.of(method(:foo)) > #=>
<RubyVM::InstructionSequence:foo@(irb)>

Using ::compile_file:

# /tmp/iseq_of.rb def hello
    puts "hello, world"

end

$a_global_proc = proc { str = 'a' + 'b' }

# in irb > require '/tmp/iseq_of.rb'

# first the method hello > RubyVM::InstructionSequence.of(method(:hello)) >
#=> #<RubyVM::InstructionSequence:0x007fb73d7cb1d0>

# then the global proc > RubyVM::InstructionSequence.of($a_global_proc) > #=>
#<RubyVM::InstructionSequence:0x007fb73d7caf78>
## translate(i1 ) [](#method-c-translate)
## unlink_compiled_iseq(fname ) [](#method-c-unlink_compiled_iseq)

#Instance Methods
## absolute_path() [](#method-i-absolute_path)
Returns the absolute path of this instruction sequence.

`nil` if the iseq was evaluated from a string.

For example, using ::compile_file:

# /tmp/method.rb def hello
    puts "hello, world"

end

# in irb > iseq = RubyVM::InstructionSequence.compile_file('/tmp/method.rb') >
iseq.absolute_path #=> /tmp/method.rb

## base_label() [](#method-i-base_label)
Returns the base label of this instruction sequence.

For example, using irb:

iseq = RubyVM::InstructionSequence.compile('num = 1 + 2') #=>
<RubyVM::InstructionSequence:<compiled>@<compiled>> iseq.base_label #=>
"<compiled>"

Using ::compile_file:

# /tmp/method.rb def hello
    puts "hello, world"

end

# in irb > iseq = RubyVM::InstructionSequence.compile_file('/tmp/method.rb') >
iseq.base_label #=> <main>

## disasm() [](#method-i-disasm)
Returns the instruction sequence as a `String` in human readable form.

    puts RubyVM::InstructionSequence.compile('1 + 2').disasm

Produces:

    == disasm: <RubyVM::InstructionSequence:<compiled>@<compiled>>==========
    0000 trace            1                                               (   1)
    0002 putobject        1
    0004 putobject        2
    0006 opt_plus         <ic:1>
    0008 leave

**@overload** [] 

**@overload** [] 

## disasm_if_possible() [](#method-i-disasm_if_possible)

## disassemble() [](#method-i-disassemble)
Returns the instruction sequence as a `String` in human readable form.

    puts RubyVM::InstructionSequence.compile('1 + 2').disasm

Produces:

    == disasm: <RubyVM::InstructionSequence:<compiled>@<compiled>>==========
    0000 trace            1                                               (   1)
    0002 putobject        1
    0004 putobject        2
    0006 opt_plus         <ic:1>
    0008 leave

**@overload** [] 

**@overload** [] 

## each_child() [](#method-i-each_child)
Iterate all direct child instruction sequences. Iteration order is
implementation/version defined so that people should not rely on the order.

**@overload** [] 

## eval() [](#method-i-eval)
Evaluates the instruction sequence and returns the result.

    RubyVM::InstructionSequence.compile("1 + 2").eval #=> 3

**@overload** [] 

## first_lineno() [](#method-i-first_lineno)
Returns the number of the first source line where the instruction sequence was
loaded from.

For example, using irb:

iseq = RubyVM::InstructionSequence.compile('num = 1 + 2') #=>
<RubyVM::InstructionSequence:<compiled>@<compiled>> iseq.first_lineno #=> 1

## inspect() [](#method-i-inspect)
Returns a human-readable string representation of this instruction sequence,
including the #label and #path.

## label() [](#method-i-label)
Returns the label of this instruction sequence.

`<main>` if it's at the top level, `<compiled>` if it was evaluated from a
string.

For example, using irb:

iseq = RubyVM::InstructionSequence.compile('num = 1 + 2') #=>
<RubyVM::InstructionSequence:<compiled>@<compiled>> iseq.label #=>
"<compiled>"

Using ::compile_file:

# /tmp/method.rb def hello
    puts "hello, world"

end

# in irb > iseq = RubyVM::InstructionSequence.compile_file('/tmp/method.rb') >
iseq.label #=> <main>

## path() [](#method-i-path)
Returns the path of this instruction sequence.

`<compiled>` if the iseq was evaluated from a string.

For example, using irb:

iseq = RubyVM::InstructionSequence.compile('num = 1 + 2') #=>
<RubyVM::InstructionSequence:<compiled>@<compiled>> iseq.path #=> "<compiled>"

Using ::compile_file:

# /tmp/method.rb def hello
    puts "hello, world"

end

# in irb > iseq = RubyVM::InstructionSequence.compile_file('/tmp/method.rb') >
iseq.path #=> /tmp/method.rb

## script_lines() [](#method-i-script_lines)
It returns recorded script lines if it is available. The script lines are not
limited to the iseq range, but are entire lines of the source file.

Note that this is an API for ruby internal use, debugging, and research. Do
not use this for any other purpose. The compatibility is not guaranteed.

**@overload** [] 

## to_a() [](#method-i-to_a)
Returns an Array with 14 elements representing the instruction sequence with
the following data:

magic
:   A string identifying the data format. **Always
    `YARVInstructionSequence/SimpleDataFormat`.**


major_version
:   The major version of the instruction sequence.


minor_version
:   The minor version of the instruction sequence.


format_type
:   A number identifying the data format. **Always 1**.


misc
:   A hash containing:


    `:arg_size`
:       

the total number of arguments taken by the method or the block (0 if *iseq*
doesn't represent a method or block)
    [+:local_size+]

the number of local variables + 1
    [+:stack_max+]

used in calculating the stack depth at which a SystemStackError is thrown.

#label
:   The name of the context (block, method, class, module, etc.) that this
    instruction sequence belongs to.

    `<main>` if it's at the top level, `<compiled>` if it was evaluated from a
    string.


#path
:   The relative path to the Ruby file where the instruction sequence was
    loaded from.

    `<compiled>` if the iseq was evaluated from a string.


#absolute_path
:   The absolute path to the Ruby file where the instruction sequence was
    loaded from.

    `nil` if the iseq was evaluated from a string.


#first_lineno
:   The number of the first source line where the instruction sequence was
    loaded from.


type
:   The type of the instruction sequence.

    Valid values are `:top`, `:method`, `:block`, `:class`, `:rescue`,
    `:ensure`, `:eval`, `:main`, and `plain`.


locals
:   An array containing the names of all arguments and local variables as
    symbols.


params
:   An Hash object containing parameter information.

    More info about these values can be found in `vm_core.h`.


catch_table
:   A list of exceptions and control flow operators (rescue, next, redo,
    break, etc.).


bytecode
:   An array of arrays containing the instruction names and operands that make
    up the body of the instruction sequence.


Note that this format is MRI specific and version dependent.

**@overload** [] 

## to_binary(*args) [](#method-i-to_binary)
Returns serialized iseq binary format data as a String object. A corresponding
iseq object is created by RubyVM::InstructionSequence.load_from_binary()
method.

String extra_data will be saved with binary data. You can access this data
with RubyVM::InstructionSequence.load_from_binary_extra_data(binary).

Note that the translated binary data is not portable. You can not move this
binary data to another machine. You can not use the binary data which is
created by another version/another architecture of Ruby.

**@overload** [] 

## trace_points() [](#method-i-trace_points)
Return trace points in the instruction sequence. Return an array of [line,
event_symbol] pair.

**@overload** [] 

