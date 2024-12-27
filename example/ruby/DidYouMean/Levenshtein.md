# Module: DidYouMean::Levenshtein
    

:nodoc:


# Class Methods
## distance(str1 , str2 ) [](#method-c-distance)
This code is based directly on the Text gem implementation Copyright (c)
2006-2013 Paul Battley, Michael Neumann, Tim Fletcher.

Returns a value representing the "cost" of transforming str1 into str2
## min3(a , b , c ) [](#method-c-min3)
detects the minimum value out of three arguments. This method is faster than
`[a, b, c].min` and puts less GC pressure. See
https://github.com/ruby/did_you_mean/pull/1 for a performance benchmark.

