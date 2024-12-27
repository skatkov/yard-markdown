# Class: Gem::Resolver::APISet
**Inherits:** Gem::Resolver::Set
    

The global rubygems pool, available via the rubygems.org API. Returns
instances of APISpecification.


# Attributes
## dep_uri[RW] [](#attribute-i-dep_uri)
The URI for the dependency API this APISet uses.

## source[RW] [](#attribute-i-source)
The Gem::Source that gems are fetched from

## uri[RW] [](#attribute-i-uri)
The corresponding place to fetch gems.


#Instance Methods
## find_all(req) [](#method-i-find_all)
Return an array of APISpecification objects matching DependencyRequest `req`.

## initialize(dep_uri"https://index.rubygems.org/info/") [](#method-i-initialize)
Creates a new APISet that will retrieve gems from `uri` using the RubyGems API
URL `dep_uri` which is described at
https://guides.rubygems.org/rubygems-org-api

**@return** [APISet] a new instance of APISet

## prefetch(reqs) [](#method-i-prefetch)
A hint run by the resolver to allow the Set to fetch data for
DependencyRequests `reqs`.

## prefetch_now() [](#method-i-prefetch_now)
:nodoc:

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## versions(name) [](#method-i-versions)
Return data for all versions of the gem `name`.

