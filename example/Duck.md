# Class: Duck
A duck is a Waterfowl Bird.

Features:

 bird::

   * speak
   * fly

 waterfowl::

   * swim

## Constant
| Name | Value | Description |
| ---- | ---- | ----------- |
|DEFAULT_DUCK_VELOCITY | 70 | Default velocity for a flying duck.

# Public Instance Methods
## #domestic()
True for domestic ducks.
## #domestic=(value )
True for domestic ducks.
## #initialize(domestic , rubber )
Creates a new duck.
## #rubber()
True for rubber ducks.
## #speak()
Duck overrides generic implementation.
## #swim()
Swimming helper.
## #useful?()
Checks if this duck is a useful one.

:call-seq:
  Bird.useful? -> bool

# Public Class Methods
## rubber_ducks()
