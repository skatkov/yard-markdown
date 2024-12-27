# Exception: Ractor::RemoteError
**Inherits:** Ractor::Error
    

Raised on attempt to Ractor#take if there was an uncaught exception in the
Ractor. Its `cause` will contain the original exception, and `ractor` is the
original ractor it was raised in.

    r = Ractor.new { raise "Something weird happened" }

    begin
      r.take
    rescue => e
      p e             # => #<Ractor::RemoteError: thrown by remote Ractor.>
      p e.ractor == r # => true
      p e.cause       # => #<RuntimeError: Something weird happened>
    end


# Attributes
## ractor[RW] [](#attribute-i-ractor)
The Ractor an uncaught exception is raised in.


