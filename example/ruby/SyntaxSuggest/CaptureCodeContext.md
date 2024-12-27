# Class: SyntaxSuggest::CaptureCodeContext
**Inherits:** Object
    

Turns a "invalid block(s)" into useful context

There are three main phases in the algorithm:

1.  Sanitize/format input source
2.  Search for invalid blocks
3.  Format invalid blocks into something meaningful

This class handles the third part.

The algorithm is very good at capturing all of a syntax error in a single
block in number 2, however the results can contain ambiguities. Humans are
good at pattern matching and filtering and can mentally remove extraneous
data, but they can't add extra data that's not present.

In the case of known ambiguious cases, this class adds context back to the
ambiguity so the programmer has full information.

Beyond handling these ambiguities, it also captures surrounding code context
information:

    puts block.to_s # => "def bark"

    context = CaptureCodeContext.new(
      blocks: block,
      code_lines: code_lines
    )

    lines = context.call.map(&:original)
    puts lines.join
    # =>
      class Dog
        def bark
      end


# Attributes
## code_lines[RW] [](#attribute-i-code_lines)
Returns the value of attribute code_lines.


#Instance Methods
## call() [](#method-i-call)

## capture_before_after_kws(block) [](#method-i-capture_before_after_kws)
Shows surrounding kw/end pairs

The purpose of showing these extra pairs is due to cases of ambiguity when
only one visible line is matched.

For example:

    1  class Dog
    2    def bark
    4    def eat
    5    end
    6  end

In this case either line 2 could be missing an `end` or line 4 was an extra
line added by mistake (it happens).

When we detect the above problem it shows the issue as only being on line 2

    2    def bark

Showing "neighbor" keyword pairs gives extra context:

    2    def bark
    4    def eat
    5    end

## capture_falling_indent(block) [](#method-i-capture_falling_indent)
Shows the context around code provided by "falling" indentation

Converts:

    it "foo" do

into:

    class OH
      def hello
        it "foo" do
      end
    end

## capture_first_kw_end_same_indent(block) [](#method-i-capture_first_kw_end_same_indent)
The logical inverse of `capture_last_end_same_indent`

When there is an invalid block with an `end` missing a keyword right after
another `end`, it is unclear where which end is missing the keyword.

Take this example:

    class Dog       # 1
        puts "woof" # 2
      end           # 3
    end             # 4

the problem line will be identified as:

    > end            # 4

This happens because lines 1, 2, and 3 are technically valid code and are
expanded first, deemed valid, and hidden. We need to un-hide the matching
keyword on line 1. Also work backwards and if there's a mis-matched end, show
it too

## capture_last_end_same_indent(block) [](#method-i-capture_last_end_same_indent)
When there is an invalid block with a keyword missing an end right before
another end, it is unclear where which keyword is missing the end

Take this example:

    class Dog       # 1
      def bark      # 2
        puts "woof" # 3
    end             # 4

However due to https://github.com/ruby/syntax_suggest/issues/32 the problem
line will be identified as:

    > class Dog       # 1

Because lines 2, 3, and 4 are technically valid code and are expanded first,
deemed valid, and hidden. We need to un-hide the matching end line 4. Also
work backwards and if there's a mis-matched keyword, show it too

## initialize(blocks:, code_lines:) [](#method-i-initialize)

**@return** [CaptureCodeContext] a new instance of CaptureCodeContext

## sorted_lines() [](#method-i-sorted_lines)

