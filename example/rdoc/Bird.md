# Class Bird <a id="class-Bird"></a>

**Inherits:** `Object`

The base class for all birds.

## Public Instance Methods
### `fly(direction, velocity)` <a id="method-i-fly"></a> <a id="fly-instance_method"></a>

Fly somewhere.

Flying is the most critical feature of birds.

:args: direction, velocity

:call-seq:
    Bird.fly(symbol, number) -> bool
    Bird.fly(string, number) -> bool

# Example

    fly(:south, 70)
### `speak()` <a id="method-i-speak"></a> <a id="speak-instance_method"></a>

Produce some noise. -- FIXME: maybe extract this to a base class `Animal`? ++

- **@yield** ["tweet"]
