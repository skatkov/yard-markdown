# Exception: StopIteration
**Inherits:** IndexError
    

Raised to stop the iteration, in particular by Enumerator#next. It is rescued
by Kernel#loop.

    loop do
      puts "Hello"
      raise StopIteration
      puts "World"
    end
    puts "Done!"

*produces:*

    Hello
    Done!



#Instance Methods
## result() [](#method-i-result)
Returns the return value of the iterator.

    o = Object.new
    def o.each
      yield 1
      yield 2
      yield 3
      100
    end

    e = o.to_enum

    puts e.next                   #=> 1
    puts e.next                   #=> 2
    puts e.next                   #=> 3

    begin
      e.next
    rescue StopIteration => ex
      puts ex.result              #=> 100
    end

**@overload** [] 

