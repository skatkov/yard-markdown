# Class: VCS
**Inherits:** Object
    
**Includes:** DebugSystem
  



# Class Methods
## define_options(parser , opts {}) [](#method-c-define_options)
## detect(path '.', options {}, parser nil, **opts ) [](#method-c-detect)
**@raise** [VCS::NotFoundError] 

## dump(obj , pre nil) [](#method-c-dump)
## local_path?(path ) [](#method-c-local_path?)
**@return** [Boolean] 

## register(dir , &pred ) [](#method-c-register)
## short_revision(rev ) [](#method-c-short_revision)
# Attributes
## debug[RW] [](#attribute-i-debug)
Returns the value of attribute debug.

## dryrun[RW] [](#attribute-i-dryrun)
Returns the value of attribute dryrun.

## srcdir[RW] [](#attribute-i-srcdir)
Returns the value of attribute srcdir.


#Instance Methods
## after_export(dir) [](#method-i-after_export)

## chdir(path) [](#method-i-chdir)

## define_options(parser) [](#method-i-define_options)

## get_revisions(path) [](#method-i-get_revisions)
returns
*   the last revision of the current branch
*   the last revision in which `path` was modified
*   the last modified time of `path`
*   the last commit title since the latest upstream

## initialize(path) [](#method-i-initialize)

**@return** [VCS] a new instance of VCS

## modified(path) [](#method-i-modified)

## relative_to(path) [](#method-i-relative_to)

## release_date(time) [](#method-i-release_date)

## revision_handler(rev) [](#method-i-revision_handler)

## revision_header(last, release_date, release_datetimenil, branchnil, titlenil, limit:20) [](#method-i-revision_header)
make-snapshot generates only release_date whereas file2lastrev generates both
release_date and release_datetime

## revision_name(rev) [](#method-i-revision_name)

## set_options(opts) [](#method-i-set_options)

## short_revision(rev) [](#method-i-short_revision)

## system(*args) [](#method-i-system)

