# Class: Resolv::DNS::Resource::MINFO
**Inherits:** Resolv::DNS::Resource
    

Mailing list or mailbox information.


# Class Methods
## decode_rdata(msg ) [](#method-c-decode_rdata)
:nodoc:
# Attributes
## emailbx[RW] [](#attribute-i-emailbx)
Mailbox to use for error messages related to the mail list or mailbox.

## rmailbx[RW] [](#attribute-i-rmailbx)
Domain name responsible for this mail list or mailbox.


#Instance Methods
## encode_rdata(msg) [](#method-i-encode_rdata)
:nodoc:

## initialize(rmailbx, emailbx) [](#method-i-initialize)

**@return** [MINFO] a new instance of MINFO

