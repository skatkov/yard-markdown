# Class: Psych::JSON::Stream
**Inherits:** Psych::Visitors::JSONTree
  
**Extended by:** Psych::Streaming::ClassMethods
    
**Includes:** Psych::JSON::RubyEvents, Psych::Streaming
  



# Class Methods
## new(io ) [](#method-c-new)
Create a new streaming emitter.  Emitter will print to `io`.  See
Psych::Stream for an example.

#Instance Methods
## start(encodingNodes::Stream::UTF8) [](#method-i-start)
Start streaming using `encoding`

## visit_DateTime(o) [](#method-i-visit_DateTime)

## visit_String(o) [](#method-i-visit_String)

## visit_Time(o) [](#method-i-visit_Time)

