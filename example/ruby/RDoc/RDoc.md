# Class: RDoc::RDoc
**Inherits:** Object
    

This is the driver for generating RDoc output.  It handles file parsing and
generation of output.

To use this class to generate RDoc output via the API, the recommended way is:

    rdoc = RDoc::RDoc.new
    options = RDoc::Options.load_options # returns an RDoc::Options instance
    # set extra options
    rdoc.document options

You can also generate output like the `rdoc` executable:

    rdoc = RDoc::RDoc.new
    rdoc.document argv

Where `argv` is an array of strings, each corresponding to an argument you'd
give rdoc on the command line.  See `rdoc --help` for details.


# Class Methods
## add_generator(klass ) [](#method-c-add_generator)
Add `klass` that can generate output after parsing
## current() [](#method-c-current)
Active RDoc::RDoc instance
## current=(rdoc ) [](#method-c-current=)
Sets the active RDoc::RDoc instance
# Attributes
## generator[RW] [](#attribute-i-generator)
Generator instance used for creating output

## last_modified[RW] [](#attribute-i-last_modified)
Hash of files and their last modified times.

## options[RW] [](#attribute-i-options)
RDoc options

## stats[RW] [](#attribute-i-stats)
Accessor for statistics.  Available after each call to parse_files

## store[RW] [](#attribute-i-store)
The current documentation store


#Instance Methods
## document(options) [](#method-i-document)
Generates documentation or a coverage report depending upon the settings in
`options`.

`options` can be either an RDoc::Options instance or an array of strings
equivalent to the strings that would be passed on the command line like `%w[-q
-o doc -t My\ Doc\ Title]`.  #document will automatically call
RDoc::Options#finish if an options instance was given.

For a list of options, see either RDoc::Options or `rdoc --help`.

By default, output will be stored in a directory called "doc" below the
current directory, so make sure you're somewhere writable before invoking.

## error(msg) [](#method-i-error)
Report an error message and exit

**@raise** [RDoc::Error] 

## gather_files(files) [](#method-i-gather_files)
Gathers a set of parseable files from the files and directories listed in
`files`.

## generate() [](#method-i-generate)
Generates documentation for `file_info` (from #parse_files) into the output
dir using the generator selected by the RDoc options

## handle_pipe() [](#method-i-handle_pipe)
Turns RDoc from stdin into HTML

## initialize() [](#method-i-initialize)
Creates a new RDoc::RDoc instance.  Call #document to parse files and generate
documentation.

**@return** [RDoc] a new instance of RDoc

## install_siginfo_handler() [](#method-i-install_siginfo_handler)
Installs a siginfo handler that prints the current filename.

## list_files_in_directory(dir) [](#method-i-list_files_in_directory)
Return a list of the files to be processed in a directory. We know that this
directory doesn't have a .document file, so we're looking for real files.
However we may well contain subdirectories which must be tested for .document
files.

## normalized_file_list(relative_files, force_docfalse, exclude_patternnil) [](#method-i-normalized_file_list)
Given a list of files and directories, create a list of all the Ruby files
they contain.

If `force_doc` is true we always add the given files, if false, only add files
that we guarantee we can parse.  It is true when looking at files given on the
command line, false when recursing through subdirectories.

The effect of this is that if you want a file with a non-standard extension
parsed, you must name it explicitly.

## output_flag_file(op_dir) [](#method-i-output_flag_file)
Return the path name of the flag file in an output directory.

## parse_dot_doc_file(in_dir, filename) [](#method-i-parse_dot_doc_file)
The .document file contains a list of file and directory name patterns,
representing candidates for documentation. It may also contain comments
(starting with '#')

## parse_file(filename) [](#method-i-parse_file)
Parses `filename` and returns an RDoc::TopLevel

## parse_files(files) [](#method-i-parse_files)
Parse each file on the command line, recursively entering directories.

## remove_siginfo_handler() [](#method-i-remove_siginfo_handler)
Removes a siginfo handler and replaces the previous

## remove_unparseable(files) [](#method-i-remove_unparseable)
Removes file extensions known to be unparseable from `files` and TAGS files
for emacs and vim.

## setup_output_dir(dir, force) [](#method-i-setup_output_dir)
Create an output dir if it doesn't exist. If it does exist, but doesn't
contain the flag file `created.rid` then we refuse to use it, as we may
clobber some manually generated documentation

## update_output_dir(op_dir, time, last{}) [](#method-i-update_output_dir)
Update the flag file in an output directory.

