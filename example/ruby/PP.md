# Class: PP
**Inherits:** PrettyPrint
    
**Includes:** PP::PPMethods
  

A pretty-printer for Ruby objects.

## What PP Does

Standard output by #p returns this:
    #<PP:0x81fedf0 @genspace=#<Proc:0x81feda0>, @group_queue=#<PrettyPrint::GroupQueue:0x81fed3c @queue=[[#<PrettyPrint::Group:0x81fed78 @breakables=[], @depth=0, @break=false>], []]>, @buffer=[], @newline="\n", @group_stack=[#<PrettyPrint::Group:0x81fed78 @breakables=[], @depth=0, @break=false>], @buffer_width=0, @indent=0, @maxwidth=79, @output_width=2, @output=#<IO:0x8114ee4>>

Pretty-printed output returns this:
    #<PP:0x81fedf0
     @buffer=[],
     @buffer_width=0,
     @genspace=#<Proc:0x81feda0>,
     @group_queue=
      #<PrettyPrint::GroupQueue:0x81fed3c
       @queue=
        [[#<PrettyPrint::Group:0x81fed78 @break=false, @breakables=[], @depth=0>],
         []]>,
     @group_stack=
      [#<PrettyPrint::Group:0x81fed78 @break=false, @breakables=[], @depth=0>],
     @indent=0,
     @maxwidth=79,
     @newline="\n",
     @output=#<IO:0x8114ee4>,
     @output_width=2>

## Usage

    pp(obj)             #=> obj
    pp obj              #=> obj
    pp(obj1, obj2, ...) #=> [obj1, obj2, ...]
    pp()                #=> nil

Output `obj(s)` to `$>` in pretty printed format.

It returns `obj(s)`.

## Output Customization

To define a customized pretty printing function for your classes, redefine
method `#pretty_print(pp)` in the class. Note that `require 'pp'` is needed
before redefining `#pretty_print(pp)`.

`#pretty_print` takes the `pp` argument, which is an instance of the PP class.
The method uses #text, #breakable, #nest, #group and #pp to print the object.

## Pretty-Print JSON

To pretty-print JSON refer to JSON#pretty_generate.

## Author
Tanaka Akira <akr@fsij.org>


# Class Methods
## mcall(obj , mod , meth , *args , &block ) [](#method-c-mcall)
:stopdoc:
## pp(obj , out $>, width width_for(out)) [](#method-c-pp)
Outputs `obj` to `out` in pretty printed format of `width` columns in width.

If `out` is omitted, `$>` is assumed. If `width` is omitted, the width of
`out` is assumed (see width_for).

PP.pp returns `out`.
## singleline_pp(obj , out $>) [](#method-c-singleline_pp)
Outputs `obj` to `out` like PP.pp but with no indent and newline.

PP.singleline_pp returns `out`.
## width_for(out ) [](#method-c-width_for)
Returns the usable width for `out`. As the width of `out`:
1.  If `out` is assigned to a tty device, its width is used.
2.  Otherwise, or it could not get the value, the `COLUMN` environment
    variable is assumed to be set to the width.
3.  If `COLUMN` is not set to a non-zero number, 80 is assumed.

And finally, returns the above width value - 1.
*   This -1 is for Windows command prompt, which moves the cursor to the next
    line if it reaches the last column.
# Attributes
## sharing_detection[RW] [](#attribute-c-sharing_detection)
Returns the sharing detection flag as a boolean value. It is false by default.


#Instance Methods
## check_inspect_key(id) [](#method-i-check_inspect_key)
Check whether the object_id `id` is in the current buffer of objects to be
pretty printed. Used to break cycles in chains of objects to be pretty
printed.

## comma_breakable() [](#method-i-comma_breakable)
A convenience method which is same as follows:

    text ','
    breakable

## guard_inspect_key() [](#method-i-guard_inspect_key)
Yields to a block and preserves the previous set of objects being printed.

## object_address_group(obj, &block) [](#method-i-object_address_group)
A convenience method, like object_group, but also reformats the Object's
object_id.

## object_group(obj, &block) [](#method-i-object_group)
A convenience method which is same as follows:

    group(1, '#<' + obj.class.name, '>') { ... }

## pop_inspect_key(id) [](#method-i-pop_inspect_key)
Removes an object from the set of objects being pretty printed.

## pp(obj) [](#method-i-pp)
Adds `obj` to the pretty printing buffer using Object#pretty_print or
Object#pretty_print_cycle.

Object#pretty_print_cycle is used when `obj` is already printed, a.k.a the
object reference chain has a cycle.

## pp_hash(obj) [](#method-i-pp_hash)
A pretty print for a Hash

## pp_hash_pair(k, v) [](#method-i-pp_hash_pair)
A pretty print for a pair of Hash

## pp_object(obj) [](#method-i-pp_object)
A present standard failsafe for pretty printing any given Object

## push_inspect_key(id) [](#method-i-push_inspect_key)
Adds the object_id `id` to the set of objects being pretty printed, so as to
not repeat objects.

## seplist(list, sepnil, iter_method:each) [](#method-i-seplist)
Adds a separated list. The list is separated by comma with breakable space, by
default.

#seplist iterates the `list` using `iter_method`. It yields each object to the
block given for #seplist. The procedure `separator_proc` is called between
each yields.

If the iteration is zero times, `separator_proc` is not called at all.

If `separator_proc` is nil or not given, +lambda { comma_breakable }+ is used.
If `iter_method` is not given, :each is used.

For example, following 3 code fragments has similar effect.

    q.seplist([1,2,3]) {|v| xxx v }

    q.seplist([1,2,3], lambda { q.comma_breakable }, :each) {|v| xxx v }

    xxx 1
    q.comma_breakable
    xxx 2
    q.comma_breakable
    xxx 3

