# Class: Gem::StreamUI::ThreadedDownloadReporter
**Inherits:** Object
    

A progress reporter that behaves nicely with threaded downloading.


# Attributes
## file_name[RW] [](#attribute-i-file_name)
The current file name being displayed


#Instance Methods
## done() [](#method-i-done)
Indicates the download is complete.

## fetch(file_name, *args) [](#method-i-fetch)
Tells the download reporter that the `file_name` is being fetched. The other
arguments are ignored.

## initialize(out_stream, *args) [](#method-i-initialize)
Creates a new threaded download reporter that will display on `out_stream`. 
The other arguments are ignored.

**@return** [ThreadedDownloadReporter] a new instance of ThreadedDownloadReporter

## update(bytes) [](#method-i-update)
Updates the threaded download reporter for the given number of `bytes`.

