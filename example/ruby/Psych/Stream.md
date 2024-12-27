# Class: Psych::Stream
**Inherits:** Psych::Visitors::YAMLTree
  
**Extended by:** Psych::Streaming::ClassMethods
    
**Includes:** Psych::Streaming
  

Psych::Stream is a streaming YAML emitter.  It will not buffer your YAML, but
send it straight to an IO.

Here is an example use:

    stream = Psych::Stream.new($stdout)
    stream.start
    stream.push({:foo => 'bar'})
    stream.finish

YAML will be immediately emitted to $stdout with no buffering.

Psych::Stream#start will take a block and ensure that Psych::Stream#finish is
called, so you can do this form:

    stream = Psych::Stream.new($stdout)
    stream.start do |em|
      em.push(:foo => 'bar')
    end


# Class Methods
## new(io ) [](#method-c-new)
Create a new streaming emitter.  Emitter will print to `io`.  See
Psych::Stream for an example.

#Instance Methods
## start(encodingNodes::Stream::UTF8) [](#method-i-start)
Start streaming using `encoding`

