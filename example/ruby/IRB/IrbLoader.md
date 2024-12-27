# Module: IRB::IrbLoader
    

Provides a few commands for loading files within an irb session.

See ExtendCommandBundle for more information.



#Instance Methods
## irb_load(fn, privnil) [](#method-i-irb_load)
Loads the given file similarly to Kernel#load

**@raise** [LoadError] 

## load_file(path, privnil) [](#method-i-load_file)
Loads the given file in the current session's context and evaluates it.

See Irb#suspend_input_method for more information.

## old() [](#method-i-old)
:nodoc:

## search_file_from_ruby_path(fn) [](#method-i-search_file_from_ruby_path)
:nodoc:

## source_file(path) [](#method-i-source_file)
Loads a given file in the current session and displays the source lines

See Irb#suspend_input_method for more information.

