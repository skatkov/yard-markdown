# Class: RubyVM::RJIT::Compiler
**Inherits:** Object
    



# Class Methods
## decode_insn(encoded ) [](#method-c-decode_insn)
# Attributes
## write_pos[RW] [](#attribute-i-write_pos)
Returns the value of attribute write_pos.


#Instance Methods
## branch_stub_hit(branch_stub, cfp, target0_p) [](#method-i-branch_stub_hit)
Compile a branch stub.

**@param** [RubyVM::RJIT::BranchStub] 

**@param** [] `RubyVM::RJIT::CPointer::Struct_rb_control_frame_t`

**@param** [TrueClass, FalseClass] 

**@return** [Integer] The starting address of the compiled branch stub

## compile(iseq, cfp) [](#method-i-compile)
Compile an ISEQ from its entry point.

**@param** [] `RubyVM::RJIT::CPointer::Struct_rb_iseq_t`

**@param** [] `RubyVM::RJIT::CPointer::Struct_rb_control_frame_t`

## entry_stub_hit(entry_stub, cfp) [](#method-i-entry_stub_hit)
Compile an entry.

**@param** [RubyVM::RJIT::EntryStub] 

## initialize() [](#method-i-initialize)

**@return** [Compiler] a new instance of Compiler

## invalidate_block(block) [](#method-i-invalidate_block)

## invalidate_blocks(iseq, pc) [](#method-i-invalidate_blocks)

**@param** [] `RubyVM::RJIT::CPointer::Struct_rb_iseq_t`

**@param** [Integer] 

