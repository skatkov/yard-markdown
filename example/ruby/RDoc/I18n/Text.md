# Class: RDoc::I18n::Text
**Inherits:** Object
    

An i18n supported text.

This object provides the following two features:

    * Extracts translation messages from wrapped raw text.
    * Translates wrapped raw text in specified locale.

Wrapped raw text is one of String, RDoc::Comment or Array of them.



#Instance Methods
## extract_messages() [](#method-i-extract_messages)
Extracts translation target messages and yields each message.

Each yielded message is a Hash. It consists of the followings:

:type
:   :paragraph

:paragraph
:   String (The translation target message itself.)

:line_no
:   Integer (The line number of the :paragraph is started.)


The above content may be added in the future.

## initialize(raw) [](#method-i-initialize)
Creates a new i18n supported text for `raw` text.

**@return** [Text] a new instance of Text

## translate(locale) [](#method-i-translate)
Translates raw text into `locale`.

