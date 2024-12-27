# Class: Gem::RemoteFetcher
**Inherits:** Object
    
**Includes:** Gem::UserInteraction
  

RemoteFetcher handles the details of fetching gems and gem information from a
remote source.


# Class Methods
## fetcher() [](#method-c-fetcher)
Cached RemoteFetcher instance.
## fetcher=(fetcher ) [](#method-c-fetcher=)
# Attributes
## headers[RW] [](#attribute-i-headers)
Returns the value of attribute headers.


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

## cache_update_path(uri, pathnil, updatetrue) [](#method-i-cache_update_path)
Downloads `uri` to `path` if necessary. If no path is given, it just passes
the data.

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## close_all() [](#method-i-close_all)

## download(spec, source_uri, install_dirGem.dir) [](#method-i-download)
Moves the gem `spec` from `source_uri` to the cache dir unless it is already
there.  If the source_uri is local the gem cache dir copy is always replaced.

## download_to_cache(dependency) [](#method-i-download_to_cache)
Given a name and requirement, downloads this gem into cache and returns the
filename. Returns nil if the gem cannot be located. -- Should probably be
integrated with #download below, but that will be a larger, more encompassing
effort. -erikh

## fetch_file(uri, *_) [](#method-i-fetch_file)
File Fetcher. Dispatched by `fetch_path`. Use it instead.

## fetch_http(uri, last_modifiednil, headfalse, depth0) [](#method-i-fetch_http)
HTTP Fetcher. Dispatched by `fetch_path`. Use it instead.

## fetch_path(uri, mtimenil, headfalse) [](#method-i-fetch_path)
Downloads `uri` and returns it as a String.

## fetch_s3(uri, mtimenil, headfalse) [](#method-i-fetch_s3)

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## https?(uri) [](#method-i-https?)

**@return** [Boolean] 

## initialize(proxynil, dnsnil, headers{}) [](#method-i-initialize)
Initialize a remote fetcher using the source URI and possible proxy
information.

`proxy`
*   [String]: explicit specification of proxy; overrides any environment
        variable setting

*   nil: respect environment variables (HTTP_PROXY, HTTP_PROXY_USER,
        HTTP_PROXY_PASS)

*   `:no_proxy`: ignore environment variables and _don't_ use a proxy

`headers`: A set of additional HTTP headers to be sent to the server when
    fetching the gem.

**@return** [RemoteFetcher] a new instance of RemoteFetcher

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## request(uri, request_class, last_modifiednil) [](#method-i-request)
Performs a Gem::Net::HTTP request of type `request_class` on `uri` returning a
Gem::Net::HTTP response object.  request maintains a table of persistent
connections to reduce connect overhead.

## s3_uri_signer(uri) [](#method-i-s3_uri_signer)
we have our own signing code here to avoid a dependency on the aws-sdk gem

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

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

