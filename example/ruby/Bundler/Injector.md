# Class: Bundler::Injector
**Inherits:** Object
    



# Class Methods
## inject(new_deps , options {}) [](#method-c-inject)
## remove(gems , options {}) [](#method-c-remove)

#Instance Methods
## initialize(deps, options{}) [](#method-i-initialize)

**@return** [Injector] a new instance of Injector

## inject(gemfile_path, lockfile_path) [](#method-i-inject)

**@param** [Pathname] The Gemfile in which to inject the new dependency.

**@param** [Pathname] The lockfile in which to inject the new dependency.

**@return** [Array] 

## remove(gemfile_path, lockfile_path) [](#method-i-remove)

**@param** [Pathname] The Gemfile from which to remove dependencies.

**@param** [Pathname] The lockfile from which to remove dependencies.

**@return** [Array] 

