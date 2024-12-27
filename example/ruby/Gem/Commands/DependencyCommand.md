# Class: Gem::Commands::DependencyCommand
**Inherits:** Gem::Command
    
**Includes:** Gem::LocalRemoteOptions, Gem::VersionOption
  




#Instance Methods
## accept_uri_http() [](#method-i-accept_uri_http)
Allows Gem::OptionParser to handle HTTP URIs.

## add_bulk_threshold_option() [](#method-i-add_bulk_threshold_option)
Add the --bulk-threshold option

## add_clear_sources_option() [](#method-i-add_clear_sources_option)
Add the --clear-sources option

## add_local_remote_options() [](#method-i-add_local_remote_options)
Add local/remote options to the command line parser.

## add_platform_option(taskcommand, *wrap) [](#method-i-add_platform_option)
Add the --platform option to the option parser.

## add_prerelease_option(*wrap) [](#method-i-add_prerelease_option)
Add the --prerelease option to the option parser.

## add_proxy_option() [](#method-i-add_proxy_option)
Add the --http-proxy option

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

## defaults_str() [](#method-i-defaults_str)
:nodoc:

## description() [](#method-i-description)
:nodoc:

## display_pipe(specs) [](#method-i-display_pipe)
:nodoc:

## display_readable(specs, reverse) [](#method-i-display_readable)
:nodoc:

## ensure_local_only_reverse_dependencies() [](#method-i-ensure_local_only_reverse_dependencies)
:nodoc:

## ensure_specs(specs) [](#method-i-ensure_specs)
:nodoc:

## execute() [](#method-i-execute)

## fetch_remote_specs(name, requirement, prerelease) [](#method-i-fetch_remote_specs)
:nodoc:

## fetch_specs(name_pattern, requirement, prerelease) [](#method-i-fetch_specs)
:nodoc:

## find_reverse_dependencies(spec) [](#method-i-find_reverse_dependencies)
Returns an Array of [specification, dep] that are satisfied by `spec`.

## get_platform_from_requirements(requirements) [](#method-i-get_platform_from_requirements)
Extract platform given on the command line

## initialize() [](#method-i-initialize)

**@return** [DependencyCommand] a new instance of DependencyCommand

## local?() [](#method-i-local?)
Is local fetching enabled?

**@return** [Boolean] 

## print_dependencies(spec, level0) [](#method-i-print_dependencies)
:nodoc:

## remote?() [](#method-i-remote?)
Is remote fetching enabled?

**@return** [Boolean] 

## reverse_dependencies(specs) [](#method-i-reverse_dependencies)
:nodoc:

## usage() [](#method-i-usage)
:nodoc:

