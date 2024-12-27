# Class: Gem::InstallerTestCase
**Inherits:** Gem::TestCase
    

A test case for Gem::Installer.



#Instance Methods
## setup_base_gem() [](#method-i-setup_base_gem)
Creates the following instance variables:

@spec
:   a spec named 'a', intended for regular installs


And returns a gem built for the @spec

## setup_base_installer(forcetrue) [](#method-i-setup_base_installer)
Creates the following instance variables:

@spec
:   a spec named 'a', intended for regular installs


@gem
:   the path to a built gem from @spec


And returns a Gem::Installer for the @spec that installs into @gemhome

## setup_base_spec() [](#method-i-setup_base_spec)
Sets up a generic specification for testing the rubygems installer

And returns it

## setup_base_user_installer() [](#method-i-setup_base_user_installer)
Creates the following instance variables:

@spec
:   a spec named 'a', intended for regular installs

@user_spec
:   a spec named 'b', intended for user installs


@gem
:   the path to a built gem from @spec

@user_gem
:   the path to a built gem from @user_spec


And returns a Gem::Installer for the @user_spec that installs into
Gem.user_dir

## symlink_supported?() [](#method-i-symlink_supported?)
This is needed for Windows environment without symlink support enabled (the
default for non admin) to be able to skip test for features using symlinks.

**@return** [Boolean] 

## util_inst_bindir() [](#method-i-util_inst_bindir)
The path where installed executables live

## util_installer(spec, gem_home, forcetrue) [](#method-i-util_installer)
Creates an installer for `spec` that will install into `gem_home`.

## util_make_exec(spec@spec, shebang"#!/usr/bin/ruby", bindir"bin") [](#method-i-util_make_exec)
Adds an executable named "executable" to `spec` with the given `shebang`.

The executable is also written to the bin dir in @tmpdir and the installed gem
directory for `spec`.

## util_setup_gem(ui@ui, forcetrue) [](#method-i-util_setup_gem)
Builds the @spec gem and returns an installer for it.  The built gem includes:

    bin/executable
    lib/code.rb
    ext/a/mkrf_conf.rb

## util_setup_installer(&block) [](#method-i-util_setup_installer)
Sets up the base @gem, builds it and returns an installer for it.

