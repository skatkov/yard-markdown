# Class: Gem::StreamUI::SilentDownloadReporter
**Inherits:** Object
    

An absolutely silent download reporter.



#Instance Methods
## done() [](#method-i-done)
The silent download reporter won't tell you when the download is done. Because
it is silent.

## fetch(filename, filesize) [](#method-i-fetch)
The silent download reporter does not display `filename` or care about
`filesize` because it is silent.

## initialize(out_stream, *args) [](#method-i-initialize)
The silent download reporter ignores all arguments

**@return** [SilentDownloadReporter] a new instance of SilentDownloadReporter

## update(current) [](#method-i-update)
Nothing can update the silent download reporter.

