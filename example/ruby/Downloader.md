# Class: Downloader
**Inherits:** Object
    



# Class Methods
## cache_file(url , name , cache_dir nil) [](#method-c-cache_file)
## download(url , name , dir nil, since true, options {}) [](#method-c-download)
Downloader.download(url, name, [dir, [since]])

Update a file from url if newer version is available. Creates the file if the
file doesn't yet exist; however, the directory where the file is being created
has to exist already. The `since` parameter can take the following values,
with associated meanings:
    true ::
      Take the last-modified time of the current file on disk, and only download
      if the server has a file that was modified later. Download unconditionally
      if we don't have the file yet. Default.
    +some time value+ ::
      Use this time value instead of the time of modification of the file on disk.
    nil ::
      Only download the file if it doesn't exist yet.
    false ::
      always download url regardless of whether we already have a file,
      and regardless of modification times. (This is essentially just a waste of
      network resources, except in the case that the file we have is somehow damaged.
      Please note that using this recurringly might create or be seen as a
      denial of service attack.)

Example usage:
    download 'http://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt',
             'UnicodeData.txt', 'enc/unicode/data'
## find(dlname ) [](#method-c-find)
## get_option(argv , options ) [](#method-c-get_option)
## http_options(file , since ) [](#method-c-http_options)
## httpdate(date ) [](#method-c-httpdate)
## https() [](#method-c-https)
## https=(https ) [](#method-c-https=)
## https?() [](#method-c-https?)
**@return** [Boolean] 

## link_cache(cache , file , name , verbose false) [](#method-c-link_cache)
## mode_for(data ) [](#method-c-mode_for)
## save_cache(cache , file , name ) [](#method-c-save_cache)
## under(dir , name ) [](#method-c-under)

