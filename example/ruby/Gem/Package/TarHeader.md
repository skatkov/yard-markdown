# Class: Gem::Package::TarHeader
**Inherits:** Object
    

-- struct tarfile_entry_posix {
    char name[100];     # ASCII + (Z unless filled)
    char mode[8];       # 0 padded, octal, null
    char uid[8];        # ditto
    char gid[8];        # ditto
    char size[12];      # 0 padded, octal, null
    char mtime[12];     # 0 padded, octal, null
    char checksum[8];   # 0 padded, octal, null, space
    char typeflag[1];   # file: "0"  dir: "5"
    char linkname[100]; # ASCII + (Z unless filled)
    char magic[6];      # "ustar\0"
    char version[2];    # "00"
    char uname[32];     # ASCIIZ
    char gname[32];     # ASCIIZ
    char devmajor[8];   # 0 padded, octal, null
    char devminor[8];   # o padded, octal, null
    char prefix[155];   # ASCII + (Z unless filled)

}; ++ A header for a tar file


# Class Methods
## from(stream ) [](#method-c-from)
Creates a tar header from IO `stream`
## oct_or_256based(str ) [](#method-c-oct_or_256based)
## strict_oct(str ) [](#method-c-strict_oct)
**@raise** [ArgumentError] 


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## empty?() [](#method-i-empty?)
Is the tar entry empty?

**@return** [Boolean] 

## full_name() [](#method-i-full_name)
Header's full name, including prefix

## initialize(vals) [](#method-i-initialize)
Creates a new TarHeader using `vals`

**@return** [TarHeader] a new instance of TarHeader

## to_s() [](#method-i-to_s)
:nodoc:

## update_checksum() [](#method-i-update_checksum)
Updates the TarHeader's checksum

