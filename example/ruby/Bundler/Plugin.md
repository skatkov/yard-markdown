# Module: Bundler::Plugin
    

SourceList object to be used while parsing the Gemfile, setting the
approptiate options to be used with Source classes for plugin installation


# Class Methods
## add_command(command , cls ) [](#method-c-add_command)
To be called via the API to register to handle a command
## add_hook(event , &block ) [](#method-c-add_hook)
To be called via the API to register a hooks and corresponding block that will
be called to handle the hook
## add_source(source , cls ) [](#method-c-add_source)
To be called via the API to register to handle a source plugin
## cache() [](#method-c-cache)
The cache directory for plugin stuffs
## command?(command ) [](#method-c-command?)
Checks if any plugin handles the command
**@return** [Boolean] 

## exec_command(command , args ) [](#method-c-exec_command)
To be called from Cli class to pass the command and argument to appropriate
plugin class
**@raise** [UndefinedCommandError] 

## from_lock(locked_opts ) [](#method-c-from_lock)
**@param** [Hash] options that are present in the lock file

**@return** [API::Source] the instance of the class that handles the source
type passed in locked_opts

## gemfile_install(gemfile nil, &inline ) [](#method-c-gemfile_install)
Evaluates the Gemfile with a limited DSL and installs the plugins specified by
plugin method
**@param** [Pathname] path

**@param** [Proc] that can be evaluated for (inline) Gemfile

## global_root() [](#method-c-global_root)
The global directory root for all plugin related data
## hook(event , *args , &arg_blk ) [](#method-c-hook)
Runs all the hooks that are registered for the passed event

It passes the passed arguments and block to the block registered with the api.
**@param** [String] 

## index() [](#method-c-index)
The index object used to store the details about the plugin
## install(names , options ) [](#method-c-install)
Installs a new plugin by the given name
**@param** [Array<String>] the name of plugin to be installed

**@param** [Hash] various parameters as described in description.
Refer to cli/plugin for available options

## installed?(plugin ) [](#method-c-installed?)
currently only intended for specs
**@return** [String, nil] installed path

## list() [](#method-c-list)
List installed plugins and commands
## load_plugin(name ) [](#method-c-load_plugin)
Executes the plugins.rb file
**@param** [String] of the plugin

## loaded?(plugin ) [](#method-c-loaded?)
**@return** [true, false] whether the plugin is loaded

## local_root() [](#method-c-local_root)
## register_plugin(name , spec , optional_plugin false) [](#method-c-register_plugin)
Runs the plugins.rb file in an isolated namespace, records the plugin actions
it registers for and then passes the data to index to be stored.
**@param** [String] the name of the plugin

**@param** [Specification] of installed plugin

**@param** [Boolean] removed if there is conflict with any
other plugin (used for default source plugins)

**@raise** [MalformattedPlugin] if plugins.rb raises any error

## reset!() [](#method-c-reset!)
## root() [](#method-c-root)
The directory root for all plugin related data

If run in an app, points to local root, in app_config_path Otherwise, points
to global root, in Bundler.user_bundle_path("plugin")
## save_plugin(name , spec , optional_plugin false) [](#method-c-save_plugin)
Validates and registers a plugin.
**@param** [String] the name of the plugin

**@param** [Specification] of installed plugin

**@param** [Boolean] removed if there is conflict with any
other plugin (used for default source plugins)

**@raise** [PluginInstallError] if validation or registration raises any error

## save_plugins(plugins , specs , optional_plugins []) [](#method-c-save_plugins)
Post installation processing and registering with index
**@param** [Array<String>] list to be installed

**@param** [Hash] of plugins mapped to installation path (currently they
contain all the installed specs, including plugins)

**@param** [Array<String>] of inferred source plugins that can be ignored

## source(name ) [](#method-c-source)
**@raise** [UnknownSourceError] 

**@return** [Class] that handles the source. The class includes API::Source

## source?(name ) [](#method-c-source?)
Checks if any plugin declares the source
**@return** [Boolean] 

## uninstall(names , options ) [](#method-c-uninstall)
Uninstalls plugins by the given names
**@param** [Array<String>] the names of plugins to be uninstalled

## validate_plugin!(plugin_path ) [](#method-c-validate_plugin!)
Checks if the gem is good to be a plugin

At present it only checks whether it contains plugins.rb file
**@param** [Pathname] the path plugin is installed at

**@raise** [MalformattedPlugin] if plugins.rb file is not found


