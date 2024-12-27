# Exception: Ractor::MovedError
**Inherits:** Ractor::Error
    

Raised on an attempt to access an object which was moved in Ractor#send or
Ractor.yield.

    r = Ractor.new { sleep }

    ary = [1, 2, 3]
    r.send(ary, move: true)
    ary.inspect
    # Ractor::MovedError (can not send any methods to a moved object)



