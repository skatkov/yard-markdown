# Module: SyncDefaultGems
  
**Extended by:** FileUtils
    
**Includes:** FileUtils
  



# Class Methods
## apply_mask(mode , user_mask , op , mode_mask ) [](#method-c-apply_mask)
:nodoc:
## check_prerelease_version(gem ) [](#method-c-check_prerelease_version)
## commits_in_ranges(gem , repo , default_branch , ranges ) [](#method-c-commits_in_ranges)
Returns commit list as array of [commit_hash, subject].
## filter_pickup_files(changed , ignore_file_pattern , base ) [](#method-c-filter_pickup_files)
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

## ignore_file_pattern_for(gem ) [](#method-c-ignore_file_pattern_for)
## message_filter(repo , sha , input: ARGF) [](#method-c-message_filter)
## mode_to_s(mode ) [](#method-c-mode_to_s)
:nodoc:
## pickup_commit(gem , sha , edit ) [](#method-c-pickup_commit)
## pickup_files(gem , changed , picked ) [](#method-c-pickup_files)
## pipe_readlines(args , rs: "\0", chomp: true) [](#method-c-pipe_readlines)
## preexisting?(base , file ) [](#method-c-preexisting?)
**@return** [Boolean] 

## remove_trailing_slash(dir ) [](#method-c-remove_trailing_slash)
:nodoc:
## replace_rdoc_ref(file ) [](#method-c-replace_rdoc_ref)
## replace_rdoc_ref_all() [](#method-c-replace_rdoc_ref_all)
## resolve_conflicts(gem , sha , edit ) [](#method-c-resolve_conflicts)
-- Following methods used by sync_default_gems_with_commits return true: 
success false: skipped nil:   failed ++
## symbolic_modes_to_i(mode_sym , path ) [](#method-c-symbolic_modes_to_i)
:nodoc:
## sync_default_gems(gem ) [](#method-c-sync_default_gems)
We usually don't use this. Please consider using
#sync_default_gems_with_commits instead.
## sync_default_gems_with_commits(gem , ranges , edit: nil) [](#method-c-sync_default_gems_with_commits)
NOTE: This method is also used by GitHub ruby/git.ruby-lang.org's
bin/update-default-gem.sh
**@param** [String] A gem name, also used as a git remote name. REPOSITORIES converts it to the appropriate GitHub repository.

**@param** [Array<String>] "before..after". Note that it will NOT sync "before" (but commits after that).

**@param** [TrueClass] Set true if you want to resolve conflicts. Obviously, update-default-gem.sh doesn't use this.

## sync_lib(repo , upstream nil) [](#method-c-sync_lib)
## update_default_gems(gem , release: false) [](#method-c-update_default_gems)
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

