# Module: Bundler::BuildMetadata
    

Represents metadata from when the Bundler gem was built.


# Class Methods
## built_at() [](#method-c-built_at)
A string representing the date the bundler gem was built.
## git_commit_sha() [](#method-c-git_commit_sha)
The SHA for the git commit the bundler gem was built from.
## release?() [](#method-c-release?)
Whether this is an official release build of Bundler.
**@return** [Boolean] 

## to_h() [](#method-c-to_h)
A hash representation of the build metadata.

