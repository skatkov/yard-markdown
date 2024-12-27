# Class: Bundler::Fetcher
**Inherits:** Object
    

Handles all the fetching with the rubygems server


# Attributes
## api_timeout[RW] [](#attribute-c-api_timeout)
Returns the value of attribute api_timeout.

## disable_endpoint[RW] [](#attribute-c-disable_endpoint)
Returns the value of attribute disable_endpoint.

## max_retries[RW] [](#attribute-c-max_retries)
Returns the value of attribute max_retries.

## redirect_limit[RW] [](#attribute-c-redirect_limit)
Returns the value of attribute redirect_limit.


#Instance Methods
## api_fetcher?() [](#method-i-api_fetcher?)

**@return** [Boolean] 

## fetch_spec(spec) [](#method-i-fetch_spec)
fetch a gem specification

## gem_remote_fetcher() [](#method-i-gem_remote_fetcher)

## http_proxy() [](#method-i-http_proxy)

## initialize(remote) [](#method-i-initialize)

**@return** [Fetcher] a new instance of Fetcher

## inspect() [](#method-i-inspect)

## specs(gem_names, source) [](#method-i-specs)
return the specs in the bundler format as an index

## specs_with_retry(gem_names, source) [](#method-i-specs_with_retry)
return the specs in the bundler format as an index with retries

## uri() [](#method-i-uri)

## user_agent() [](#method-i-user_agent)

