# Class: Gem::SpecFetcher
**Inherits:** Object
    
**Includes:** Gem::Text, Gem::UserInteraction
  

SpecFetcher handles metadata updates from remote gem repositories.


# Class Methods
## fetcher() [](#method-c-fetcher)
Default fetcher instance.  Use this instead of ::new to reduce object
allocation.
## fetcher=(fetcher ) [](#method-c-fetcher=)
:nodoc:
# Attributes
## latest_specs[RW] [](#attribute-i-latest_specs)
Cache of latest specs

## prerelease_specs[RW] [](#attribute-i-prerelease_specs)
Cache of prerelease specs

## sources[RW] [](#attribute-i-sources)
Sources for this SpecFetcher

## specs[RW] [](#attribute-i-specs)
Cache of all released specs


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

## available_specs(type) [](#method-i-available_specs)
Returns a list of gems available for each source in Gem::sources.

`type` can be one of 3 values: :released   => Return the list of all released
specs :complete   => Return the list of all specs :latest     => Return the
list of only the highest version of each gem :prerelease => Return the list of
all prerelease only specs

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## detect(type:complete) [](#method-i-detect)
Return all gem name tuples who's names match `obj`

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## initialize(sourcesnil) [](#method-i-initialize)
Creates a new SpecFetcher.  Ordinarily you want to use the default fetcher
from Gem::SpecFetcher::fetcher which uses the Gem.sources.

If you need to retrieve specifications from a different `source`, you can send
it as an argument.

**@return** [SpecFetcher] a new instance of SpecFetcher

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

## search_for_dependency(dependency, matching_platformtrue) [](#method-i-search_for_dependency)
Find and fetch gem name tuples that match `dependency`.

If `matching_platform` is false, gems for all platforms are returned.

## spec_for_dependency(dependency, matching_platformtrue) [](#method-i-spec_for_dependency)
Find and fetch specs that match `dependency`.

If `matching_platform` is false, gems for all platforms are returned.

## suggest_gems_from_name(gem_name, type:latest, num_results5) [](#method-i-suggest_gems_from_name)
Suggests gems based on the supplied `gem_name`. Returns an array of
alternative gem names.

## terminate_interaction(exit_code0) [](#method-i-terminate_interaction)
Terminates the RubyGems process with the given `exit_code`

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## tuples_for(source, type, gracefully_ignorefalse) [](#method-i-tuples_for)
Retrieves NameTuples from `source` of the given `type` (:prerelease, etc.). 
If `gracefully_ignore` is true, errors are ignored.

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

