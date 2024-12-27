# Class: TestGemRemoteFetcherLocalSSLServer
**Inherits:** Gem::TestCase
    
**Includes:** Gem::DefaultUserInteraction
  




#Instance Methods
## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## test_do_not_allow_insecure_ssl_connection_by_default() [](#method-i-test_do_not_allow_insecure_ssl_connection_by_default)

## test_do_not_allow_invalid_client_cert_auth_connection() [](#method-i-test_do_not_allow_invalid_client_cert_auth_connection)

## test_do_not_follow_insecure_redirect() [](#method-i-test_do_not_follow_insecure_redirect)

## test_nil_ca_cert() [](#method-i-test_nil_ca_cert)

## test_ssl_client_cert_auth_connection() [](#method-i-test_ssl_client_cert_auth_connection)

## test_ssl_connection() [](#method-i-test_ssl_connection)

## test_ssl_connection_allow_verify_none() [](#method-i-test_ssl_connection_allow_verify_none)

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

