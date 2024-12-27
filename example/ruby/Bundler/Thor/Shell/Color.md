# Class: Bundler::Thor::Shell::Color
**Inherits:** Bundler::Thor::Shell::Basic
    

Inherit from Bundler::Thor::Shell::Basic and add set_color behavior. Check
Bundler::Thor::Shell::Basic to see all available methods.



#Instance Methods
## set_color(string, *colors) [](#method-i-set_color)
Set color by using a string or one of the defined constants. If a third option
is set to true, it also adds bold to the string. This is based on Highline
implementation and it automatically appends CLEAR to the end of the returned
String.

Pass foreground, background and bold options to this method as symbols.

Example:

    set_color "Hi!", :red, :on_white, :bold

The available colors are:

    :bold
    :black
    :red
    :green
    :yellow
    :blue
    :magenta
    :cyan
    :white
    :on_black
    :on_red
    :on_green
    :on_yellow
    :on_blue
    :on_magenta
    :on_cyan
    :on_white

