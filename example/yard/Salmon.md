# Class Salmon <a id="class-Salmon"></a>

**Inherits:** `Fish`
**Includes:** `Aquatic`

A salmon is an Aquatic Fish.

## Features

*   **Fish**
    *   make_sound
    *   swim
*   **Aquatic**
    *   swim (overridden)

## Constants
### Salmon specific attributes
#### `MAX_SPEED` <a id="constant-MAX_SPEED"></a> <a id="MAX_SPEED-constant"></a>
- **@return** [Integer] Maximum speed for a swimming salmon
### General
#### `@@wild_salmon` <a id="classvariable--40-40wild_salmon"></a> <a id="@@wild_salmon-classvariable"></a>
Global list of all wild salmon.

Use for conservation efforts.

## Attributes
### Salmon specific attributes
#### `farmed` [RW] <a id="attribute-i-farmed"></a> <a id="farmed-instance_method"></a>
- **@return** [Boolean] True for farmed salmon

#### `wild` [R] <a id="attribute-i-wild"></a> <a id="wild-instance_method"></a>
- **@return** [Boolean] True for wild salmon

## Public Class Methods
### `wild_salmon()` <a id="method-c-wild_salmon"></a> <a id="wild_salmon-class_method"></a>
- **@return** [Array<Salmon>] List of all wild salmon

## Public Instance Methods
### Fish overrides
#### `make_sound()` <a id="method-i-make_sound"></a> <a id="make_sound-instance_method"></a>
Salmon overrides generic implementation.
- **@return** [void]
- **@yield** [sound] The sound produced by the salmon
- **@yieldparam** `sound` [String] The actual sound
### General
#### `initialize(farmed, wild)` <a id="method-i-initialize"></a> <a id="initialize-instance_method"></a>
Creates a new salmon.
- **@param** `farmed` [Boolean] Whether the salmon is farmed
- **@param** `wild` [Boolean] Whether the salmon is wild
- **@return** [Salmon] a new instance of Salmon

#### `sustainable?()` <a id="method-i-sustainable-3F"></a> <a id="sustainable?-instance_method"></a>
Checks if this salmon is sustainable.
- **@return** [Boolean] Whether the salmon is sustainable
