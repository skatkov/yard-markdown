# Module: Bundler::FileUtils::DryRun
  
**Extended by:** Bundler::FileUtils::DryRun
    
**Includes:** Bundler::FileUtils, Bundler::FileUtils::LowMethods
  

This module has all methods of Bundler::FileUtils module, but never changes
files/directories, with printing message before acting. This equates to
passing the `:noop` and `:verbose` flag to methods in Bundler::FileUtils.


# Class Methods
## apply_mask(mode , user_mask , op , mode_mask ) [](#method-c-apply_mask)
:nodoc:
## fu_get_gid(group ) [](#method-c-fu_get_gid)
:nodoc:
## fu_get_uid(user ) [](#method-c-fu_get_uid)
:nodoc:
## fu_have_symlink?() [](#method-c-fu_have_symlink?)
:nodoc:
**@return** [Boolean] 

## fu_mkdir(path , mode ) [](#method-c-fu_mkdir)
:nodoc:
## fu_mode(mode , path ) [](#method-c-fu_mode)
:nodoc:
## fu_stat_identical_entry?(a , b ) [](#method-c-fu_stat_identical_entry?)
:nodoc:
**@return** [Boolean] 

## mode_to_s(mode ) [](#method-c-mode_to_s)
:nodoc:
## remove_trailing_slash(dir ) [](#method-c-remove_trailing_slash)
:nodoc:
## symbolic_modes_to_i(mode_sym , path ) [](#method-c-symbolic_modes_to_i)
:nodoc:
## user_mask(target ) [](#method-c-user_mask)
:nodoc:

#Instance Methods
## apply_mask(mode, user_mask, op, mode_mask) [](#method-i-apply_mask)
:nodoc:

## fu_get_gid(group) [](#method-i-fu_get_gid)
:nodoc:

## fu_get_uid(user) [](#method-i-fu_get_uid)
:nodoc:

## fu_have_symlink?() [](#method-i-fu_have_symlink?)
:nodoc:

**@return** [Boolean] 

## fu_mkdir(path, mode) [](#method-i-fu_mkdir)
:nodoc:

## fu_mode(mode, path) [](#method-i-fu_mode)
:nodoc:

## fu_stat_identical_entry?(a, b) [](#method-i-fu_stat_identical_entry?)
:nodoc:

**@return** [Boolean] 

## mode_to_s(mode) [](#method-i-mode_to_s)
:nodoc:

## remove_trailing_slash(dir) [](#method-i-remove_trailing_slash)
:nodoc:

## symbolic_modes_to_i(mode_sym, path) [](#method-i-symbolic_modes_to_i)
:nodoc:

## user_mask(target) [](#method-i-user_mask)
:nodoc:

