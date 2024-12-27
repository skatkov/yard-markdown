# Class: Rotation
**Inherits:** Object
    

class to represent all information about a particular rotation of a particular
piece


# Attributes
## start_masks[RW] [](#attribute-i-start_masks)
an array (by location) containing a bit mask for how the piece maps at the
given location. if the rotation is invalid at that location the mask will
contain false


#Instance Methods
## compute_required(mask, offset) [](#method-i-compute_required)

## flood_fill(board, location) [](#method-i-flood_fill)

## get_values(directions) [](#method-i-get_values)
given a set of directions places the piece (as defined by a set of directions)
on the board at a location that will not take it off the edge

## initialize(directions) [](#method-i-initialize)

**@return** [Rotation] a new instance of Rotation

## mask_for_offsets(offsets) [](#method-i-mask_for_offsets)
produce a bitmask representation of an array of offset locations

## normalize_offsets(values) [](#method-i-normalize_offsets)
returns a set of offsets relative to the top-left most piece of the rotation
(by even or odd rows) this is hard to explain. imagine we have this partial
board:
    0 0 0 0 0 x        [positions 0-5]
     0 0 1 1 0 x       [positions 6-11]
    0 0 1 0 0 x        [positions 12-17]
     0 1 0 0 0 x       [positions 18-23]
    0 1 0 0 0 x        [positions 24-29]
     0 0 0 0 0 x       [positions 30-35]
        ...

The top-left of the piece is at position 8, the board would be passed as a set
of positions (values array) containing [8,9,14,19,25] not necessarily in that
sorted order.  Since that array starts on an odd row, the offsets for an odd
row are: [0,1,6,11,17] obtained by subtracting 8 from everything.  Now imagine
the piece shifted up and to the right so it's on an even row:
    0 0 0 1 1 x        [positions 0-5]
     0 0 1 0 0 x       [positions 6-11]
    0 0 1 0 0 x        [positions 12-17]
     0 1 0 0 0 x       [positions 18-23]
    0 0 0 0 0 x        [positions 24-29]
     0 0 0 0 0 x       [positions 30-35]
        ...

Now the positions are [3,4,8,14,19] which after subtracting the lowest value
(3) gives [0,1,5,11,16] thus, the offsets for this particular piece are (in
even, odd order) [[0,1,5,11,16],](0,1,6,11,17) which is what this function
would return

## offsets(location) [](#method-i-offsets)
given a location, produces a list of relative locations covered by the piece
at this rotation

## start_adjust(directions) [](#method-i-start_adjust)
finds a "safe" position that a position as described by a list of directions
can be placed without falling off any edge of the board.  the values returned
a location to place the first piece at so it will fit after making the
described moves

