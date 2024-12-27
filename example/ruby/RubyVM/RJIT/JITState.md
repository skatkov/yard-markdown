# Class: RubyVM::RJIT::JITState
**Inherits:** Struct
    



# Attributes
## block[RW] [](#attribute-i-block)
Returns the value of attribute block

**@return** [Object] the current value of block

## cfp[RW] [](#attribute-i-cfp)
Returns the value of attribute cfp

**@return** [Object] the current value of cfp

## iseq[RW] [](#attribute-i-iseq)
Returns the value of attribute iseq

**@return** [Object] the current value of iseq

## pc[RW] [](#attribute-i-pc)
Returns the value of attribute pc

**@return** [Object] the current value of pc

## record_boundary_patch_point[RW] [](#attribute-i-record_boundary_patch_point)
Returns the value of attribute record_boundary_patch_point

**@return** [Object] the current value of record_boundary_patch_point

## side_exit_for_pc[RW] [](#attribute-i-side_exit_for_pc)
Returns the value of attribute side_exit_for_pc

**@return** [Object] the current value of side_exit_for_pc

## stack_size_for_pc[RW] [](#attribute-i-stack_size_for_pc)
Returns the value of attribute stack_size_for_pc

**@return** [Object] the current value of stack_size_for_pc


#Instance Methods
## at_current_insn?() [](#method-i-at_current_insn?)

**@return** [Boolean] 

## initialize(side_exit_for_pc:{}, record_boundary_patch_point:false) [](#method-i-initialize)

**@return** [JITState] a new instance of JITState

## insn() [](#method-i-insn)

## operand(index, signed:false, ruby:false) [](#method-i-operand)

## peek_at_block_handler(level) [](#method-i-peek_at_block_handler)

## peek_at_local(n) [](#method-i-peek_at_local)

## peek_at_self() [](#method-i-peek_at_self)

## peek_at_stack(depth_from_top) [](#method-i-peek_at_stack)

