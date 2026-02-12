# Class Fish
<a id="class-Fish"></a>

**Inherits:** `Object`

The base class for all fish.

## Public Instance Methods
### `make_sound()`
<a id="method-i-make_sound"></a>
<a id="make_sound-instance_method"></a>

Make a sound.

- **@return** [void]
- **@yield** [sound] The sound produced by the fish
- **@yieldparam** `sound` [String] The actual sound
### `swim(direction, speed)`
<a id="method-i-swim"></a>
<a id="swim-instance_method"></a>

Swim in a specific direction.

Swimming is the most critical feature of fish.

- **@param** `direction` [Symbol, String] The direction to swim
- **@param** `speed` [Integer] The speed at which to swim
- **@return** [Boolean] Whether the swim was successful

**@example**
```ruby
swim(:north, 30)
```
