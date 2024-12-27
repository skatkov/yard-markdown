# Class: Bundler::Source::Git::GitProxy
**Inherits:** Object
    

The GitProxy is responsible to interact with git repositories. All actions
required by the Git source is encapsulated in this object.


# Attributes
## branch[RW] [](#attribute-i-branch)
Returns the value of attribute branch.

## explicit_ref[RW] [](#attribute-i-explicit_ref)
Returns the value of attribute explicit_ref.

## path[RW] [](#attribute-i-path)
Returns the value of attribute path.

## ref[RW] [](#attribute-i-ref)
Returns the value of attribute ref.

## revision[RW] [](#attribute-i-revision)

## tag[RW] [](#attribute-i-tag)
Returns the value of attribute tag.

## uri[RW] [](#attribute-i-uri)
Returns the value of attribute uri.


#Instance Methods
## checkout() [](#method-i-checkout)

## contains?(commit) [](#method-i-contains?)

**@return** [Boolean] 

## copy_to(destination, submodulesfalse) [](#method-i-copy_to)

## current_branch() [](#method-i-current_branch)

## full_version() [](#method-i-full_version)

## initialize(path, uri, options{}, revisionnil, gitnil) [](#method-i-initialize)

**@return** [GitProxy] a new instance of GitProxy

## version() [](#method-i-version)

