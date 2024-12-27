# Class: Bundler::Plugin::Index
**Inherits:** Object
    



# Attributes
## commands[RW] [](#attribute-i-commands)
Returns the value of attribute commands.


#Instance Methods
## command_plugin(command) [](#method-i-command_plugin)
Fetch the name of plugin handling the command

## global_index_file() [](#method-i-global_index_file)
Path where the global index file is stored

## hook_plugins(event) [](#method-i-hook_plugins)
Returns the list of plugin names handling the passed event

## index_file() [](#method-i-index_file)
Path of default index file

## initialize() [](#method-i-initialize)

**@return** [Index] a new instance of Index

## installed?(name) [](#method-i-installed?)

**@return** [Boolean] 

## installed_in_plugin_root?(name) [](#method-i-installed_in_plugin_root?)
This plugin is installed inside the .bundle/plugin directory, and thus is
managed solely by Bundler

**@return** [Boolean] 

## installed_plugins() [](#method-i-installed_plugins)

## load_paths(name) [](#method-i-load_paths)

## local_index_file() [](#method-i-local_index_file)
Path where the local index file is stored

## plugin_commands(plugin) [](#method-i-plugin_commands)

## plugin_path(name) [](#method-i-plugin_path)

## register_plugin(name, path, load_paths, commands, sources, hooks) [](#method-i-register_plugin)
This function is to be called when a new plugin is installed. This function
shall add the functions of the plugin to existing maps and also the name to
source location.

**@param** [String] of the plugin to be registered

**@param** [String] where the plugin is installed

**@param** [Array<String>] for the plugin

**@param** [Array<String>] that are handled by the plugin

**@param** [Array<String>] that are handled by the plugin

## source?(source) [](#method-i-source?)

**@return** [Boolean] 

## source_plugin(name) [](#method-i-source_plugin)

## unregister_plugin(name) [](#method-i-unregister_plugin)

