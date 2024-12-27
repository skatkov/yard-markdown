# Class: RubyVM::RJIT::Context
**Inherits:** Struct
    



# Attributes
## chain_depth[RW] [](#attribute-i-chain_depth)
Returns the value of attribute chain_depth

**@return** [Object] the current value of chain_depth

## local_types[RW] [](#attribute-i-local_types)
Returns the value of attribute local_types

**@return** [Object] the current value of local_types

## self_type[RW] [](#attribute-i-self_type)
Returns the value of attribute self_type

**@return** [Object] the current value of self_type

## sp_offset[RW] [](#attribute-i-sp_offset)
Returns the value of attribute sp_offset

**@return** [Object] the current value of sp_offset

## stack_size[RW] [](#attribute-i-stack_size)
Returns the value of attribute stack_size

**@return** [Object] the current value of stack_size

## temp_mapping[RW] [](#attribute-i-temp_mapping)
Returns the value of attribute temp_mapping

**@return** [Object] the current value of temp_mapping

## temp_types[RW] [](#attribute-i-temp_types)
Returns the value of attribute temp_types

**@return** [Object] the current value of temp_types


#Instance Methods
## clear_local_types() [](#method-i-clear_local_types)
Erase local variable type information eg: because of a call we can't track

## diff(dst) [](#method-i-diff)
Compute a difference score for two context objects

## dup() [](#method-i-dup)
Deep dup by default for safety

## get_local_type(idx) [](#method-i-get_local_type)
Get the currently tracked type for a local variable

## get_opnd_mapping(opnd) [](#method-i-get_opnd_mapping)
Get both the type and mapping (where the value originates) of an operand. This
is can be used with stack_push_mapping or set_opnd_mapping to copy a stack
value's type while maintaining the mapping.

## get_opnd_type(opnd) [](#method-i-get_opnd_type)
Get the type of an instruction operand

## initialize(stack_size:0, sp_offset:0, chain_depth:0, local_types:[Type::Unknown] * MAX_LOCAL_TYPES, temp_types:[Type::Unknown] * MAX_TEMP_TYPES, self_type:Type::Unknown, temp_mapping:[MapToStack] * MAX_TEMP_TYPES) [](#method-i-initialize)

**@return** [Context] a new instance of Context

## set_local_type(local_idx, local_type) [](#method-i-set_local_type)
Set the type of a local variable

## set_opnd_mapping(opnd, mapping_opnd_type) [](#method-i-set_opnd_mapping)
Overwrite both the type and mapping of a stack operand.

## shift_stack(argc) [](#method-i-shift_stack)

## sp_opnd(offset_bytes0) [](#method-i-sp_opnd)

## stack_opnd(depth_from_top) [](#method-i-stack_opnd)

## stack_pop(n1) [](#method-i-stack_pop)
Pop N values off the stack Return a pointer to the stack top before the pop
operation

## stack_push(val_type) [](#method-i-stack_push)
Push one new value on the temp stack Return a pointer to the new stack top

## stack_push_local(local_idx) [](#method-i-stack_push_local)
Push a local variable on the stack

## stack_push_mapping(mapping_temp_type) [](#method-i-stack_push_mapping)
Push one new value on the temp stack with an explicit mapping Return a pointer
to the new stack top

## stack_push_self() [](#method-i-stack_push_self)
Push the self value on the stack

## upgrade_opnd_type(opnd, opnd_type) [](#method-i-upgrade_opnd_type)
Upgrade (or "learn") the type of an instruction operand This value must be
compatible and at least as specific as the previously known type. If this
value originated from self, or an lvar, the learned type will be propagated
back to its source.

## with_stack_size(stack_size) [](#method-i-with_stack_size)
Create a new Context instance with a given stack_size and sp_offset adjusted
accordingly. This is useful when you want to virtually rewind a stack_size for
generating a side exit while considering past sp_offset changes on
gen_save_sp.

