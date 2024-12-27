# Exception: Gem::Net::WriteTimeout
**Inherits:** Gem::Timeout::Error
    

WriteTimeout, a subclass of Gem::Timeout::Error, is raised if a chunk of the
response cannot be written within the write_timeout.  Not raised on Windows.


# Attributes
## io[RW] [](#attribute-i-io)
Returns the value of attribute io.


#Instance Methods
## initialize(ionil) [](#method-i-initialize)

**@return** [WriteTimeout] a new instance of WriteTimeout

## message() [](#method-i-message)

