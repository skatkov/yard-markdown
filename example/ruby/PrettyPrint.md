# Class: PrettyPrint
**Inherits:** Object
    

This class implements a pretty printing algorithm. It finds line breaks and
nice indentations for grouped structure.

By default, the class assumes that primitive elements are strings and each
byte in the strings have single column in width. But it can be used for other
situations by giving suitable arguments for some methods:
*   newline object and space generation block for PrettyPrint.new
*   optional width argument for PrettyPrint#text
*   PrettyPrint#breakable

There are several candidate uses:
*   text formatting using proportional fonts
*   multibyte characters which has columns different to number of bytes
*   non-string formatting

## Bugs
*   Box based formatting?
*   Other (better) model/algorithm?

Report any bugs at http://bugs.ruby-lang.org

## References
Christian Lindig, Strictly Pretty, March 2000,
https://lindig.github.io/papers/strictly-pretty-2000.pdf

Philip Wadler, A prettier printer, March 1998,
https://homepages.inf.ed.ac.uk/wadler/topics/language-design.html#prettier

## Author
Tanaka Akira <akr@fsij.org>


# Class Methods
## format(output ''.dup, maxwidth 79, newline "\n", genspace lambda {|n| ' ' * n}) [](#method-c-format)
This is a convenience method which is same as follows:

    begin
      q = PrettyPrint.new(output, maxwidth, newline, &genspace)
      ...
      q.flush
      output
    end
**@yield** [q] 

## singleline_format(output ''.dup, maxwidth nil, newline nil, genspace nil) [](#method-c-singleline_format)
This is similar to PrettyPrint::format but the result has no breaks.

`maxwidth`, `newline` and `genspace` are ignored.

The invocation of `breakable` in the block doesn't break a line and is treated
as just an invocation of `text`.
**@yield** [q] 

# Attributes
## genspace[RW] [](#attribute-i-genspace)
A lambda or Proc, that takes one argument, of an Integer, and returns the
corresponding number of spaces.

By default this is:
    lambda {|n| ' ' * n}

## group_queue[RW] [](#attribute-i-group_queue)
The PrettyPrint::GroupQueue of groups in stack to be pretty printed

## indent[RW] [](#attribute-i-indent)
The number of spaces to be indented

## maxwidth[RW] [](#attribute-i-maxwidth)
The maximum width of a line, before it is separated in to a newline

This defaults to 79, and should be an Integer

## newline[RW] [](#attribute-i-newline)
The value that is appended to `output` to add a new line.

This defaults to "n", and should be String

## output[RW] [](#attribute-i-output)
The output object.

This defaults to '', and should accept the << method


#Instance Methods
## break_outmost_groups() [](#method-i-break_outmost_groups)
Breaks the buffer into lines that are shorter than #maxwidth

## breakable(sep' ', widthsep.length) [](#method-i-breakable)
This says "you can break a line here if necessary", and a `width`-column text
`sep` is inserted if a line is not broken at the point.

If `sep` is not specified, " " is used.

If `width` is not specified, `sep.length` is used. You will have to specify
this when `sep` is a multibyte character, for example.

## current_group() [](#method-i-current_group)
Returns the group most recently added to the stack.

Contrived example:
    out = ""
    => ""
    q = PrettyPrint.new(out)
    => #<PrettyPrint:0x82f85c0 @output="", @maxwidth=79, @newline="\n", @genspace=#<Proc:0x82f8368@/home/vbatts/.rvm/rubies/ruby-head/lib/ruby/2.0.0/prettyprint.rb:82 (lambda)>, @output_width=0, @buffer_width=0, @buffer=[], @group_stack=[#<PrettyPrint::Group:0x82f8138 @depth=0, @breakables=[], @break=false>], @group_queue=#<PrettyPrint::GroupQueue:0x82fb7c0 @queue=[[#<PrettyPrint::Group:0x82f8138 @depth=0, @breakables=[], @break=false>]]>, @indent=0>
    q.group {
      q.text q.current_group.inspect
      q.text q.newline
      q.group(q.current_group.depth + 1) {
        q.text q.current_group.inspect
        q.text q.newline
        q.group(q.current_group.depth + 1) {
          q.text q.current_group.inspect
          q.text q.newline
          q.group(q.current_group.depth + 1) {
            q.text q.current_group.inspect
            q.text q.newline
          }
        }
      }
    }
    => 284
     puts out
    #<PrettyPrint::Group:0x8354758 @depth=1, @breakables=[], @break=false>
    #<PrettyPrint::Group:0x8354550 @depth=2, @breakables=[], @break=false>
    #<PrettyPrint::Group:0x83541cc @depth=3, @breakables=[], @break=false>
    #<PrettyPrint::Group:0x8347e54 @depth=4, @breakables=[], @break=false>

## fill_breakable(sep' ', widthsep.length) [](#method-i-fill_breakable)
This is similar to #breakable except the decision to break or not is
determined individually.

Two #fill_breakable under a group may cause 4 results: (break,break),
(break,non-break), (non-break,break), (non-break,non-break). This is different
to #breakable because two #breakable under a group may cause 2 results:
(break,break), (non-break,non-break).

The text `sep` is inserted if a line is not broken at this point.

If `sep` is not specified, " " is used.

If `width` is not specified, `sep.length` is used. You will have to specify
this when `sep` is a multibyte character, for example.

## flush() [](#method-i-flush)
outputs buffered data.

## group(indent0, open_obj'', close_obj'', open_widthopen_obj.length, close_widthclose_obj.length) [](#method-i-group)
Groups line break hints added in the block. The line break hints are all to be
used or not.

If `indent` is specified, the method call is regarded as nested by
nest(indent) { ... }.

If `open_obj` is specified, `text open_obj, open_width` is called before
grouping. If `close_obj` is specified, `text close_obj, close_width` is called
after grouping.

## group_sub() [](#method-i-group_sub)
Takes a block and queues a new group that is indented 1 level further.

## initialize(output''.dup, maxwidth79, newline"\n", &genspace) [](#method-i-initialize)
Creates a buffer for pretty printing.

`output` is an output target. If it is not specified, '' is assumed. It should
have a << method which accepts the first argument `obj` of PrettyPrint#text,
the first argument `sep` of PrettyPrint#breakable, the first argument
`newline` of PrettyPrint.new, and the result of a given block for
PrettyPrint.new.

`maxwidth` specifies maximum line length. If it is not specified, 79 is
assumed. However actual outputs may overflow `maxwidth` if long non-breakable
texts are provided.

`newline` is used for line breaks. "n" is used if it is not specified.

The block is used to generate spaces. {|width| ' ' * width} is used if it is
not given.

**@return** [PrettyPrint] a new instance of PrettyPrint

## nest(indent) [](#method-i-nest)
Increases left margin after newline with `indent` for line breaks added in the
block.

## text(obj, widthobj.length) [](#method-i-text)
This adds `obj` as a text of `width` columns in width.

If `width` is not specified, obj.length is used.

