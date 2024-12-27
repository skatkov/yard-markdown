# Class: TestGemRemoteFetcher
**Inherits:** Gem::TestCase
    
**Includes:** Gem::DefaultUserInteraction
  



# Class Methods
## fetch_path(uri , mtime nil, head false) [](#method-c-fetch_path)

#Instance Methods
## assert_error(exception_classException) [](#method-i-assert_error)

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

## test_cache_update_path() [](#method-i-test_cache_update_path)

## test_cache_update_path_no_update() [](#method-i-test_cache_update_path_no_update)

## test_cache_update_path_with_utf8_internal_encoding() [](#method-i-test_cache_update_path_with_utf8_internal_encoding)

## test_download() [](#method-i-test_download)

## test_download_cached() [](#method-i-test_download_cached)

## test_download_install_dir() [](#method-i-test_download_install_dir)

## test_download_local() [](#method-i-test_download_local)

## test_download_local_read_only() [](#method-i-test_download_local_read_only)

## test_download_local_space() [](#method-i-test_download_local_space)

## test_download_platform_legacy() [](#method-i-test_download_platform_legacy)

## test_download_read_only() [](#method-i-test_download_read_only)

## test_download_same_file() [](#method-i-test_download_same_file)

## test_download_to_cache() [](#method-i-test_download_to_cache)

## test_download_unsupported() [](#method-i-test_download_unsupported)

## test_download_with_auth() [](#method-i-test_download_with_auth)

## test_download_with_encoded_auth() [](#method-i-test_download_with_encoded_auth)

## test_download_with_token() [](#method-i-test_download_with_token)

## test_download_with_x_oauth_basic() [](#method-i-test_download_with_x_oauth_basic)

## test_fetch_http() [](#method-i-test_fetch_http)

## test_fetch_http_redirects() [](#method-i-test_fetch_http_redirects)

## test_fetch_http_redirects_without_location() [](#method-i-test_fetch_http_redirects_without_location)

## test_fetch_path_bad_uri() [](#method-i-test_fetch_path_bad_uri)

## test_fetch_path_getaddrinfo_error() [](#method-i-test_fetch_path_getaddrinfo_error)

## test_fetch_path_gzip() [](#method-i-test_fetch_path_gzip)

## test_fetch_path_gzip_unmodified() [](#method-i-test_fetch_path_gzip_unmodified)

## test_fetch_path_io_error() [](#method-i-test_fetch_path_io_error)

## test_fetch_path_openssl_ssl_sslerror() [](#method-i-test_fetch_path_openssl_ssl_sslerror)

## test_fetch_path_socket_error() [](#method-i-test_fetch_path_socket_error)

## test_fetch_path_system_call_error() [](#method-i-test_fetch_path_system_call_error)

## test_fetch_path_timeout_error() [](#method-i-test_fetch_path_timeout_error)

## test_fetch_path_unmodified() [](#method-i-test_fetch_path_unmodified)

## test_request_block() [](#method-i-test_request_block)

## test_self_fetcher() [](#method-i-test_self_fetcher)

## test_self_fetcher_with_proxy() [](#method-i-test_self_fetcher_with_proxy)

## test_yaml_error_on_size() [](#method-i-test_yaml_error_on_size)

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## util_fuck_with_fetcher(data, blowfalse) [](#method-i-util_fuck_with_fetcher)

