# Class: Bundler::Thor::Shell::HTML
**Inherits:** Bundler::Thor::Shell::Basic
    

Inherit from Bundler::Thor::Shell::Basic and add set_color behavior. Check
Bundler::Thor::Shell::Basic to see all available methods.



#Instance Methods
## ask(statement, colornil) [](#method-i-ask)
Ask something to the user and receives a response.

#### Example
    ask("What is your name?")

TODO: Implement #ask for Bundler::Thor::Shell::HTML

**@raise** [NotImplementedError] 

## set_color(string, *colors) [](#method-i-set_color)
Set color by using a string or one of the defined constants. If a third option
is set to true, it also adds bold to the string. This is based on Highline
implementation and it automatically appends CLEAR to the end of the returned
String.

