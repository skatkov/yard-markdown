# Class: Tarball
**Inherits:** Object
    



# Class Methods
## parse(wwwdir , version ) [](#method-c-parse)
*   /home/naruse/obj/ruby-trunk/tmp/ruby-2.6.0-preview3.tar.gz SIZE:  
    17116009 bytes SHA1:   21f62c369661a2ab1b521fd2fa8191a4273e12a1 SHA256:
    97cea8aa63dfa250ba6902b658a7aa066daf817b22f82b7ee28f44aec7c2e394 SHA512:
    1e2042324821bb4e110af7067f52891606dcfc71e640c194ab1c117f0b941550e0b3ac36ad
    3511214ac80c536b9e5cfaf8789eec74cf56971a832ea8fc4e6d94
## update_branches_yml(ver , xy , wwwdir ) [](#method-c-update_branches_yml)
## update_downloads_yml(ver , xy , wwwdir ) [](#method-c-update_downloads_yml)
## update_releases_yml(ver , xy , ary , wwwdir , files_changed , insertions , deletions ) [](#method-c-update_releases_yml)
# Attributes
## sha1[RW] [](#attribute-i-sha1)
Returns the value of attribute sha1.

## sha256[RW] [](#attribute-i-sha256)
Returns the value of attribute sha256.

## sha512[RW] [](#attribute-i-sha512)
Returns the value of attribute sha512.

## size[RW] [](#attribute-i-size)
Returns the value of attribute size.

## version[RW] [](#attribute-i-version)
Returns the value of attribute version.


#Instance Methods
## ext() [](#method-i-ext)

## gz?() [](#method-i-gz?)

**@return** [Boolean] 

## initialize(version, url, size, sha1, sha256, sha512) [](#method-i-initialize)

**@return** [Tarball] a new instance of Tarball

## to_md() [](#method-i-to_md)

## xz?() [](#method-i-xz?)

**@return** [Boolean] 

## zip?() [](#method-i-zip?)

**@return** [Boolean] 

