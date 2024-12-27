# Class: Gem::Commands::UpdateCommand
**Inherits:** Gem::Command
    
**Includes:** Gem::InstallUpdateOptions, Gem::LocalRemoteOptions, Gem::VersionOption
  



# Attributes
## installer[RW] [](#attribute-i-installer)
:nodoc:

## updated[RW] [](#attribute-i-updated)
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

## check_latest_rubygems(version) [](#method-i-check_latest_rubygems)
:nodoc:

## check_oldest_rubygems(version) [](#method-i-check_oldest_rubygems)
:nodoc:

## check_update_arguments() [](#method-i-check_update_arguments)
:nodoc:

## defaults_str() [](#method-i-defaults_str)
:nodoc:

## description() [](#method-i-description)
:nodoc:

## execute() [](#method-i-execute)

## fetch_remote_gems(spec) [](#method-i-fetch_remote_gems)
:nodoc:

## get_platform_from_requirements(requirements) [](#method-i-get_platform_from_requirements)
Extract platform given on the command line

## highest_installed_gems() [](#method-i-highest_installed_gems)
:nodoc:

## highest_remote_name_tuple(spec) [](#method-i-highest_remote_name_tuple)
:nodoc:

## initialize() [](#method-i-initialize)

**@return** [UpdateCommand] a new instance of UpdateCommand

## install_rubygems(spec) [](#method-i-install_rubygems)
:nodoc:

## install_update_defaults_str() [](#method-i-install_update_defaults_str)
Default description for the gem install and update commands.

## install_update_options() [](#method-i-install_update_options)
Default options for the gem install and update commands.

## local?() [](#method-i-local?)
Is local fetching enabled?

**@return** [Boolean] 

## preparing_gem_layout_for(version) [](#method-i-preparing_gem_layout_for)

## remote?() [](#method-i-remote?)
Is remote fetching enabled?

**@return** [Boolean] 

## rubygems_target_version() [](#method-i-rubygems_target_version)

## update_gem(name, versionGem::Requirement.default) [](#method-i-update_gem)

## update_gems(gems_to_update) [](#method-i-update_gems)

## update_rubygems() [](#method-i-update_rubygems)
Update RubyGems software to the latest version.

## update_rubygems_arguments() [](#method-i-update_rubygems_arguments)
:nodoc:

## usage() [](#method-i-usage)
:nodoc:

## which_to_update(highest_installed_gems, gem_names) [](#method-i-which_to_update)

