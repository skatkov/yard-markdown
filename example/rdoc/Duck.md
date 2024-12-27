# Class: Duck
**Inherits:** Object
  
**Extended by:** Animal
    
**Includes:** Waterfowl
  

A duck is a Waterfowl Bird.

Features:

    bird::

      * speak
      * fly

    waterfowl::

      * swim


# Class Methods
## rubber_ducks() [](#method-c-rubber_ducks)
**@return** [Array<Duck>] list of all rubber ducks

# Attributes
## domestic[RW] [](#attribute-i-domestic)
True for domestic ducks.

## rubber[RW] [](#attribute-i-rubber)
True for rubber ducks.


#Instance Methods
## initialize(domestic, rubber) [](#method-i-initialize)
Creates a new duck.

**@param** [Boolean] 

**@param** [Boolean] 

**@return** [Duck] a new instance of Duck

## speak() [](#method-i-speak)
Duck overrides generic implementation.

**@yield** [speech] 

## swim() [](#method-i-swim)
Swimming helper.

## useful?() [](#method-i-useful?)
Checks if this duck is a useful one.

:call-seq:
    Bird.useful? -> bool

**@return** [Boolean] 

