# Class: Fish
**Inherits:** Object
    

The base class for all fish.



#Instance Methods
## make_sound() [](#method-i-make_sound)
Make a sound.

**@return** [void] 

**@yield** [sound] The sound produced by the fish

**@yieldparam** [String] The actual sound

## swim(direction, speed) [](#method-i-swim)
Swim in a specific direction.

Swimming is the most critical feature of fish.

**@param** [Symbol, String] The direction to swim

**@param** [Integer] The speed at which to swim

**@return** [Boolean] Whether the swim was successful


**@example**
```ruby
swim(:north, 30)
```