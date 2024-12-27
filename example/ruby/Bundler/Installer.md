# Class: Bundler::Installer
**Inherits:** Object
    



# Class Methods
## install(root , definition , options {}) [](#method-c-install)
Begins the installation process for Bundler. For more information see the #run
method on this class.
# Attributes
## ambiguous_gems[RW] [](#attribute-c-ambiguous_gems)
Returns the value of attribute ambiguous_gems.

## definition[RW] [](#attribute-i-definition)
Returns the value of attribute definition.

## post_install_messages[RW] [](#attribute-i-post_install_messages)
Returns the value of attribute post_install_messages.


#Instance Methods
## generate_bundler_executable_stubs(spec, options{}) [](#method-i-generate_bundler_executable_stubs)

## generate_standalone_bundler_executable_stubs(spec, options{}) [](#method-i-generate_standalone_bundler_executable_stubs)

## initialize(root, definition) [](#method-i-initialize)

**@return** [Installer] a new instance of Installer

## run(options) [](#method-i-run)
Runs the install procedures for a specific Gemfile.

Firstly, this method will check to see if `Bundler.bundle_path` exists and if
not then Bundler will create the directory. This is usually the same location
as RubyGems which typically is the `~/.gem` directory unless other specified.

Secondly, it checks if Bundler has been configured to be "frozen". Frozen
ensures that the Gemfile and the Gemfile.lock file are matching. This stops a
situation where a developer may update the Gemfile but may not run `bundle
install`, which leads to the Gemfile.lock file not being correctly updated. If
this file is not correctly updated then any other developer running `bundle
install` will potentially not install the correct gems.

Thirdly, Bundler checks if there are any dependencies specified in the
Gemfile. If there are no dependencies specified then Bundler returns a warning
message stating so and this method returns.

Fourthly, Bundler checks if the Gemfile.lock exists, and if so then proceeds
to set up a definition based on the Gemfile and the Gemfile.lock. During this
step Bundler will also download information about any new gems that are not in
the Gemfile.lock and resolve any dependencies if needed.

Fifthly, Bundler resolves the dependencies either through a cache of gems or
by remote. This then leads into the gems being installed, along with stubs for
their executables, but only if the --binstubs option has been passed or
[Bundler.options](:bin) has been set earlier.

Sixthly, a new Gemfile.lock is created from the installed gems to ensure that
the next time that a user runs `bundle install` they will receive any updates
from this process.

Finally, if the user has specified the standalone flag, Bundler will generate
the needed require paths and save them in a `setup.rb` file. See `bundle
standalone --help` for more information.

