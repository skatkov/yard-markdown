# Class: Bundler::CompactIndexClient
**Inherits:** Object
    

The CompactIndexClient is responsible for fetching and parsing the compact
index.

The compact index is a set of caching optimized files that are used to fetch
gem information. The files are:
*   names: a list of all gem names
*   versions: a list of all gem versions
*   [info/](gem): a list of all versions of a gem

The client is instantiated with:
*   `directory`: the root directory where the cache files are stored.
*   `fetcher`: (optional) an object that responds to #call(uri_path, headers)
    and returns an http response.
If the `fetcher` is not provided, the client will only read cached files from
disk.

The client is organized into:
*   `Updater`: updates the cached files on disk using the fetcher.
*   `Cache`: calls the updater, caches files, read and return them from disk
*   `Parser`: parses the compact index file data
*   `CacheFile`: a concurrency safe file reader/writer that verifies checksums

The client is intended to optimize memory usage and performance. It is called
100s or 1000s of times, parsing files with hundreds of thousands of lines. It
may be called concurrently without global interpreter lock in some Rubies. As
a result, some methods may look more complex than necessary to save memory or
time.


# Class Methods
## debug() [](#method-c-debug)

#Instance Methods
## available?() [](#method-i-available?)

**@return** [Boolean] 

## dependencies(names) [](#method-i-dependencies)

## info(name) [](#method-i-info)

## initialize(directory, fetchernil) [](#method-i-initialize)

**@return** [CompactIndexClient] a new instance of CompactIndexClient

## latest_version(name) [](#method-i-latest_version)

## names() [](#method-i-names)

## reset!() [](#method-i-reset!)

## versions() [](#method-i-versions)

