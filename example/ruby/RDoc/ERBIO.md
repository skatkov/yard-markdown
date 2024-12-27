# Class: RDoc::ERBIO
**Inherits:** ERB
    

A subclass of ERB that writes directly to an IO.  Credit to Aaron Patterson
and Masatoshi SEKI.

To use:

    erbio = RDoc::ERBIO.new '<%= "hello world" %>', nil, nil

    File.open 'hello.txt', 'w' do |io|
      erbio.result binding
    end

Note that binding must enclose the io you wish to output on.



#Instance Methods
## initialize(str, trim_mode:nil, eoutvar:'io') [](#method-i-initialize)
Defaults `eoutvar` to 'io', otherwise is identical to ERB's initialize

**@return** [ERBIO] a new instance of ERBIO

## set_eoutvar(compiler, io_variable) [](#method-i-set_eoutvar)
Instructs `compiler` how to write to `io_variable`

