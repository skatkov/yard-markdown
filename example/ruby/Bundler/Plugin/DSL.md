# Class: Bundler::Plugin::DSL
**Inherits:** Bundler::Dsl
    

Dsl to parse the Gemfile looking for plugins to install


# Attributes
## inferred_plugins[RW] [](#attribute-i-inferred_plugins)
This lists the plugins that was added automatically and not specified by the
user.

When we encounter :type attribute with a source block, we add a plugin by name
bundler-source-<type> to list of plugins to be installed.

These plugins are optional and are not installed when there is conflict with
any other plugin.


#Instance Methods
## initialize() [](#method-i-initialize)

**@return** [DSL] a new instance of DSL

## method_missing(name, *args) [](#method-i-method_missing)

**@raise** [PluginGemfileError] 

## plugin(name, *args) [](#method-i-plugin)

## source(source, *args, &blk) [](#method-i-source)

