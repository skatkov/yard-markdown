# Class: Bundler::CompactIndexClient::CacheFile
**Inherits:** Object
    

write cache files in a way that is robust to concurrent modifications if
digests are given, the checksums will be verified


# Class Methods
## copy(path , &block ) [](#method-c-copy)
Initialize with a copy of the original file, then yield the instance.
## write(path , data , digests nil) [](#method-c-write)
Write data to a temp file, then replace the original file with it verifying
the digests if given.
# Attributes
## original_path[RW] [](#attribute-i-original_path)
Returns the value of attribute original_path.

## path[RW] [](#attribute-i-path)
Returns the value of attribute path.


#Instance Methods
## append(data) [](#method-i-append)
Returns false without appending when no digests since appending is too error
prone to do without digests.

## close() [](#method-i-close)
Remove the temp file without replacing the original file. The file is
permanently closed.

## commit() [](#method-i-commit)
Replace the original file with the temp file without verifying digests. The
file is permanently closed.

**@raise** [ClosedError] 

## commit!() [](#method-i-commit!)

## digests=(expected_digests) [](#method-i-digests=)
set the digests that will be verified at the end

## digests?() [](#method-i-digests?)

**@return** [Boolean] 

## initialize(original_path, &block) [](#method-i-initialize)

**@return** [CacheFile] a new instance of CacheFile

## initialize_digests(keysnil) [](#method-i-initialize_digests)
initialize the digests using CompactIndexClient::SUPPORTED_DIGESTS, or a
subset based on keys.

## open(write_mode"wb", perm@perm, &block) [](#method-i-open)
Open the temp file for writing, reusing original permissions, yielding the IO
object.

**@raise** [ClosedError] 

## reset_digests() [](#method-i-reset_digests)
reset the digests so they don't contain any previously read data

## size() [](#method-i-size)

## verify() [](#method-i-verify)
Verify the digests, returning true on match, false on mismatch.

## write(data) [](#method-i-write)

