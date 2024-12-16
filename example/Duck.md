# Class: Duck
**Inherits:** Object
  
**Extended by:** Animal
    
**Includes:** Waterfowl
  
**Defined in:** example_rdoc.rb

A duck is a Waterfowl Bird.

Features:

    bird::

      * speak
      * fly

    waterfowl::

      * swim

# Public Instance Methods
## initialize(domestic, rubber) [](#method-i-initialize)
Creates a new duck.

**param** [Boolean] 
**param** [Boolean] 
**return** [Duck] a new instance of Duck
## speak() [](#method-i-speak)
Duck overrides generic implementation.

**yield** [speech] 
## swim() [](#method-i-swim)
Swimming helper.

## useful?() [](#method-i-useful?)
Checks if this duck is a useful one.

:call-seq:
    Bird.useful? -> bool

**return** [Boolean] 

# Public Class Methods
## rubber_ducks() [](#method-c-rubber_ducks)
**return** [Array<Duck>] list of all rubber ducks

# Attributes
## domestic[RW] [](#attribute-i-domestic)
True for domestic ducks.

## rubber[RW] [](#attribute-i-rubber)
True for rubber ducks.


# Constants
## DEFAULT_DUCK_VELOCITY [](#constant-DEFAULT_DUCK_VELOCITY)
Default velocity for a flying duck.


## DEFAULT_SPEED [](#constant-DEFAULT_SPEED)
Maximum speed for a swimming duck.


