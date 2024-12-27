# Class: Bundler::Plugin::Installer
**Inherits:** Object
    




#Instance Methods
## install(names, options) [](#method-i-install)

## install_definition(definition) [](#method-i-install_definition)
Installs the plugin from Definition object created by limited parsing of
Gemfile searching for plugins to be installed

**@param** [Definition] object

**@return** [Hash] map of names to their specs they are installed with

