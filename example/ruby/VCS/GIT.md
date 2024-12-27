# Class: VCS::GIT
**Inherits:** VCS
    



# Class Methods
## revision_name(rev ) [](#method-c-revision_name)
## short_revision(rev ) [](#method-c-short_revision)

#Instance Methods
## _get_revisions(path, srcdirnil) [](#method-i-_get_revisions)

## branch(name) [](#method-i-branch)

## branch_beginning(url) [](#method-i-branch_beginning)

## branch_list(pat) [](#method-i-branch_list)

## cmd_args(cmds, srcdirnil) [](#method-i-cmd_args)

## cmd_pipe(*cmds, &block) [](#method-i-cmd_pipe)

## cmd_pipe_at(srcdir, cmds, &block) [](#method-i-cmd_pipe_at)

## cmd_read(*cmds) [](#method-i-cmd_read)

## cmd_read_at(srcdir, cmds) [](#method-i-cmd_read_at)

## commit(opts{}) [](#method-i-commit)

## export(revision, url, dir, keep_tempfalse) [](#method-i-export)

## export_changelog(url'@', fromnil, tonil, _pathnil, path:_path, base_url:nil) [](#method-i-export_changelog)

## format_changelog(path, arg, base_urlnil) [](#method-i-format_changelog)

## format_changelog_as_svn(path, arg) [](#method-i-format_changelog_as_svn)

## global_config() [](#method-i-global_config)

## grep(pat, tag, *files, &block) [](#method-i-grep)

## initialize() [](#method-i-initialize)

**@return** [GIT] a new instance of GIT

## master() [](#method-i-master)

## revision_handler(rev) [](#method-i-revision_handler)

## stable() [](#method-i-stable)

## svn_revision(log) [](#method-i-svn_revision)

## upstream() [](#method-i-upstream)

## without_gitconfig() [](#method-i-without_gitconfig)

