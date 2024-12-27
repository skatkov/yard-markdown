# Class: RubyVM::RJIT::Assembler
**Inherits:** Object
  
**Extended by:** RubyVM::RJIT::OperandMatcher
    
**Includes:** RubyVM::RJIT::OperandMatcher
  

https://cdrdv2.intel.com/v1/dl/getContent/671110 Mostly an x86_64 assembler,
but this also has some stuff that is useful for any architecture.


# Class Methods
## extended_reg?(reg ) [](#method-c-extended_reg?)
**@return** [Boolean] 

## imm32?(imm ) [](#method-c-imm32?)
**@return** [Boolean] 

## imm64?(imm ) [](#method-c-imm64?)
**@return** [Boolean] 

## imm8?(imm ) [](#method-c-imm8?)
**@return** [Boolean] 

## r32?(reg ) [](#method-c-r32?)
**@return** [Boolean] 

## r64?(reg ) [](#method-c-r64?)
**@return** [Boolean] 

## reg_code_extended(reg ) [](#method-c-reg_code_extended)
# Attributes
## comments[RW] [](#attribute-i-comments)
Utilities


#Instance Methods
## add(dst, src) [](#method-i-add)
Instructions

## and(dst, src) [](#method-i-and)

## assemble(addr) [](#method-i-assemble)

## block(block) [](#method-i-block)
Mark the starting address of a block

## call(dst) [](#method-i-call)

## cmove(dst, src) [](#method-i-cmove)

## cmovg(dst, src) [](#method-i-cmovg)

## cmovge(dst, src) [](#method-i-cmovge)

## cmovl(dst, src) [](#method-i-cmovl)

## cmovle(dst, src) [](#method-i-cmovle)

## cmovne(dst, src) [](#method-i-cmovne)

## cmovnz(dst, src) [](#method-i-cmovnz)

## cmovz(dst, src) [](#method-i-cmovz)

## cmp(left, right) [](#method-i-cmp)

## comment(message) [](#method-i-comment)

## extended_reg?(reg) [](#method-i-extended_reg?)

**@return** [Boolean] 

## imm32?(imm) [](#method-i-imm32?)

**@return** [Boolean] 

## imm64?(imm) [](#method-i-imm64?)

**@return** [Boolean] 

## imm8?(imm) [](#method-i-imm8?)

**@return** [Boolean] 

## incr_counter(name) [](#method-i-incr_counter)

## initialize() [](#method-i-initialize)

**@return** [Assembler] a new instance of Assembler

## jbe(dst) [](#method-i-jbe)

## je(dst) [](#method-i-je)

## jl(dst) [](#method-i-jl)

## jmp(dst) [](#method-i-jmp)

## jne(dst) [](#method-i-jne)

## jnz(dst) [](#method-i-jnz)

## jo(dst) [](#method-i-jo)

## jz(dst) [](#method-i-jz)

## lea(dst, src) [](#method-i-lea)

## mov(dst, src) [](#method-i-mov)

## new_label(name) [](#method-i-new_label)

## or(dst, src) [](#method-i-or)

## pop(dst) [](#method-i-pop)

## pos_marker(&block) [](#method-i-pos_marker)

## push(src) [](#method-i-push)

## r32?(reg) [](#method-i-r32?)

**@return** [Boolean] 

## r64?(reg) [](#method-i-r64?)

**@return** [Boolean] 

## reg_code_extended(reg) [](#method-i-reg_code_extended)

## ret() [](#method-i-ret)

## sar(dst, src) [](#method-i-sar)

## size() [](#method-i-size)

## stub(stub) [](#method-i-stub)
Mark the starting/ending addresses of a stub

## sub(dst, src) [](#method-i-sub)

## test(left, right) [](#method-i-test)

## write_label(label) [](#method-i-write_label)

**@param** [RubyVM::RJIT::Assembler::Label] 

## xor(dst, src) [](#method-i-xor)

