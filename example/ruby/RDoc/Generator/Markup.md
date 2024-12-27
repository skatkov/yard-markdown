# Module: RDoc::Generator::Markup
    

Handle common RDoc::Markup tasks for various CodeObjects

This module is loaded by generators.  It allows RDoc's CodeObject tree to
avoid loading generator code to improve startup time for `ri`.



#Instance Methods
## aref_to(target_path) [](#method-i-aref_to)
Generates a relative URL from this object's path to `target_path`

## as_href(from_path) [](#method-i-as_href)
Generates a relative URL from `from_path` to this object's path

## cvs_url(url, full_path) [](#method-i-cvs_url)
Build a webcvs URL starting for the given `url` with `full_path` appended as
the destination path.  If `url` contains '%s' `full_path` will be will replace
the %s using sprintf on the `url`.

## description() [](#method-i-description)
Handy wrapper for marking up this object's comment

## formatter() [](#method-i-formatter)
Creates an RDoc::Markup::ToHtmlCrossref formatter

