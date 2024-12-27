# Class: Gem::Request
**Inherits:** Object
  
**Extended by:** Gem::UserInteraction
    
**Includes:** Gem::UserInteraction
  



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
## configure_connection_for_https(connection , cert_files ) [](#method-c-configure_connection_for_https)
**@raise** [Gem::Exception] 

## create_with_proxy(uri , request_class , last_modified , proxy ) [](#method-c-create_with_proxy)
Legacy.  This is used in tests.
## format_text(text , wrap , indent 0) [](#method-c-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters
## get_cert_files() [](#method-c-get_cert_files)
## get_proxy_from_env(scheme "http") [](#method-c-get_proxy_from_env)
Returns a proxy URI for the given `scheme` if one is set in the environment
variables.
## levenshtein_distance(str1 , str2 ) [](#method-c-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37
## min3(a , b , c ) [](#method-c-min3)
:nodoc:
## proxy_uri(proxy ) [](#method-c-proxy_uri)
:nodoc:
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
## verify_certificate(store_context ) [](#method-c-verify_certificate)
## verify_certificate_message(error_number , cert ) [](#method-c-verify_certificate_message)

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

## cert_files() [](#method-i-cert_files)

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## connection_for(uri) [](#method-i-connection_for)
Creates or an HTTP connection based on `uri`, or retrieves an existing
connection, using a proxy if needed.

## fetch() [](#method-i-fetch)

**@yield** [request] 

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## initialize(uri, request_class, last_modified, pool) [](#method-i-initialize)

**@return** [Request] a new instance of Request

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## perform_request(request) [](#method-i-perform_request)
:nodoc:

## proxy_uri() [](#method-i-proxy_uri)

## reset(connection) [](#method-i-reset)
Resets HTTP connection `connection`.

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

## user_agent() [](#method-i-user_agent)

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

