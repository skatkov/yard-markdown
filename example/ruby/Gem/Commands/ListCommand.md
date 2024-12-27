# Class: Gem::Commands::ListCommand
**Inherits:** Gem::Command
    
**Includes:** Gem::QueryUtils
  

Searches for gems starting with the supplied argument.



#Instance Methods
## accept_uri_http() [](#method-i-accept_uri_http)
Allows Gem::OptionParser to handle HTTP URIs.

## add_bulk_threshold_option() [](#method-i-add_bulk_threshold_option)
Add the --bulk-threshold option

## add_clear_sources_option() [](#method-i-add_clear_sources_option)
Add the --clear-sources option

## add_local_remote_options() [](#method-i-add_local_remote_options)
Add local/remote options to the command line parser.

## add_platform_option(taskcommand, *wrap) [](#method-i-add_platform_option)
Add the --platform option to the option parser.

## add_prerelease_option(*wrap) [](#method-i-add_prerelease_option)
Add the --prerelease option to the option parser.

## add_proxy_option() [](#method-i-add_proxy_option)
Add the --http-proxy option

## add_query_options() [](#method-i-add_query_options)

## add_source_option() [](#method-i-add_source_option)
Add the --source option

## add_update_sources_option() [](#method-i-add_update_sources_option)
Add the --update-sources option

## add_version_option(taskcommand, *wrap) [](#method-i-add_version_option)
Add the --version option to the option parser.

## arguments() [](#method-i-arguments)
:nodoc:

## both?() [](#method-i-both?)
Is fetching of local and remote information enabled?

**@return** [Boolean] 

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## defaults_str() [](#method-i-defaults_str)
:nodoc:

## description() [](#method-i-description)
:nodoc:

## execute() [](#method-i-execute)

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## get_platform_from_requirements(requirements) [](#method-i-get_platform_from_requirements)
Extract platform given on the command line

## initialize() [](#method-i-initialize)

**@return** [ListCommand] a new instance of ListCommand

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## local?() [](#method-i-local?)
Is local fetching enabled?

**@return** [Boolean] 

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## remote?() [](#method-i-remote?)
Is remote fetching enabled?

**@return** [Boolean] 

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## usage() [](#method-i-usage)
:nodoc:

