# Class: Gem::Commands::UnpackCommand
**Inherits:** Gem::Command
    
**Includes:** Gem::SecurityOption, Gem::VersionOption
  




#Instance Methods
## add_platform_option(taskcommand, *wrap) [](#method-i-add_platform_option)
Add the --platform option to the option parser.

## add_prerelease_option(*wrap) [](#method-i-add_prerelease_option)
Add the --prerelease option to the option parser.

## add_security_option() [](#method-i-add_security_option)

## add_version_option(taskcommand, *wrap) [](#method-i-add_version_option)
Add the --version option to the option parser.

## arguments() [](#method-i-arguments)
:nodoc:

## defaults_str() [](#method-i-defaults_str)
:nodoc:

## description() [](#method-i-description)

## execute() [](#method-i-execute)
-- TODO: allow, e.g., 'gem unpack rake-0.3.1'.  Find a general solution for
this, so that it works for uninstall as well.  (And check other commands at
the same time.)

## find_in_cache(filename) [](#method-i-find_in_cache)
Find cached filename in Gem.path. Returns nil if the file cannot be found.

-- TODO: see comments in get_path() about general service.

## get_path(dependency) [](#method-i-get_path)
Return the full path to the cached gem file matching the given name and
version requirement.  Returns 'nil' if no match.

Example:

    get_path 'rake', '> 0.4' # "/usr/lib/ruby/gems/1.8/cache/rake-0.4.2.gem"
    get_path 'rake', '< 0.1' # nil
    get_path 'rak'           # nil (exact name required)

--

## get_platform_from_requirements(requirements) [](#method-i-get_platform_from_requirements)
Extract platform given on the command line

## initialize() [](#method-i-initialize)

**@return** [UnpackCommand] a new instance of UnpackCommand

## usage() [](#method-i-usage)
:nodoc:

