# Class: SyntaxSuggest::Capture::BeforeAfterKeywordEnds
**Inherits:** Object
    

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

Example:

    lines = BeforeAfterKeywordEnds.new(
      block: block,
      code_lines: code_lines
    ).call()



#Instance Methods
## call() [](#method-i-call)

## initialize(code_lines:, block:) [](#method-i-initialize)

**@return** [BeforeAfterKeywordEnds] a new instance of BeforeAfterKeywordEnds

