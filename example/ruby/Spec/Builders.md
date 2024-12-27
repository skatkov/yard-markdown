# Module: Spec::Builders
    



# Class Methods
## constantize(name ) [](#method-c-constantize)
## extended(mod ) [](#method-c-extended)
**@private** [] 


#Instance Methods
## build_bundler(*args, &blk) [](#method-i-build_bundler)

## build_gem(name, *args, &blk) [](#method-i-build_gem)

## build_git(name, *args, &block) [](#method-i-build_git)

## build_index(&block) [](#method-i-build_index)

## build_lib(name, *args, &blk) [](#method-i-build_lib)

## build_plugin(name, *args, &blk) [](#method-i-build_plugin)

## build_repo(path, **kwargs, &blk) [](#method-i-build_repo)

## build_repo1() [](#method-i-build_repo1)

## build_repo2(**kwargs, &blk) [](#method-i-build_repo2)

## build_repo3(**kwargs, &blk) [](#method-i-build_repo3)
A repo that has no pre-installed gems included. (The caller completely
determines the contents with the block.)

## build_repo4(**kwargs, &blk) [](#method-i-build_repo4)
Like build_repo3, this is a repo that has no pre-installed gems included. We
have two different methods for situations where two different empty sources
are needed.

## build_security_repo() [](#method-i-build_security_repo)

## build_spec(name, version"0.0.1", platformnil, &block) [](#method-i-build_spec)

## check_test_gems!() [](#method-i-check_test_gems!)

## pl(platform) [](#method-i-pl)

## rake_version() [](#method-i-rake_version)

## update_git(name, *args, &block) [](#method-i-update_git)

## update_repo(path, build_compact_index:true) [](#method-i-update_repo)

## update_repo2(**kwargs, &blk) [](#method-i-update_repo2)

## update_repo4(&blk) [](#method-i-update_repo4)

## v(version) [](#method-i-v)

