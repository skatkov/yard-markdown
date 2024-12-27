# Class: Gem::Commands::InstallCommand
**Inherits:** Gem::Command
    
**Includes:** Gem::InstallUpdateOptions, Gem::LocalRemoteOptions, Gem::UpdateSuggestion, Gem::VersionOption
  

Gem installer command line tool

See `gem help install`


# Attributes
## installed_specs[RW] [](#attribute-i-installed_specs)
:nodoc:


#Instance Methods
## accept_uri_http() [](#method-i-accept_uri_http)
Allows Gem::OptionParser to handle HTTP URIs.

## add_bulk_threshold_option() [](#method-i-add_bulk_threshold_option)
Add the --bulk-threshold option

## add_clear_sources_option() [](#method-i-add_clear_sources_option)
Add the --clear-sources option

## add_install_update_options() [](#method-i-add_install_update_options)
Add the install/update options to the option parser.

## add_local_remote_options() [](#method-i-add_local_remote_options)
Add local/remote options to the command line parser.

## add_platform_option(taskcommand, *wrap) [](#method-i-add_platform_option)
Add the --platform option to the option parser.

## add_prerelease_option(*wrap) [](#method-i-add_prerelease_option)
Add the --prerelease option to the option parser.

## add_proxy_option() [](#method-i-add_proxy_option)
Add the --http-proxy option

## add_security_option() [](#method-i-add_security_option)

## add_source_option() [](#method-i-add_source_option)
Add the --source option

## add_update_sources_option() [](#method-i-add_update_sources_option)
Add the --update-sources option

## add_version_option(taskcommand, *wrap) [](#method-i-add_version_option)
Add the --version option to the option parser.

## arguments() [](#method-i-arguments)
:nodoc:

## both?() [](#method-i-both?)
Is fetching of local and remote information enabled?

**@return** [Boolean] 

## check_version() [](#method-i-check_version)
:nodoc:

## defaults_str() [](#method-i-defaults_str)
:nodoc:

## description() [](#method-i-description)
:nodoc:

## eligible_for_update?() [](#method-i-eligible_for_update?)
Determines if current environment is eligible for update suggestion.

**@return** [Boolean] 

## execute() [](#method-i-execute)

## get_platform_from_requirements(requirements) [](#method-i-get_platform_from_requirements)
Extract platform given on the command line

## initialize() [](#method-i-initialize)

**@return** [InstallCommand] a new instance of InstallCommand

## install_from_gemdeps() [](#method-i-install_from_gemdeps)
:nodoc:

## install_gem(name, version) [](#method-i-install_gem)
:nodoc:

## install_gems() [](#method-i-install_gems)
:nodoc:

## install_update_defaults_str() [](#method-i-install_update_defaults_str)
Default description for the gem install and update commands.

## install_update_options() [](#method-i-install_update_options)
Default options for the gem install and update commands.

## load_hooks() [](#method-i-load_hooks)
Loads post-install hooks

## local?() [](#method-i-local?)
Is local fetching enabled?

**@return** [Boolean] 

## remote?() [](#method-i-remote?)
Is remote fetching enabled?

**@return** [Boolean] 

## show_install_errors(errors) [](#method-i-show_install_errors)
:nodoc:

## show_installed() [](#method-i-show_installed)
:nodoc:

## update_suggestion() [](#method-i-update_suggestion)
Message to promote available RubyGems update with related gem update command.

## usage() [](#method-i-usage)
:nodoc:

