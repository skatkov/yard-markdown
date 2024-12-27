# Class: Gem::SpecificationPolicy
**Inherits:** Object
    
**Includes:** Gem::UserInteraction
  



# Attributes
## packaging[RW] [](#attribute-i-packaging)
If set to true, run packaging-specific checks, as well.


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

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## initialize(specification) [](#method-i-initialize)
:nodoc:

**@return** [SpecificationPolicy] a new instance of SpecificationPolicy

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## say(statement"") [](#method-i-say)
Displays the given `statement` on the standard output (or equivalent).

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

## validate(strictfalse) [](#method-i-validate)
Does a sanity check on the specification.

Raises InvalidSpecificationException if the spec does not pass the checks.

It also performs some validations that do not raise but print warning messages
instead.

## validate_dependencies() [](#method-i-validate_dependencies)
Checks that the gem does not depend on itself. Checks that dependencies use
requirements as we recommend.  Warnings are issued when dependencies are
open-ended or overly strict for semantic versioning.

## validate_duplicate_dependencies() [](#method-i-validate_duplicate_dependencies)
Checks that no duplicate dependencies are specified.

## validate_for_resolution() [](#method-i-validate_for_resolution)
Implementation for Specification#validate_for_resolution

## validate_metadata() [](#method-i-validate_metadata)
Implementation for Specification#validate_metadata

## validate_optional(strict) [](#method-i-validate_optional)

## validate_permissions() [](#method-i-validate_permissions)
Issues a warning for each file to be packaged which is world-readable.

Implementation for Specification#validate_permissions

## validate_required!() [](#method-i-validate_required!)
Does a sanity check on the specification.

Raises InvalidSpecificationException if the spec does not pass the checks.

Only runs checks that are considered necessary for the specification to be
functional.

## validate_required_metadata!() [](#method-i-validate_required_metadata!)

## validate_required_ruby_version() [](#method-i-validate_required_ruby_version)

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

