# Class: RDoc::Markup::ToAnsi
**Inherits:** RDoc::Markup::ToRdoc
    

Outputs RDoc markup with vibrant ANSI color!



#Instance Methods
## accept_list_item_end(list_item) [](#method-i-accept_list_item_end)
Overrides indent width to ensure output lines up correctly.

## accept_list_item_start(list_item) [](#method-i-accept_list_item_start)
Adds coloring to note and label list items

## init_tags() [](#method-i-init_tags)
Maps attributes to ANSI sequences

## initialize(markupnil) [](#method-i-initialize)
Creates a new ToAnsi visitor that is ready to output vibrant ANSI color!

**@return** [ToAnsi] a new instance of ToAnsi

## start_accepting() [](#method-i-start_accepting)
Starts accepting with a reset screen

