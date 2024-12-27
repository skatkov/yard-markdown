# Class: Gem::Commands::UninstallCommand
**Inherits:** Gem::Command
    
**Includes:** Gem::VersionOption
  

Gem uninstaller command line tool

See `gem help uninstall`



#Instance Methods
## add_platform_option(taskcommand, *wrap) [](#method-i-add_platform_option)
Add the --platform option to the option parser.

## add_prerelease_option(*wrap) [](#method-i-add_prerelease_option)
Add the --prerelease option to the option parser.

## add_version_option(taskcommand, *wrap) [](#method-i-add_version_option)
Add the --version option to the option parser.

## arguments() [](#method-i-arguments)
:nodoc:

## check_version() [](#method-i-check_version)
:nodoc:

## defaults_str() [](#method-i-defaults_str)
:nodoc:

## description() [](#method-i-description)
:nodoc:

## execute() [](#method-i-execute)

## get_platform_from_requirements(requirements) [](#method-i-get_platform_from_requirements)
Extract platform given on the command line

## initialize() [](#method-i-initialize)

**@return** [UninstallCommand] a new instance of UninstallCommand

## uninstall(gem_name) [](#method-i-uninstall)

## uninstall_all() [](#method-i-uninstall_all)

## uninstall_gem(gem_name) [](#method-i-uninstall_gem)

## uninstall_specific() [](#method-i-uninstall_specific)

## usage() [](#method-i-usage)
:nodoc:

