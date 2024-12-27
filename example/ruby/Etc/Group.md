# Class: Etc::Group
**Inherits:** Struct
    



# Class Methods
## each() [](#method-c-each)
Etc::Group.each { |group| block }   ->	Etc::Group Etc::Group.each			   
->	Enumerator

Iterates for each entry in the `/etc/group` file if a block is given.

If no block is given, returns the Enumerator.

The code block is passed a Group struct.

**Example:**

    require 'etc'

    Etc::Group.each {|g|
      puts g.name + ": " + g.mem.join(', ')
    }

    Etc::Group.collect {|g| g.name}
    Etc::Group.select {|g| !g.mem.empty?}

