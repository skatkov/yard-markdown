# Class: Piece
**Inherits:** Object
    

describes a piece and caches information about its rotations to as to be
efficient for iteration ATTRIBUTES:
    rotations -- all the rotations of the piece
    type -- a numeic "name" of the piece
    masks -- an array by location of all legal rotational masks (a n inner array) for that location
    placed -- the mask that this piece was last placed at (not a location, but the actual mask used)


# Attributes
## masks[RW] [](#attribute-i-masks)
Returns the value of attribute masks.

## placed[RW] [](#attribute-i-placed)
Returns the value of attribute placed.

## rotations[RW] [](#attribute-i-rotations)
Returns the value of attribute rotations.

## type[RW] [](#attribute-i-type)
Returns the value of attribute type.


#Instance Methods
## fill_string(board_string) [](#method-i-fill_string)
given a board string, adds this piece to the board at whatever
location/rotation important: the outbound board string is 5 wide, the normal
location notation is six wide (padded)

## generate_rotations(directions) [](#method-i-generate_rotations)
rotates a set of directions through all six angles and adds a Rotation to the
list for each one

## initialize(directions, type) [](#method-i-initialize)

**@return** [Piece] a new instance of Piece

