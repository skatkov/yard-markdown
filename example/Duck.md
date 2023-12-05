# Class: Duck
| | |
| -----------------:  | :-----    |
| **Inherits:** | Object  |
| **Extended by:** | Animal |
| **Includes:** | Waterfowl |
| **Defined in:**    | example.rb    |


A duck is a Waterfowl Bird.

Features:

 bird::

   * speak
   * fly

 waterfowl::

   * swim

# Constants
## DEFAULT_DUCK_VELOCITY = [](#constant-DEFAULT_DUCK_VELOCITY)
(70) Default velocity for a flying duck.


# Public Instance Methods
## initialize(domestic , rubber ) [](#method-i-initialize)
Creates a new duck.
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

# Attributes
## domestic[RW] [](#attribute-i-domestic)
True for domestic ducks.
## rubber[RW] [](#attribute-i-rubber)
True for rubber ducks.
