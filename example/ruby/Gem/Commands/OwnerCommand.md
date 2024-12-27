# Class: Gem::Commands::OwnerCommand
**Inherits:** Gem::Command
    
**Includes:** Gem::GemcutterUtilities, Gem::LocalRemoteOptions, Gem::Text
  




#Instance Methods
## accept_uri_http() [](#method-i-accept_uri_http)
Allows Gem::OptionParser to handle HTTP URIs.

## add_bulk_threshold_option() [](#method-i-add_bulk_threshold_option)
Add the --bulk-threshold option

## add_clear_sources_option() [](#method-i-add_clear_sources_option)
Add the --clear-sources option

## add_key_option() [](#method-i-add_key_option)
Add the --key option

## add_local_remote_options() [](#method-i-add_local_remote_options)
Add local/remote options to the command line parser.

## add_otp_option() [](#method-i-add_otp_option)
Add the --otp option

## add_owners(name, owners) [](#method-i-add_owners)

## add_proxy_option() [](#method-i-add_proxy_option)
Add the --http-proxy option

## add_source_option() [](#method-i-add_source_option)
Add the --source option

## add_update_sources_option() [](#method-i-add_update_sources_option)
Add the --update-sources option

## api_key() [](#method-i-api_key)
The API key from the command options or from the user's configuration.

## arguments() [](#method-i-arguments)
:nodoc:

## both?() [](#method-i-both?)
Is fetching of local and remote information enabled?

**@return** [Boolean] 

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## description() [](#method-i-description)
:nodoc:

## execute() [](#method-i-execute)

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## initialize() [](#method-i-initialize)

**@return** [OwnerCommand] a new instance of OwnerCommand

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## local?() [](#method-i-local?)
Is local fetching enabled?

**@return** [Boolean] 

## manage_owners(method, name, owners) [](#method-i-manage_owners)

## mfa_unauthorized?(response) [](#method-i-mfa_unauthorized?)

**@return** [Boolean] 

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## otp() [](#method-i-otp)
The OTP code from the command options or from the user's configuration.

## remote?() [](#method-i-remote?)
Is remote fetching enabled?

**@return** [Boolean] 

## remove_owners(name, owners) [](#method-i-remove_owners)

## rubygems_api_request(method, path, hostnil, allowed_push_hostnil, scope:nil, credentials:{}, &block) [](#method-i-rubygems_api_request)
Creates an RubyGems API to `host` and `path` with the given HTTP `method`.

If `allowed_push_host` metadata is present, then it will only allow that host.

## set_api_key(host, key) [](#method-i-set_api_key)
Returns true when the user has enabled multifactor authentication from
`response` text and no otp provided by options.

## show_owners(name) [](#method-i-show_owners)

## sign_in(sign_in_hostnil, scope:nil) [](#method-i-sign_in)
Signs in with the RubyGems API at `sign_in_host` and sets the rubygems API
key.

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## update_scope(scope) [](#method-i-update_scope)

## usage() [](#method-i-usage)
:nodoc:

## verify_api_key(key) [](#method-i-verify_api_key)
Retrieves the pre-configured API key `key` or terminates interaction with an
error.

## webauthn_enabled?() [](#method-i-webauthn_enabled?)

**@return** [Boolean] 

## with_response(response, error_prefixnil) [](#method-i-with_response)
If `response` is an HTTP Success (2XX) response, yields the response if a
block was given or shows the response body to the user.

If the response was not successful, shows an error to the user including the
`error_prefix` and the response body. If the response was a permanent
redirect, shows an error to the user including the redirect location.

