# Module: IRB::ExtendCommandBundle
    

For backward compatibility, we need to keep this module:
*   As a container of helper methods
*   As a place to register commands with the deprecated def_extend_command
    method


# Class Methods
## def_extend_command(cmd_name , cmd_class , _ , *aliases ) [](#method-c-def_extend_command)
Drepcated. Use Command.regiser instead.

#Instance Methods
## irb_load(*opts, &b) [](#method-i-irb_load)
Loads the given file similarly to Kernel#load, see IrbLoader#irb_load

## irb_require(*opts, &b) [](#method-i-irb_require)
Loads the given file similarly to Kernel#require

