# Class: Gem::Package::Old
**Inherits:** Gem::Package
    

The format class knows the guts of the ancient .gem file format and provides
the capability to read such ancient gems.

Please pretend this doesn't exist.



#Instance Methods
## contents() [](#method-i-contents)
A list of file names contained in this gem

## extract_files(destination_dir) [](#method-i-extract_files)
Extracts the files in this package into `destination_dir`

## file_list(io) [](#method-i-file_list)
Reads the file list section from the old-format gem `io`

## initialize(gem, security_policy) [](#method-i-initialize)
Creates a new old-format package reader for `gem`.  Old-format packages cannot
be written.

**@return** [Old] a new instance of Old

## read_until_dashes(io) [](#method-i-read_until_dashes)
Reads lines until a "---" separator is found

## skip_ruby(io) [](#method-i-skip_ruby)
Skips the Ruby self-install header in `io`.

**@raise** [Gem::Exception] 

## spec() [](#method-i-spec)
The specification for this gem

## verify() [](#method-i-verify)
Raises an exception if a security policy that verifies data is active. Old
format gems cannot be verified as signed.

**@raise** [Gem::Security::Exception] 

