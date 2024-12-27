# Module: Bundler::Thor::Shell
    



# Attributes
## shell[RW] [](#attribute-i-shell)
Holds the shell for the given Bundler::Thor instance. If no shell is given, it
gets a default shell from Bundler::Thor::Base.shell.


#Instance Methods
## initialize(args[], options{}, config{}) [](#method-i-initialize)
Add shell to initialize config values.

#### Configuration
shell<Object>
:   An instance of the shell to be used.


#### Examples

    class MyScript < Bundler::Thor
      argument :first, :type => :numeric
    end

    MyScript.new [1.0], { :foo => :bar }, :shell => Bundler::Thor::Shell::Basic.new

## with_padding() [](#method-i-with_padding)
Yields the given block with padding.

