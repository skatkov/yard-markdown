# Class: Prism::CallNode
**Inherits:** Prism::Node
    




#Instance Methods
## full_message_loc() [](#method-i-full_message_loc)
When a call node has the attribute_write flag set, it means that the call is
using the attribute write syntax. This is either a method call to []= or a
method call to a method that ends with =. Either way, the = sign is present in
the source.

Prism returns the message_loc *without* the = sign attached, because there can
be any amount of space between the message and the = sign. However, sometimes
you want the location of the full message including the inner space and the =
sign. This method provides that.

