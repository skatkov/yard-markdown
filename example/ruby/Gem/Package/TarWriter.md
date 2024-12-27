# Class: Gem::Package::TarWriter
**Inherits:** Object
    

Allows writing of tar files


# Class Methods
## new(io ) [](#method-c-new)
Creates a new TarWriter, yielding it if a block is given

#Instance Methods
## add_file(name, mode) [](#method-i-add_file)
Adds file `name` with permissions `mode`, and yields an IO for writing the
file to

**@yield** [RestrictedStream.new(@io)] 

## add_file_digest(name, mode, digest_algorithms) [](#method-i-add_file_digest)
Adds `name` with permissions `mode` to the tar, yielding `io` for writing the
file.  The `digest_algorithm` is written to a read-only `name`.sum file
following the given file contents containing the digest name and hexdigest
separated by a tab.

The created digest object is returned.

## add_file_signed(name, mode, signer) [](#method-i-add_file_signed)
Adds `name` with permissions `mode` to the tar, yielding `io` for writing the
file.  The `signer` is used to add a digest file using its digest_algorithm
per add_file_digest and a cryptographic signature in `name`.sig.  If the
signer has no key only the checksum file is added.

Returns the digest.

## add_file_simple(name, mode, size) [](#method-i-add_file_simple)
Add file `name` with permissions `mode` `size` bytes long.  Yields an IO to
write the file to.

**@yield** [os] 

## add_symlink(name, target, mode) [](#method-i-add_symlink)
Adds symlink `name` with permissions `mode`, linking to `target`.

## check_closed() [](#method-i-check_closed)
Raises IOError if the TarWriter is closed

**@raise** [IOError] 

## close() [](#method-i-close)
Closes the TarWriter

## closed?() [](#method-i-closed?)
Is the TarWriter closed?

**@return** [Boolean] 

## flush() [](#method-i-flush)
Flushes the TarWriter's IO

## initialize(io) [](#method-i-initialize)
Creates a new TarWriter that will write to `io`

**@return** [TarWriter] a new instance of TarWriter

## mkdir(name, mode) [](#method-i-mkdir)
Creates a new directory in the tar file `name` with `mode`

## split_name(name) [](#method-i-split_name)
Splits `name` into a name and prefix that can fit in the TarHeader

