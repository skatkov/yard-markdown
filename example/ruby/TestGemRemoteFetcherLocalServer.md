# Class: TestGemRemoteFetcherLocalServer
**Inherits:** Gem::TestCase
    
**Includes:** Gem::DefaultUserInteraction
  

# Testing Proxy Settings

These tests check the proper proxy server settings by running two web servers.
 The web server at http://localhost:#{SERVER_PORT} represents the normal gem
server and returns a gemspec with a rake version of 0.4.11.  The web server at
http://localhost:#{PROXY_PORT} represents the proxy server and returns a
different dataset where rake has version 0.4.2.  This allows us to detect
which server is returning the data.

Note that the proxy server is not a **real** proxy server.  But our software
doesn't really care, as long as we hit the proxy URL when a proxy is
configured.



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

## test_fetch_http_with_additional_headers() [](#method-i-test_fetch_http_with_additional_headers)

## test_implicit_no_proxy() [](#method-i-test_implicit_no_proxy)

## test_implicit_proxy() [](#method-i-test_implicit_proxy)

## test_implicit_proxy_no_env() [](#method-i-test_implicit_proxy_no_env)

## test_implicit_upper_case_proxy() [](#method-i-test_implicit_upper_case_proxy)

## test_no_proxy() [](#method-i-test_no_proxy)

## test_observe_no_proxy_env_list() [](#method-i-test_observe_no_proxy_env_list)

## test_observe_no_proxy_env_single_host() [](#method-i-test_observe_no_proxy_env_single_host)

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

