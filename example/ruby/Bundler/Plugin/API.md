# Class: Bundler::Plugin::API
**Inherits:** Object
    



# Class Methods
## command(command , cls self) [](#method-c-command)
The plugins should declare that they handle a command through this helper.
**@param** [String] being handled by them

**@param** [Class] class that handles the command. If not
provided, the `self` class will be used.

## hook(event , &block ) [](#method-c-hook)
## source(source , cls self) [](#method-c-source)
The plugins should declare that they provide a installation source through
this helper.
**@param** [String] source type they provide

**@param** [Class] class that handles the source. If not
provided, the `self` class will be used.


#Instance Methods
## cache_dir() [](#method-i-cache_dir)
The cache dir to be used by the plugins for storage

**@return** [Pathname] path of the cache dir

## method_missing(name, *args, &blk) [](#method-i-method_missing)

## respond_to_missing?(name, include_privatefalse) [](#method-i-respond_to_missing?)

**@return** [Boolean] 

## tmp(*names) [](#method-i-tmp)
A tmp dir to be used by plugins Accepts names that get concatenated as suffix

**@return** [Pathname] object for the new directory created

