# Module: ERB::Util
    
**Includes:** ERB::Escape
  

-- ERB::Util

A utility module for conversion routines, often handy in HTML generation.


# Class Methods
## h() [](#method-c-h)
## html_escape() [](#method-c-html_escape)
## u() [](#method-c-u)
A utility method for encoding the String *s* as a URL.

    require "erb"
    include ERB::Util

    puts url_encode("Programming Ruby:  The Pragmatic Programmer's Guide")

*Generates*

    Programming%20Ruby%3A%20%20The%20Pragmatic%20Programmer%27s%20Guide
## url_encode(s ) [](#method-c-url_encode)
A utility method for encoding the String *s* as a URL.

    require "erb"
    include ERB::Util

    puts url_encode("Programming Ruby:  The Pragmatic Programmer's Guide")

*Generates*

    Programming%20Ruby%3A%20%20The%20Pragmatic%20Programmer%27s%20Guide

