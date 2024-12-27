# Class: OpenSSL::Provider
**Inherits:** Object
    

This class is the access to openssl's Provider See also,
https://www.openssl.org/docs/manmaster/man7/provider.html


# Class Methods
## load(name ) [](#method-c-load)
This method loads and initializes a provider
**@overload** [] 

## provider_names() [](#method-c-provider_names)
Returns an array of currently loaded provider names.
**@overload** [] 


#Instance Methods
## inspect() [](#method-i-inspect)
Pretty prints this provider.

**@overload** [] 

## name() [](#method-i-name)
Get the name of this provider.

if this provider is already unloaded, it raises
OpenSSL::Provider::ProviderError

**@overload** [] 

## unload() [](#method-i-unload)
This method unloads this provider.

if provider unload fails or already unloaded, it raises
OpenSSL::Provider::ProviderError

**@overload** [] 

