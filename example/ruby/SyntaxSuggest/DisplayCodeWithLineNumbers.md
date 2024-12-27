# Class: SyntaxSuggest::DisplayCodeWithLineNumbers
**Inherits:** Object
    

Outputs code with highlighted lines

Whatever is passed to this class will be rendered even if it is "marked
invisible" any filtering of output should be done before calling this class.

    DisplayCodeWithLineNumbers.new(
      lines: lines,
      highlight_lines: [lines[2], lines[3]]
    ).call
    # =>
        1
        2  def cat
      > 3    Dir.chdir
      > 4    end
        5  end
        6



#Instance Methods
## call() [](#method-i-call)

## initialize(lines:, highlight_lines:[], terminal:false) [](#method-i-initialize)

**@return** [DisplayCodeWithLineNumbers] a new instance of DisplayCodeWithLineNumbers

