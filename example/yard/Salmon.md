# Class: Salmon
**Inherits:** Fish
    
**Includes:** Aquatic
  

A salmon is an Aquatic Fish.

## Features

*   **Fish**
    *   make_sound
    *   swim
*   **Aquatic**
    *   swim (overridden)


# Class Methods
## wild_salmon() [](#method-c-wild_salmon)
**@return** [Array<Salmon>] List of all wild salmon

# Attributes
## farmed[RW] [](#attribute-i-farmed)

**@return** [Boolean] True for farmed salmon

## wild[RW] [](#attribute-i-wild)

**@return** [Boolean] True for wild salmon


#Instance Methods
## initialize(farmed, wild) [](#method-i-initialize)
Creates a new salmon.

**@param** [Boolean] Whether the salmon is farmed

**@param** [Boolean] Whether the salmon is wild

**@return** [Salmon] a new instance of Salmon

## make_sound() [](#method-i-make_sound)
Salmon overrides generic implementation.

**@return** [void] 

**@yield** [sound] The sound produced by the salmon

**@yieldparam** [String] The actual sound

## sustainable?() [](#method-i-sustainable?)
Checks if this salmon is sustainable.

**@return** [Boolean] Whether the salmon is sustainable

## swim() [](#method-i-swim)
Swim in the water.

**@return** [void] 

