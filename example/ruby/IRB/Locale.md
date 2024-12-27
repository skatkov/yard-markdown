# Class: IRB::Locale
**Inherits:** Object
    

:nodoc:


# Attributes
## lang[RW] [](#attribute-i-lang)
Returns the value of attribute lang.

## modifier[RW] [](#attribute-i-modifier)
Returns the value of attribute modifier.

## territory[RW] [](#attribute-i-territory)
Returns the value of attribute territory.


#Instance Methods
## String(mes) [](#method-i-String)

## each_localized_path(dir, file) [](#method-i-each_localized_path)

## each_sublocale() [](#method-i-each_sublocale)

**@yield** [nil] 

## encoding() [](#method-i-encoding)

## find(file, paths$:) [](#method-i-find)

## format(*opts) [](#method-i-format)

## gets(*rs) [](#method-i-gets)

## initialize(localenil) [](#method-i-initialize)

**@return** [Locale] a new instance of Locale

## load(file) [](#method-i-load)

## print(*opts) [](#method-i-print)

## printf(*opts) [](#method-i-printf)

## puts(*opts) [](#method-i-puts)

## readline(*rs) [](#method-i-readline)

## search_file(lib_paths, dir, file) [](#method-i-search_file)
typically, for the parameters and a <path> in paths, it searches
    <path>/<dir>/<locale>/<file>

**@param** [] load paths in which IRB find a localized file.

**@param** [] directory

**@param** [] basename to be localized

