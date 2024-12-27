# Module: Gem::Util
  
**Extended by:** Gem::Deprecate
    

This module contains various utility methods as module methods.


# Class Methods
## correct_for_windows_path(path ) [](#method-c-correct_for_windows_path)
Corrects `path` (usually returned by `Gem::URI.parse().path` on Windows), that
comes with a leading slash.
## deprecate(name , repl , year , month ) [](#method-c-deprecate)
Simple deprecation method that deprecates `name` by wrapping it up in a dummy
method. It warns on each call to the dummy method telling the user of `repl`
(unless `repl` is :none) and the year/month that it is planned to go away.
## glob_files_in_dir(glob , base_path ) [](#method-c-glob_files_in_dir)
Globs for files matching `pattern` inside of `directory`, returning absolute
paths to the matching files.
## gunzip(data ) [](#method-c-gunzip)
Zlib::GzipReader wrapper that unzips `data`.
## gzip(data ) [](#method-c-gzip)
Zlib::GzipWriter wrapper that zips `data`.
## inflate(data ) [](#method-c-inflate)
A Zlib::Inflate#inflate wrapper
## popen(*command ) [](#method-c-popen)
This calls IO.popen and reads the result
## silent_system(*command ) [](#method-c-silent_system)
Invokes system, but silences all output.
## traverse_parents(directory , &block ) [](#method-c-traverse_parents)
Enumerates the parents of `directory`.

