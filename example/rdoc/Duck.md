# Class Duck
<a id="class-Duck"></a>

**Inherits:** `Object`
**Extended by:** `Animal`
**Includes:** `Waterfowl`

A duck is a Waterfowl Bird.

Features:

    bird::

      * speak
      * fly

    waterfowl::

      * swim

## Constants
### `@@rubber_ducks`
<a id="classvariable--40-40rubber_ducks"></a>
<a id="@@rubber_ducks-classvariable"></a>

Global list of all rubber ducks.

Use when in trouble.
### `MAX_VELOCITY`
<a id="constant-MAX_VELOCITY"></a>
<a id="MAX_VELOCITY-constant"></a>

Maximum velocity for a flying duck.

## Attributes
### `domestic` [RW]
<a id="attribute-i-domestic"></a>
<a id="domestic-instance_method"></a>

True for domestic ducks.
### `rubber` [R]
<a id="attribute-i-rubber"></a>
<a id="rubber-instance_method"></a>

True for rubber ducks.

## Public Class Methods
### `rubber_ducks()`
<a id="method-c-rubber_ducks"></a>
<a id="rubber_ducks-class_method"></a>

- **@return** [Array<Duck>] list of all rubber ducks

## Public Instance Methods
### `initialize(domestic, rubber)`
<a id="method-i-initialize"></a>
<a id="initialize-instance_method"></a>

Creates a new duck.

- **@param** `domestic` [Boolean]
- **@param** `rubber` [Boolean]
- **@return** [Duck] a new instance of Duck
### `speak()`
<a id="method-i-speak"></a>
<a id="speak-instance_method"></a>

Duck overrides generic implementation.

- **@yield** [speech]
### `swim()`
<a id="method-i-swim"></a>
<a id="swim-instance_method"></a>

Swimming helper.
### `useful?()`
<a id="method-i-useful-3F"></a>
<a id="useful?-instance_method"></a>

Checks if this duck is a useful one.

:call-seq:
    Bird.useful? -> bool

- **@return** [Boolean]
