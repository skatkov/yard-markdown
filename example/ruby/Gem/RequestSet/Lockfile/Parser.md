# Class: Gem::RequestSet::Lockfile::Parser
**Inherits:** Object
    




#Instance Methods
## get(expected_typesnil, expected_valuenil) [](#method-i-get)
Gets the next token for a Lockfile

## initialize(tokenizer, set, platforms, filenamenil) [](#method-i-initialize)
Parses lockfiles

**@return** [Parser] a new instance of Parser

## parse() [](#method-i-parse)

## parse_DEPENDENCIES() [](#method-i-parse_DEPENDENCIES)
:nodoc:

## parse_GEM() [](#method-i-parse_GEM)
:nodoc:

## parse_GIT() [](#method-i-parse_GIT)
:nodoc:

## parse_PATH() [](#method-i-parse_PATH)
:nodoc:

## parse_PLATFORMS() [](#method-i-parse_PLATFORMS)
:nodoc:

## parse_dependency(name, op) [](#method-i-parse_dependency)
Parses the requirements following the dependency `name` and the `op` for the
first token of the requirements and returns a Gem::Dependency object.

