# Class: RubyVM::RJIT::CodeBlock
**Inherits:** Object
    




#Instance Methods
## dump_disasm(from, to, io:STDOUT, color:true, test:false) [](#method-i-dump_disasm)

## include?(addr) [](#method-i-include?)

**@return** [Boolean] 

## initialize(mem_block:, mem_size:, outlined:false) [](#method-i-initialize)

**@param** [Integer] JIT buffer address

**@param** [Integer] JIT buffer size

**@param** [TrueClass, FalseClass] true for outlined CodeBlock

**@return** [CodeBlock] a new instance of CodeBlock

## set_write_addr(addr) [](#method-i-set_write_addr)

## with_write_addr(addr) [](#method-i-with_write_addr)

## write(asm) [](#method-i-write)

**@param** [RubyVM::RJIT::Assembler] 

## write_addr() [](#method-i-write_addr)

