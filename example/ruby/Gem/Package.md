# Class: Gem::Package
**Inherits:** Object
    
**Includes:** Gem::UserInteraction
  

Example using a Gem::Package

Builds a .gem file given a Gem::Specification. A .gem file is a tarball which
contains a data.tar.gz, metadata.gz, checksums.yaml.gz and possibly
signatures.

    require 'rubygems'
    require 'rubygems/package'

    spec = Gem::Specification.new do |s|
      s.summary = "Ruby based make-like utility."
      s.name = 'rake'
      s.version = PKG_VERSION
      s.requirements << 'none'
      s.files = PKG_FILES
      s.description = <<-EOF
    Rake is a Make-like program implemented in Ruby. Tasks
    and dependencies are specified in standard Ruby syntax.
      EOF
    end

    Gem::Package.build spec

Reads a .gem file.

    require 'rubygems'
    require 'rubygems/package'

    the_gem = Gem::Package.new(path_to_dot_gem)
    the_gem.contents # get the files in the gem
    the_gem.extract_files destination_directory # extract the gem into a directory
    the_gem.spec # get the spec out of the gem
    the_gem.verify # check the gem is OK (contains valid gem specification, contains a not corrupt contents archive)

#files are the files in the .gem tar file, not the Ruby files in the gem
#extract_files and #contents automatically call #verify


# Class Methods
## build(spec , skip_validation false, strict_validation false, file_name nil) [](#method-c-build)
## new(gem , security_policy nil) [](#method-c-new)
Creates a new Gem::Package for the file at `gem`. `gem` can also be provided
as an IO object.

If `gem` is an existing file in the old format a Gem::Package::Old will be
returned.
## raw_spec(path , security_policy nil) [](#method-c-raw_spec)
Extracts the Gem::Specification and raw metadata from the .gem file at `path`.
--
# Attributes
## build_time[RW] [](#attribute-i-build_time)
:nodoc:

## checksums[RW] [](#attribute-i-checksums)
Checksums for the contents of the package

## data_mode[RW] [](#attribute-i-data_mode)
Permission for other files

## dir_mode[RW] [](#attribute-i-dir_mode)
Permission for directories

## files[RW] [](#attribute-i-files)
The files in this package.  This is not the contents of the gem, just the
files in the top-level container.

## gem[RW] [](#attribute-i-gem)
Reference to the gem being packaged.

## prog_mode[RW] [](#attribute-i-prog_mode)
Permission for program files

## security_policy[RW] [](#attribute-i-security_policy)
The security policy used for verifying the contents of this package.

## spec[RW] [](#attribute-i-spec)
The spec for this gem.

If this is a package for a built gem the spec is loaded from the gem and
returned.  If this is a package for a gem being built the provided spec is
returned.


#Instance Methods
## add_checksums(tar) [](#method-i-add_checksums)
Adds a checksum for each entry in the gem to checksums.yaml.gz.

## add_contents(tar) [](#method-i-add_contents)
Adds the files listed in the packages's Gem::Specification to data.tar.gz and
adds this file to the `tar`.

## add_files(tar) [](#method-i-add_files)
Adds files included the package's Gem::Specification to the `tar` file

## add_metadata(tar) [](#method-i-add_metadata)
Adds the package's Gem::Specification to the `tar` file

## alert(statement, questionnil) [](#method-i-alert)
Displays an alert `statement`.  Asks a `question` if given.

## alert_error(statement, questionnil) [](#method-i-alert_error)
Displays an error `statement` to the error output location.  Asks a `question`
if given.

## alert_warning(statement, questionnil) [](#method-i-alert_warning)
Displays a warning `statement` to the warning output location.  Asks a
`question` if given.

## ask(question) [](#method-i-ask)
Asks a `question` and returns the answer.

## ask_for_password(prompt) [](#method-i-ask_for_password)
Asks for a password with a `prompt`

## ask_yes_no(question, defaultnil) [](#method-i-ask_yes_no)
Asks a yes or no `question`.  Returns true for yes, false for no.

## build(skip_validationfalse, strict_validationfalse) [](#method-i-build)
Builds this package based on the specification set by #spec=

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## contents() [](#method-i-contents)
A list of file names contained in this gem

## copy_stream(src, dst) [](#method-i-copy_stream)
:nodoc:

## copy_to(path) [](#method-i-copy_to)
Copies this package to `path` (if possible)

## digest(entry) [](#method-i-digest)
Creates a digest of the TarEntry `entry` from the digest algorithm set by the
security policy.

## extract_files(destination_dir, pattern"*") [](#method-i-extract_files)
Extracts the files in this package into `destination_dir`

If `pattern` is specified, only entries matching that glob will be extracted.

## extract_tar_gz(io, destination_dir, pattern"*") [](#method-i-extract_tar_gz)
Extracts all the files in the gzipped tar archive `io` into `destination_dir`.

If an entry in the archive contains a relative path above `destination_dir` or
an absolute path is encountered an exception is raised.

If `pattern` is specified, only entries matching that glob will be extracted.

## file_mode(mode) [](#method-i-file_mode)
:nodoc:

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## gzip_to(io) [](#method-i-gzip_to)
Gzips content written to `gz_io` to `io`. -- Also sets the gzip modification
time to the package build time to ease testing.

## initialize(gem, security_policy) [](#method-i-initialize)
Creates a new package that will read or write to the file `gem`.

**@return** [Package] a new instance of Package

## install_location(filename, destination_dir) [](#method-i-install_location)
Returns the full path for installing `filename`.

If `filename` is not inside `destination_dir` an exception is raised.

**@raise** [Gem::Package::PathError] 

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## limit_read(io, name, limit) [](#method-i-limit_read)

**@raise** [Gem::Package::FormatError] 

## load_spec(entry) [](#method-i-load_spec)
Loads a Gem::Specification from the TarEntry `entry`

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## normalize_path(pathname) [](#method-i-normalize_path)

## open_tar_gz(io) [](#method-i-open_tar_gz)
Opens `io` as a gzipped tar archive

## read_checksums(gem) [](#method-i-read_checksums)
Reads and loads checksums.yaml.gz from the tar file `gem`

## say(statement"") [](#method-i-say)
Displays the given `statement` on the standard output (or equivalent).

## setup_signer(signer_options:{}) [](#method-i-setup_signer)
Prepares the gem for signing and checksum generation.  If a signing
certificate and key are not present only checksum generation is set up.

## terminate_interaction(exit_code0) [](#method-i-terminate_interaction)
Terminates the RubyGems process with the given `exit_code`

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

## verify() [](#method-i-verify)
Verifies that this gem:

*   Contains a valid gem specification
*   Contains a contents archive
*   The contents archive is not corrupt

After verification the gem specification from the gem is available from #spec

## verify_checksums(digests, checksums) [](#method-i-verify_checksums)
Verifies the `checksums` against the `digests`.  This check is not
cryptographically secure.  Missing checksums are ignored.

## verify_entry(entry) [](#method-i-verify_entry)
Verifies `entry` in a .gem file.

## verify_files(gem) [](#method-i-verify_files)
Verifies the files of the `gem`

## verify_gz(entry) [](#method-i-verify_gz)
Verifies that `entry` is a valid gzipped file.

