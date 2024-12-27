# Class: SyntaxSuggest::PriorityQueue
**Inherits:** Object
    

Holds elements in a priority heap on insert

Instead of constantly calling `sort!`, put the element where it belongs the
first time around

Example:

    queue = PriorityQueue.new
    queue << 33
    queue << 44
    queue << 1

    puts queue.peek # => 44


# Attributes
## elements[RW] [](#attribute-i-elements)
Returns the value of attribute elements.


#Instance Methods
## <<(element) [](#method-i-<<)

## empty?() [](#method-i-empty?)

**@return** [Boolean] 

## exchange(source, target) [](#method-i-exchange)

## initialize() [](#method-i-initialize)

**@return** [PriorityQueue] a new instance of PriorityQueue

## length() [](#method-i-length)

## peek() [](#method-i-peek)

## pop() [](#method-i-pop)

## sorted() [](#method-i-sorted)
Used for testing, extremely not performant

## to_a() [](#method-i-to_a)

