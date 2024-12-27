# Class: Gem::Ext::CargoBuilder
**Inherits:** Gem::Ext::Builder
    

This class is used by rubygems to build Rust extensions. It is a thin-wrapper
over the `cargo rustc` command which takes care of building Rust code in a way
that Ruby can use.


# Attributes
## profile[RW] [](#attribute-i-profile)
Returns the value of attribute profile.

## runner[RW] [](#attribute-i-runner)
Returns the value of attribute runner.

## spec[RW] [](#attribute-i-spec)
Returns the value of attribute spec.


#Instance Methods
## build(extension, dest_path, results, args[], lib_dirnil, cargo_dirDir.pwd, target_rbconfigGem.target_rbconfig) [](#method-i-build)

## build_env() [](#method-i-build_env)

## cargo_command(cargo_toml, dest_path, args[], crate_namenil) [](#method-i-cargo_command)

## initialize() [](#method-i-initialize)

**@return** [CargoBuilder] a new instance of CargoBuilder

