# Class: RubyVM::RJIT::ExitCompiler
**Inherits:** Object
    




#Instance Methods
## compile_branch_stub(ctx, asm, branch_stub, target0_p) [](#method-i-compile_branch_stub)

**@param** [RubyVM::RJIT::Context] 

**@param** [RubyVM::RJIT::Assembler] 

**@param** [RubyVM::RJIT::BranchStub] 

**@param** [TrueClass, FalseClass] 

## compile_entry_exit(pc, ctx, asm, cause:) [](#method-i-compile_entry_exit)
Used for invalidating a block on entry.

**@param** [Integer] 

**@param** [RubyVM::RJIT::Assembler] 

## compile_entry_stub(asm, entry_stub) [](#method-i-compile_entry_stub)

**@param** [RubyVM::RJIT::Assembler] 

**@param** [RubyVM::RJIT::EntryStub] 

## compile_full_cfunc_return(asm) [](#method-i-compile_full_cfunc_return)
Fire cfunc events on invalidation by TracePoint

**@param** [RubyVM::RJIT::Assembler] 

## compile_leave_exit(asm) [](#method-i-compile_leave_exit)
Set to cfp->jit_return by default for leave insn

**@param** [RubyVM::RJIT::Assembler] 

## compile_side_exit(pc, ctx, asm) [](#method-i-compile_side_exit)

**@param** [RubyVM::RJIT::JITState] 

**@param** [RubyVM::RJIT::Context] 

**@param** [RubyVM::RJIT::Assembler] 

## initialize() [](#method-i-initialize)

**@return** [ExitCompiler] a new instance of ExitCompiler

