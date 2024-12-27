# Class: RDoc::RubyGemsHook
**Inherits:** Object
  
**Extended by:** Gem::UserInteraction
    
**Includes:** Gem::UserInteraction
  

We define the following two similar name classes in this file:

*   RDoc::RubyGemsHook
*   RDoc::RubygemsHook

RDoc::RubyGemsHook is the main class that has real logic.

RDoc::RubygemsHook is a class that is only for compatibility.
RDoc::RubygemsHook is used by RubyGems directly. We can remove this when all
maintained RubyGems remove `rubygems/rdoc.rb`.


# Class Methods
## alert(statement , question nil) [](#method-c-alert)
Displays an alert `statement`.  Asks a `question` if given.
## alert_error(statement , question nil) [](#method-c-alert_error)
Displays an error `statement` to the error output location.  Asks a `question`
if given.
## alert_warning(statement , question nil) [](#method-c-alert_warning)
Displays a warning `statement` to the warning output location.  Asks a
`question` if given.
## ask(question ) [](#method-c-ask)
Asks a `question` and returns the answer.
## ask_for_password(prompt ) [](#method-c-ask_for_password)
Asks for a password with a `prompt`
## ask_yes_no(question , default nil) [](#method-c-ask_yes_no)
Asks a yes or no `question`.  Returns true for yes, false for no.
## choose_from_list(question , list ) [](#method-c-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.
## clean_text(text ) [](#method-c-clean_text)
Remove any non-printable characters and make the text suitable for printing.
## format_text(text , wrap , indent 0) [](#method-c-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters
## generate(installer , specs ) [](#method-c-generate)
Post installs hook that generates documentation for each specification in
`specs`
## levenshtein_distance(str1 , str2 ) [](#method-c-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37
## load_rdoc() [](#method-c-load_rdoc)
Loads the RDoc generator
## min3(a , b , c ) [](#method-c-min3)
:nodoc:
## remove(uninstaller ) [](#method-c-remove)
## say(statement "") [](#method-c-say)
Displays the given `statement` on the standard output (or equivalent).
## terminate_interaction(exit_code 0) [](#method-c-terminate_interaction)
Terminates the RubyGems process with the given `exit_code`
## truncate_text(text , description , max_length 100_000) [](#method-c-truncate_text)
**@raise** [ArgumentError] 

## ui() [](#method-c-ui)
See DefaultUserInteraction::ui
## ui=(new_ui ) [](#method-c-ui=)
See DefaultUserInteraction::ui=
## use_ui(new_ui , &block ) [](#method-c-use_ui)
See DefaultUserInteraction::use_ui
## verbose(msg nil) [](#method-c-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.
# Attributes
## rdoc_version[RW] [](#attribute-c-rdoc_version)
Loaded version of RDoc.  Set by ::load_rdoc

## force[RW] [](#attribute-i-force)
Force installation of documentation?

## generate_rdoc[RW] [](#attribute-i-generate_rdoc)
Generate rdoc?

## generate_ri[RW] [](#attribute-i-generate_ri)
Generate ri data?


#Instance Methods
## alert(statement, questionnil) [](#method-i-alert)
Displays an alert `statement`.  Asks a `question` if given.

## alert_error(statement, questionnil) [](#method-i-alert_error)
Displays an error `statement` to the error output location.  Asks a `question`
if given.

## alert_warning(statement, questionnil) [](#method-i-alert_warning)
Displays a warning `statement` to the warning output location.  Asks a
`question` if given.

## ask(question) [](#method-i-ask)
Asks a `question` and returns the answer.

## ask_for_password(prompt) [](#method-i-ask_for_password)
Asks for a password with a `prompt`

## ask_yes_no(question, defaultnil) [](#method-i-ask_yes_no)
Asks a yes or no `question`.  Returns true for yes, false for no.

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## delete_legacy_args(args) [](#method-i-delete_legacy_args)
Removes legacy rdoc arguments from `args` -- TODO move to RDoc::Options

## document(generator, options, destination) [](#method-i-document)
Generates documentation using the named `generator` ("darkfish" or "ri") and
following the given `options`.

Documentation will be generated into `destination`

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## generate() [](#method-i-generate)
Generates RDoc and ri data

## initialize(spec, generate_rdocfalse, generate_ritrue) [](#method-i-initialize)
Creates a new documentation generator for `spec`.  RDoc and ri data generation
can be enabled or disabled through `generate_rdoc` and `generate_ri`
respectively.

Only `generate_ri` is enabled by default.

**@return** [RubyGemsHook] a new instance of RubyGemsHook

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## new_rdoc() [](#method-i-new_rdoc)
#new_rdoc creates a new RDoc instance.  This method is provided only to make
testing easier.

## rdoc_installed?() [](#method-i-rdoc_installed?)
Is rdoc documentation installed?

**@return** [Boolean] 

## remove() [](#method-i-remove)
Removes generated RDoc and ri data

**@raise** [Gem::FilePermissionError] 

## ri_installed?() [](#method-i-ri_installed?)
Is ri data installed?

**@return** [Boolean] 

## say(statement"") [](#method-i-say)
Displays the given `statement` on the standard output (or equivalent).

## setup() [](#method-i-setup)
Prepares the spec for documentation generation

**@raise** [Gem::FilePermissionError] 

## terminate_interaction(exit_code0) [](#method-i-terminate_interaction)
Terminates the RubyGems process with the given `exit_code`

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

