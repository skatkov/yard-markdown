# Class: Duck
A duck is a Waterfowl Bird.

Features:

 bird::

   * speak
   * fly

 waterfowl::

   * swim

# Constants
| Name | Value | Description |
| ---- | ---- | ----------- |
|DEFAULT_DUCK_VELOCITY | 70 | Default velocity for a flying duck.

# Public Instance Methods

## domestic() [](#method-i-domestic)
True for domestic ducks.
## domestic=(value ) [](#method-i-domestic=)
True for domestic ducks.
## initialize(domestic , rubber ) [](#method-i-initialize)
Creates a new duck.
## rubber() [](#method-i-rubber)
True for rubber ducks.
## speak() [](#method-i-speak)
Duck overrides generic implementation.
## swim() [](#method-i-swim)
Swimming helper.
## useful?() [](#method-i-useful?)
Checks if this duck is a useful one.

:call-seq:
  Bird.useful? -> bool
# Public Class Methods
## rubber_ducks() [](#method-c-rubber_ducks)

