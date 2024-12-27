# Exception: Gem::RequestSet::Lockfile::ParseError
**Inherits:** Gem::Exception
    

Raised when a lockfile cannot be parsed


# Attributes
## column[RW] [](#attribute-i-column)
The column where the error was encountered

## line[RW] [](#attribute-i-line)
The line where the error was encountered

## path[RW] [](#attribute-i-path)
The location of the lock file


#Instance Methods
## initialize(message, column, line, path) [](#method-i-initialize)
Raises a ParseError with the given `message` which was encountered at a `line`
and `column` while parsing.

**@return** [ParseError] a new instance of ParseError

