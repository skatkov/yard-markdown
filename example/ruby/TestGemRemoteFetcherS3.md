# Class: TestGemRemoteFetcherS3
**Inherits:** Gem::TestCase
    
**Includes:** Gem::DefaultUserInteraction
  




#Instance Methods
## assert_fetch_s3(url, signature, tokennil, region"us-east-1", instance_profile_jsonnil) [](#method-i-assert_fetch_s3)

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

## refute_fetch_s3(url, expected_message) [](#method-i-refute_fetch_s3)

## setup() [](#method-i-setup)

## test_fetch_s3_config_creds() [](#method-i-test_fetch_s3_config_creds)

## test_fetch_s3_config_creds_with_region() [](#method-i-test_fetch_s3_config_creds_with_region)

## test_fetch_s3_config_creds_with_token() [](#method-i-test_fetch_s3_config_creds_with_token)

## test_fetch_s3_env_creds() [](#method-i-test_fetch_s3_env_creds)

## test_fetch_s3_env_creds_with_region() [](#method-i-test_fetch_s3_env_creds_with_region)

## test_fetch_s3_env_creds_with_token() [](#method-i-test_fetch_s3_env_creds_with_token)

## test_fetch_s3_instance_profile_creds() [](#method-i-test_fetch_s3_instance_profile_creds)

## test_fetch_s3_instance_profile_creds_with_region() [](#method-i-test_fetch_s3_instance_profile_creds_with_region)

## test_fetch_s3_instance_profile_creds_with_token() [](#method-i-test_fetch_s3_instance_profile_creds_with_token)

## test_fetch_s3_no_host() [](#method-i-test_fetch_s3_no_host)

## test_fetch_s3_no_id() [](#method-i-test_fetch_s3_no_id)

## test_fetch_s3_no_secret() [](#method-i-test_fetch_s3_no_secret)

## test_fetch_s3_no_source_key() [](#method-i-test_fetch_s3_no_source_key)

## test_fetch_s3_url_creds() [](#method-i-test_fetch_s3_url_creds)

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

