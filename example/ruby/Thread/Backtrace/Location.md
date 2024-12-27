# Class: Thread::Backtrace::Location
**Inherits:** Object
    




#Instance Methods
## absolute_path() [](#method-i-absolute_path)
Returns the full file path of this frame.

Same as #path, except that it will return absolute path even if the frame is
in the main script.

## base_label() [](#method-i-base_label)
Returns the base label of this frame, which is usually equal to the label,
without decoration.

Consider the following example:

def foo
    puts caller_locations(0).first.base_label

    1.times do
      puts caller_locations(0).first.base_label

      1.times do
        puts caller_locations(0).first.base_label
      end
    end

end

The result of calling `foo` is this:

foo foo foo

## inspect() [](#method-i-inspect)
Returns the same as calling `inspect` on the string representation of #to_str

## label() [](#method-i-label)
Returns the label of this frame.

Usually consists of method, class, module, etc names with decoration.

Consider the following example:

def foo
    puts caller_locations(0).first.label

    1.times do
      puts caller_locations(0).first.label

      1.times do
        puts caller_locations(0).first.label
      end
    end

end

The result of calling `foo` is this:

foo block in foo block (2 levels) in foo

## lineno() [](#method-i-lineno)
Returns the line number of this frame.

For example, using `caller_locations.rb` from Thread::Backtrace::Location

loc = c(0..1).first loc.lineno #=> 2

## path() [](#method-i-path)
Returns the file name of this frame. This will generally be an absolute path,
unless the frame is in the main script, in which case it will be the script
location passed on the command line.

For example, using `caller_locations.rb` from Thread::Backtrace::Location

loc = c(0..1).first loc.path #=> caller_locations.rb

## to_s() [](#method-i-to_s)
Returns a Kernel#caller style string representing this frame.

