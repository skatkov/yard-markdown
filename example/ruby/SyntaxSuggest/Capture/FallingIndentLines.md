# Class: SyntaxSuggest::Capture::FallingIndentLines
**Inherits:** Object
    

Shows the context around code provided by "falling" indentation

If this is the original code lines:

    class OH
      def hello
        it "foo" do
      end
    end

And this is the line that is captured

    it "foo" do

It will yield its surrounding context:

    class OH
      def hello
      end
    end

Example:

    FallingIndentLines.new(
        block: block,
        code_lines: @code_lines
    ).call do |line|
      @lines_to_output << line
    end



#Instance Methods
## call(&yieldable) [](#method-i-call)

## initialize(code_lines:, block:) [](#method-i-initialize)

**@return** [FallingIndentLines] a new instance of FallingIndentLines

