# Class: RDoc::Generator::POT
**Inherits:** Object
    

Generates a POT file.

Here is a translator work flow with the generator.

## Create .pot

You create .pot file by pot formatter:

    % rdoc --format pot

It generates doc/rdoc.pot.

## Create .po

You create .po file from doc/rdoc.pot. This operation is needed only the first
time. This work flow assumes that you are a translator for Japanese.

You create locale/ja/rdoc.po from doc/rdoc.pot. You can use msginit provided
by GNU gettext or rmsginit provided by gettext gem. This work flow uses
gettext gem because it is more portable than GNU gettext for Rubyists. Gettext
gem is implemented by pure Ruby.

    % gem install gettext
    % mkdir -p locale/ja
    % rmsginit --input doc/rdoc.pot --output locale/ja/rdoc.po --locale ja

Translate messages in .po

You translate messages in .po by a PO file editor. po-mode.el exists for Emacs
users. There are some GUI tools such as GTranslator. There are some Web
services such as POEditor and Tansifex. You can edit by your favorite text
editor because .po is a text file. Generate localized documentation

You can generate localized documentation with locale/ja/rdoc.po:

    % rdoc --locale ja

You can find documentation in Japanese in doc/. Yay!

## Update translation

You need to update translation when your application is added or modified
messages.

You can update .po by the following command lines:

    % rdoc --format pot
    % rmsgmerge --update locale/ja/rdoc.po doc/rdoc.pot

You edit locale/ja/rdoc.po to translate new messages.



#Instance Methods
## class_dir() [](#method-i-class_dir)
:nodoc:

## generate() [](#method-i-generate)
Writes .pot to disk.

## initialize(store, options) [](#method-i-initialize)
Set up a new .pot generator

**@return** [POT] a new instance of POT

