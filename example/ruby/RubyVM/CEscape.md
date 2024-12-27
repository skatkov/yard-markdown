# Module: RubyVM::CEscape
    



# Class Methods
## as_tr_cpp(name ) [](#method-c-as_tr_cpp)
Mimic AS_TR_CPP() of autoconf.
## commentify(str ) [](#method-c-commentify)
generate comment, with escaps.
## gensym(prefix 'gensym_') [](#method-c-gensym)
Mimic gensym of CL.
## rstring2cstr(str ) [](#method-c-rstring2cstr)
Section 6.10.4 of  ISO/IEC 9899:1999 specifies that the file  name used for
#line directive shall be a "character string literal".  So this is needed.

I'm  not sure  how  many  chars are  allowed  here,  though.  The  standard
specifies 4095 chars at most, after string concatenation (section 5.2.4.1).
But it is easy to have a path that is longer than that.

Here  we ignore  the standard.  Just create  single string  literal of  any
needed length.

