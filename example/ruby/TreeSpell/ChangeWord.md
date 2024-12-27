# Class: TreeSpell::ChangeWord
**Inherits:** Object
    

Changes a word with one of four actions: insertion, substitution, deletion and
transposition.



#Instance Methods
## deletion(i_place) [](#method-i-deletion)
delete character at index of i_place

## initialize(input) [](#method-i-initialize)
initialize with input string

**@return** [ChangeWord] a new instance of ChangeWord

## insertion(i_place, char) [](#method-i-insertion)
insert char after index of i_place

## substitution(i_place, char) [](#method-i-substitution)
substitute char at index of i_place

## transposition(i_place, direction) [](#method-i-transposition)
transpose char at i_place with char at i_place + direction if i_place +
direction is out of bounds just swap in other direction

