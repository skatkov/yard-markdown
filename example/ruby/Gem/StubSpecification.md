# Class: Gem::StubSpecification
**Inherits:** Gem::BasicSpecification
    
**Includes:** Gem::BetterPermissionError
  

Gem::StubSpecification reads the stub: line from the gemspec.  This prevents
us having to eval the entire gemspec in order to find out certain information.


# Class Methods
## default_gemspec_stub(filename , base_dir , gems_dir ) [](#method-c-default_gemspec_stub)
## gemspec_stub(filename , base_dir , gems_dir ) [](#method-c-gemspec_stub)
# Attributes
## base_dir[RW] [](#attribute-i-base_dir)
Returns the value of attribute base_dir.

## gems_dir[RW] [](#attribute-i-gems_dir)
Returns the value of attribute gems_dir.


#Instance Methods
## <=>(other) [](#method-i-<=>)
:nodoc:

## ==(other) [](#method-i-==)
:nodoc:

## activated?() [](#method-i-activated?)
True when this gem has been activated

**@return** [Boolean] 

## build_extensions() [](#method-i-build_extensions)
:nodoc:

## default_gem?() [](#method-i-default_gem?)

**@return** [Boolean] 

## extensions() [](#method-i-extensions)
Extensions for this gem

## full_name() [](#method-i-full_name)

## hash() [](#method-i-hash)
:nodoc:

## initialize(filename, base_dir, gems_dir, default_gem) [](#method-i-initialize)

**@return** [StubSpecification] a new instance of StubSpecification

## missing_extensions?() [](#method-i-missing_extensions?)

**@return** [Boolean] 

## name() [](#method-i-name)
Name of the gem

## platform() [](#method-i-platform)
Platform of the gem

## raw_require_paths() [](#method-i-raw_require_paths)
:nodoc:

## sort_obj() [](#method-i-sort_obj)
:nodoc:

## spec() [](#method-i-spec)
The full Gem::Specification for this gem, loaded from evalling its gemspec

## stubbed?() [](#method-i-stubbed?)
Is there a stub line present for this StubSpecification?

**@return** [Boolean] 

## valid?() [](#method-i-valid?)
Is this StubSpecification valid? i.e. have we found a stub line, OR does the
filename contain a valid gemspec?

**@return** [Boolean] 

## version() [](#method-i-version)
Version of the gem

