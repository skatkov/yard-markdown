# Class: CaseFolding
**Inherits:** Object
    
**Includes:** CaseFolding::Util
  

Usage (for case folding only):
     $ wget http://www.unicode.org/Public/UNIDATA/CaseFolding.txt
     $ ruby enc-case-folding.rb CaseFolding.txt -o casefold.h
    or (for case folding and case mapping):
     $ wget http://www.unicode.org/Public/UNIDATA/CaseFolding.txt
     $ wget http://www.unicode.org/Public/UNIDATA/UnicodeData.txt
     $ wget http://www.unicode.org/Public/UNIDATA/SpecialCasing.txt
     $ ruby enc-case-folding.rb -m . -o casefold.h

using -d or --debug will include UTF-8 characters in comments for debugging


# Class Methods
## load(*args ) [](#method-c-load)
# Attributes
## fold[RW] [](#attribute-i-fold)
Returns the value of attribute fold.

## fold_locale[RW] [](#attribute-i-fold_locale)
Returns the value of attribute fold_locale.

## unfold[RW] [](#attribute-i-unfold)
Returns the value of attribute unfold.

## unfold_locale[RW] [](#attribute-i-unfold_locale)
Returns the value of attribute unfold_locale.

## version[RW] [](#attribute-i-version)
Returns the value of attribute version.


#Instance Methods
## debug!() [](#method-i-debug!)

## display(dest, mapping_data) [](#method-i-display)

## load(filename) [](#method-i-load)

## lookup_hash(key, type, data) [](#method-i-lookup_hash)

## range_check(code) [](#method-i-range_check)

