# Class: Gem::ConfigFile
**Inherits:** Object
    
**Includes:** Gem::UserInteraction
  

Gem::ConfigFile RubyGems options and gem command options from gemrc.

gemrc is a YAML file that uses strings to match gem command arguments and
symbols to match RubyGems options.

Gem command arguments use a String key that matches the command name and allow
you to specify default arguments:

    install: --no-rdoc --no-ri
    update: --no-rdoc --no-ri

You can use `gem:` to set default arguments for all commands.

RubyGems options use symbol keys.  Valid options are:

`:backtrace`
:   See #backtrace

`:sources`
:   Sets Gem::sources

`:verbose`
:   See #verbose

`:concurrent_downloads`
:   See #concurrent_downloads


gemrc files may exist in various locations and are read and merged in the
following order:

*   system wide (/etc/gemrc)
*   per user (~/.gemrc)
*   per environment (gemrc files listed in the GEMRC environment variable)


# Class Methods
## dump_with_rubygems_yaml(content ) [](#method-c-dump_with_rubygems_yaml)
## load_with_rubygems_config_hash(yaml ) [](#method-c-load_with_rubygems_config_hash)
# Attributes
## args[RW] [](#attribute-i-args)
List of arguments supplied to the config file object.

## backtrace[RW] [](#attribute-i-backtrace)
True if the backtrace option has been specified, or debug is on.

## bulk_threshold[RW] [](#attribute-i-bulk_threshold)
Bulk threshold value.  If the number of missing gems are above this threshold
value, then a bulk download technique is used.  (deprecated)

## cert_expiration_length_days[RW] [](#attribute-i-cert_expiration_length_days)
Expiration length to sign a certificate

## concurrent_downloads[RW] [](#attribute-i-concurrent_downloads)
Number of gem downloads that should be performed concurrently.

## disable_default_gem_server[RW] [](#attribute-i-disable_default_gem_server)
True if we want to force specification of gem server when pushing a gem

## home[RW] [](#attribute-i-home)
Where to install gems (deprecated)

## install_extension_in_lib[RW] [](#attribute-i-install_extension_in_lib)
Install extensions into lib as well as into the extension directory.

## ipv4_fallback_enabled[RW] [](#attribute-i-ipv4_fallback_enabled)
## Experimental ==
Fallback to IPv4 when IPv6 is not reachable or slow (default: false)

## path[RW] [](#attribute-i-path)
Where to look for gems (deprecated)

## sources[RW] [](#attribute-i-sources)
sources to look for gems

## ssl_ca_cert[RW] [](#attribute-i-ssl_ca_cert)
Path name of directory or file of openssl CA certificate, used for remote
https connection

## ssl_client_cert[RW] [](#attribute-i-ssl_client_cert)
Path name of directory or file of openssl client certificate, used for remote
https connection with client authentication

## ssl_verify_mode[RW] [](#attribute-i-ssl_verify_mode)
openssl verify mode value, used for remote https connection

## update_sources[RW] [](#attribute-i-update_sources)
True if we want to update the SourceInfoCache every time, false otherwise

## verbose[RW] [](#attribute-i-verbose)
Verbose level of output:
*   false -- No output
*   true -- Normal output
*   :loud -- Extra output


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## [](key) [](#method-i-[])
Return the configuration information for `key`.

## []=(key, value) [](#method-i-[]=)
Set configuration option `key` to `value`.

## alert(statement, questionnil) [](#method-i-alert)
Displays an alert `statement`.  Asks a `question` if given.

## alert_error(statement, questionnil) [](#method-i-alert_error)
Displays an error `statement` to the error output location.  Asks a `question`
if given.

## alert_warning(statement, questionnil) [](#method-i-alert_warning)
Displays a warning `statement` to the warning output location.  Asks a
`question` if given.

## api_keys() [](#method-i-api_keys)
Hash of RubyGems.org and alternate API keys

## ask(question) [](#method-i-ask)
Asks a `question` and returns the answer.

## ask_for_password(prompt) [](#method-i-ask_for_password)
Asks for a password with a `prompt`

## ask_yes_no(question, defaultnil) [](#method-i-ask_yes_no)
Asks a yes or no `question`.  Returns true for yes, false for no.

## check_credentials_permissions() [](#method-i-check_credentials_permissions)
Checks the permissions of the credentials file.  If they are not 0600 an error
message is displayed and RubyGems aborts.

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## config_file_name() [](#method-i-config_file_name)
The name of the configuration file.

## credentials_path() [](#method-i-credentials_path)
Location of RubyGems.org credentials

## each(&block) [](#method-i-each)
Delegates to @hash

**@yield** [:update_sources, @update_sources] 

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## handle_arguments(arg_list) [](#method-i-handle_arguments)
Handle the command arguments.

## initialize(args) [](#method-i-initialize)
Create the config file object.  `args` is the list of arguments from the
command line.

The following command line options are handled early here rather than later at
the time most command options are processed.

`--config-file`, `--config-file==NAME`
:   Obviously these need to be handled by the ConfigFile object to ensure we
    get the right config file.


`--backtrace`
:   Backtrace needs to be turned on early so that errors before normal option
    parsing can be properly handled.


`--debug`
:   Enable Ruby level debug messages.  Handled early for the same reason as
    --backtrace.

-- TODO: parse options upstream, pass in options directly

**@return** [ConfigFile] a new instance of ConfigFile

## last_update_check() [](#method-i-last_update_check)
Reads time of last update check from state file

## last_update_check=(timestamp) [](#method-i-last_update_check=)
Writes time of last update check to state file

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## load_api_keys() [](#method-i-load_api_keys)

## load_file(filename) [](#method-i-load_file)

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## really_verbose() [](#method-i-really_verbose)
Really verbose mode gives you extra output.

## rubygems_api_key() [](#method-i-rubygems_api_key)
Returns the RubyGems.org API key

## rubygems_api_key=(api_key) [](#method-i-rubygems_api_key=)
Sets the RubyGems.org API key to `api_key`

## say(statement"") [](#method-i-say)
Displays the given `statement` on the standard output (or equivalent).

## set_api_key(host, api_key) [](#method-i-set_api_key)
Set a specific host's API key to `api_key`

## state_file_name() [](#method-i-state_file_name)
The name of the state file.

## state_file_writable?() [](#method-i-state_file_writable?)
Check state file is writable. Creates empty file if not present to ensure we
can write to it.

**@return** [Boolean] 

## terminate_interaction(exit_code0) [](#method-i-terminate_interaction)
Terminates the RubyGems process with the given `exit_code`

## to_yaml() [](#method-i-to_yaml)
to_yaml only overwrites things you can't override on the command line.

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## unset_api_key!() [](#method-i-unset_api_key!)
Remove the +~/.gem/credentials+ file to clear all the current sessions.

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## write() [](#method-i-write)
Writes out this config file, replacing its source.

