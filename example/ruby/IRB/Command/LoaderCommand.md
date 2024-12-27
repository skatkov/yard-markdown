# Class: IRB::Command::LoaderCommand
**Inherits:** IRB::Command::Base
    
**Includes:** IRB::Command::RubyArgsExtractor, IRB::IrbLoader
  




#Instance Methods
## irb_load(fn, privnil) [](#method-i-irb_load)
Loads the given file similarly to Kernel#load

**@raise** [LoadError] 

## load_file(path, privnil) [](#method-i-load_file)
Loads the given file in the current session's context and evaluates it.

See Irb#suspend_input_method for more information.

## old() [](#method-i-old)
:nodoc:

## raise_cmd_argument_error() [](#method-i-raise_cmd_argument_error)

**@raise** [CommandArgumentError] 

## ruby_args(arg) [](#method-i-ruby_args)

## search_file_from_ruby_path(fn) [](#method-i-search_file_from_ruby_path)
:nodoc:

## source_file(path) [](#method-i-source_file)
Loads a given file in the current session and displays the source lines

See Irb#suspend_input_method for more information.

## unwrap_string_literal(str) [](#method-i-unwrap_string_literal)
:nodoc:

