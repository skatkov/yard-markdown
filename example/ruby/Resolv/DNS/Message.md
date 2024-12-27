# Class: Resolv::DNS::Message
**Inherits:** Object
    

:nodoc:


# Class Methods
## decode(m ) [](#method-c-decode)
# Attributes
## aa[RW] [](#attribute-i-aa)
Returns the value of attribute aa.

## additional[RW] [](#attribute-i-additional)
Returns the value of attribute additional.

## answer[RW] [](#attribute-i-answer)
Returns the value of attribute answer.

## authority[RW] [](#attribute-i-authority)
Returns the value of attribute authority.

## id[RW] [](#attribute-i-id)
Returns the value of attribute id.

## opcode[RW] [](#attribute-i-opcode)
Returns the value of attribute opcode.

## qr[RW] [](#attribute-i-qr)
Returns the value of attribute qr.

## question[RW] [](#attribute-i-question)
Returns the value of attribute question.

## ra[RW] [](#attribute-i-ra)
Returns the value of attribute ra.

## rcode[RW] [](#attribute-i-rcode)
Returns the value of attribute rcode.

## rd[RW] [](#attribute-i-rd)
Returns the value of attribute rd.

## tc[RW] [](#attribute-i-tc)
Returns the value of attribute tc.


#Instance Methods
## ==(other) [](#method-i-==)

## add_additional(name, ttl, data) [](#method-i-add_additional)

## add_answer(name, ttl, data) [](#method-i-add_answer)

## add_authority(name, ttl, data) [](#method-i-add_authority)

## add_question(name, typeclass) [](#method-i-add_question)

## each_additional() [](#method-i-each_additional)

## each_answer() [](#method-i-each_answer)

## each_authority() [](#method-i-each_authority)

## each_question() [](#method-i-each_question)

## each_resource() [](#method-i-each_resource)

## encode() [](#method-i-encode)

## initialize(id(@@identifier += 1) & 0xffff) [](#method-i-initialize)

**@return** [Message] a new instance of Message

