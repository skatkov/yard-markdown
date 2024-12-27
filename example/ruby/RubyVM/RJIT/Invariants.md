# Class: RubyVM::RJIT::Invariants
**Inherits:** Object
    



# Class Methods
## assume_bop_not_redefined(jit , klass , op ) [](#method-c-assume_bop_not_redefined)
**@param** [RubyVM::RJIT::JITState] 

**@param** [Integer] 

**@param** [Integer] 

## assume_method_basic_definition(jit , klass , mid ) [](#method-c-assume_method_basic_definition)
**@param** [RubyVM::RJIT::JITState] 

## assume_method_lookup_stable(jit , cme ) [](#method-c-assume_method_lookup_stable)
**@param** [RubyVM::RJIT::JITState] 

## assume_stable_constant_names(jit , idlist ) [](#method-c-assume_stable_constant_names)
## ensure_block_entry_exit(jit , cause: ) [](#method-c-ensure_block_entry_exit)
**@param** [RubyVM::RJIT::JITState] 

**@param** [RubyVM::RJIT::Block] 

## initialize(cb , ocb , compiler , exit_compiler ) [](#method-c-initialize)
Called by RubyVM::RJIT::Compiler to lazily initialize this
**@param** [CodeBlock] 

**@param** [CodeBlock] 

**@param** [RubyVM::RJIT::Compiler] 

**@param** [RubyVM::RJIT::ExitCompiler] 

## on_cme_invalidate(cme ) [](#method-c-on_cme_invalidate)
## on_constant_ic_update(iseq , ic , insn_idx ) [](#method-c-on_constant_ic_update)
## on_constant_state_changed(id ) [](#method-c-on_constant_state_changed)
## on_tracing_invalidate_all() [](#method-c-on_tracing_invalidate_all)
## on_update_references() [](#method-c-on_update_references)
## record_global_inval_patch(asm , target ) [](#method-c-record_global_inval_patch)
**@param** [RubyVM::RJIT::Assembler] 


