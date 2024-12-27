# Class: RDoc::I18n::Locale
**Inherits:** Object
    

A message container for a locale.

This object provides the following two features:

    * Loads translated messages from .po file.
    * Translates a message into the locale.


# Class Methods
## [](locale_name ) [](#method-c-[])
Returns the locale object for `locale_name`.
## []=(locale_name , locale ) [](#method-c-[]=)
Sets the locale object for `locale_name`.

Normally, this method is not used. This method is useful for testing.
# Attributes
## name[RW] [](#attribute-i-name)
The name of the locale. It uses IETF language tag format
+[[language](_territory)[.[codeset]](@modifier)]+.

See also [BCP 47 - Tags for Identifying
Languages](http://tools.ietf.org/rfc/bcp/bcp47.txt).


#Instance Methods
## initialize(name) [](#method-i-initialize)
Creates a new locale object for `name` locale. `name` must follow IETF
language tag format.

**@return** [Locale] a new instance of Locale

## load(locale_directory) [](#method-i-load)
Loads translation messages from `locale_directory`/+@name+/rdoc.po or
`locale_directory`/+@name+.po. The former has high priority.

This method requires gettext gem for parsing .po file. If you don't have
gettext gem, this method doesn't load .po file. This method warns and returns
`false`.

Returns `true` if succeeded, `false` otherwise.

## translate(message) [](#method-i-translate)
Translates the `message` into locale. If there is no translation messages for
`message` in locale, `message` itself is returned.

