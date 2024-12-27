# Class: Etc::Passwd
**Inherits:** Struct
    



# Class Methods
## each() [](#method-c-each)
Etc::Passwd.each { |struct| block }	->  Etc::Passwd Etc::Passwd.each			-> 
Enumerator

Iterates for each entry in the `/etc/passwd` file if a block is given.

If no block is given, returns the Enumerator.

The code block is passed an Passwd struct.

See Etc.getpwent above for details.

**Example:**

    require 'etc'

    Etc::Passwd.each {|u|
      puts u.name + " = " + u.gecos
    }

    Etc::Passwd.collect {|u| u.gecos}
    Etc::Passwd.collect {|u| u.gecos}

