# Class: Gem::FakeFetcher
**Inherits:** Object
    

A fake Gem::RemoteFetcher for use in tests or to avoid real live HTTP requests
when testing code that uses RubyGems.

Example:

    @fetcher = Gem::FakeFetcher.new
    @fetcher.data['http://gems.example.com/yaml'] = source_index.to_yaml
    Gem::RemoteFetcher.fetcher = @fetcher

    use nested array if multiple response is needed

    @fetcher.data['http://gems.example.com/sequence'] = [['Success', 200, 'OK'], ['Failed', 401, 'Unauthorized']]

    @fetcher.fetch_path('http://gems.example.com/sequence') # => ['Success', 200, 'OK']
    @fetcher.fetch_path('http://gems.example.com/sequence') # => ['Failed', 401, 'Unauthorized']

    # invoke RubyGems code

    paths = @fetcher.paths
    assert_equal 'http://gems.example.com/yaml', paths.shift
    assert paths.empty?, paths.join(', ')

See RubyGems' tests for more examples of FakeFetcher.


# Attributes
## data[RW] [](#attribute-i-data)
Returns the value of attribute data.

## paths[RW] [](#attribute-i-paths)
Returns the value of attribute paths.

## requests[RW] [](#attribute-i-requests)
Returns the value of attribute requests.


#Instance Methods
## cache_update_path(uri, pathnil, updatetrue) [](#method-i-cache_update_path)

## create_response(uri) [](#method-i-create_response)

**@raise** [TypeError] 

## download(spec, source_uri, install_dirGem.dir) [](#method-i-download)

## download_to_cache(dependency) [](#method-i-download_to_cache)

## fetch_path(path, mtimenil, headfalse) [](#method-i-fetch_path)

## fetch_size(path) [](#method-i-fetch_size)

**@raise** [ArgumentError] 

## find_data(path) [](#method-i-find_data)

**@raise** [ArgumentError] 

## initialize() [](#method-i-initialize)

**@return** [FakeFetcher] a new instance of FakeFetcher

## last_request() [](#method-i-last_request)

## open_uri_or_path(path) [](#method-i-open_uri_or_path)
Thanks, FakeWeb!

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## request(uri, request_class, last_modifiednil) [](#method-i-request)

**@yield** [last_request] 

