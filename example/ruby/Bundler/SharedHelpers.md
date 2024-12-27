# Module: Bundler::SharedHelpers
  
**Extended by:** Bundler::SharedHelpers
    



# Class Methods
## bundle_bin_path() [](#method-c-bundle_bin_path)
## chdir(dir , &blk ) [](#method-c-chdir)
## checksum_for_file(path , digest ) [](#method-c-checksum_for_file)
## default_bundle_dir() [](#method-c-default_bundle_dir)
## default_gemfile() [](#method-c-default_gemfile)
**@raise** [GemfileNotFound] 

## default_lockfile() [](#method-c-default_lockfile)
## digest(name ) [](#method-c-digest)
## ensure_same_dependencies(spec , old_deps , new_deps ) [](#method-c-ensure_same_dependencies)
**@raise** [APIResponseMismatchError] 

## filesystem_access(path , action :write, &block ) [](#method-c-filesystem_access)
Rescues permissions errors raised by file system operations (ie.
Errno:EACCESS, Errno::EAGAIN) and raises more friendly errors instead.
**@param** [String] the path that the action will be attempted to

**@param** [Symbol, #to_s] the type of operation that will be
performed. For example: :write, :read, :exec

**@raise** [Bundler::PermissionError] if Errno:EACCES is raised in the
given block

**@raise** [Bundler::TemporaryResourceError] if Errno:EAGAIN is raised in the
given block

**@see** [] 

**@yield** [] path


**@example**
```ruby
filesystem_access("vendor/cache", :create) do
  FileUtils.mkdir_p("vendor/cache")
end
```## gemspec_path() [](#method-c-gemspec_path)
## in_bundle?() [](#method-c-in_bundle?)
**@return** [Boolean] 

## major_deprecation(major_version , message , removed_message: nil, print_caller_location: false) [](#method-c-major_deprecation)
## md5_available?() [](#method-c-md5_available?)
**@return** [Boolean] 

## pretty_dependency(dep ) [](#method-c-pretty_dependency)
## print_major_deprecations!() [](#method-c-print_major_deprecations!)
## pwd() [](#method-c-pwd)
## relative_gemfile_path() [](#method-c-relative_gemfile_path)
## relative_lockfile_path() [](#method-c-relative_lockfile_path)
## relative_path_to(destination , from: pwd) [](#method-c-relative_path_to)
## root() [](#method-c-root)
**@raise** [GemfileNotFound] 

## set_bundle_environment() [](#method-c-set_bundle_environment)
## set_env(key , value ) [](#method-c-set_env)
**@raise** [ArgumentError] 

## with_clean_git_env(&block ) [](#method-c-with_clean_git_env)
## write_to_gemfile(gemfile_path , contents ) [](#method-c-write_to_gemfile)

#Instance Methods
## bundle_bin_path() [](#method-i-bundle_bin_path)

## chdir(dir, &blk) [](#method-i-chdir)

## checksum_for_file(path, digest) [](#method-i-checksum_for_file)

## default_bundle_dir() [](#method-i-default_bundle_dir)

## default_gemfile() [](#method-i-default_gemfile)

**@raise** [GemfileNotFound] 

## default_lockfile() [](#method-i-default_lockfile)

## digest(name) [](#method-i-digest)

## ensure_same_dependencies(spec, old_deps, new_deps) [](#method-i-ensure_same_dependencies)

**@raise** [APIResponseMismatchError] 

## filesystem_access(path, action:write, &block) [](#method-i-filesystem_access)
Rescues permissions errors raised by file system operations (ie.
Errno:EACCESS, Errno::EAGAIN) and raises more friendly errors instead.

**@param** [String] the path that the action will be attempted to

**@param** [Symbol, #to_s] the type of operation that will be
performed. For example: :write, :read, :exec

**@raise** [Bundler::PermissionError] if Errno:EACCES is raised in the
given block

**@raise** [Bundler::TemporaryResourceError] if Errno:EAGAIN is raised in the
given block

**@see** [] 

**@yield** [] path


**@example**
```ruby
filesystem_access("vendor/cache", :create) do
  FileUtils.mkdir_p("vendor/cache")
end
```## gemspec_path() [](#method-i-gemspec_path)

## in_bundle?() [](#method-i-in_bundle?)

**@return** [Boolean] 

## major_deprecation(major_version, message, removed_message:nil, print_caller_location:false) [](#method-i-major_deprecation)

## md5_available?() [](#method-i-md5_available?)

**@return** [Boolean] 

## pretty_dependency(dep) [](#method-i-pretty_dependency)

## print_major_deprecations!() [](#method-i-print_major_deprecations!)

## pwd() [](#method-i-pwd)

## relative_gemfile_path() [](#method-i-relative_gemfile_path)

## relative_lockfile_path() [](#method-i-relative_lockfile_path)

## relative_path_to(destination, from:pwd) [](#method-i-relative_path_to)

## root() [](#method-i-root)

**@raise** [GemfileNotFound] 

## set_bundle_environment() [](#method-i-set_bundle_environment)

## set_env(key, value) [](#method-i-set_env)

**@raise** [ArgumentError] 

## with_clean_git_env(&block) [](#method-i-with_clean_git_env)

## write_to_gemfile(gemfile_path, contents) [](#method-i-write_to_gemfile)

