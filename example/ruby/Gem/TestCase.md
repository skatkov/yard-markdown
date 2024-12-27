# Class: Gem::TestCase
**Inherits:** Test::Unit::TestCase
    
**Includes:** Gem::DefaultUserInteraction
  

RubyGemTestCase provides a variety of methods for testing rubygems and
gem-related behavior in a sandbox.  Through RubyGemTestCase you can install
and uninstall gems, fetch remote gems through a stub fetcher and be assured
your normal set of gems is not affected.


# Class Methods
## cert_path(cert_name ) [](#method-c-cert_path)
Returns the path to the certificate named `cert_name` from `test/rubygems/`.
## escape_path(*path ) [](#method-c-escape_path)
:nodoc:

Return the join path, with escaping backticks, dollars, and double-quotes. 
Unlike `shellescape`, equal-sign is not escaped.
## key_path(key_name ) [](#method-c-key_path)
Returns the path to the key named `key_name` from `test/rubygems`
## load_cert(cert_name ) [](#method-c-load_cert)
Loads certificate named `cert_name` from `test/rubygems/`.
## load_key(key_name , passphrase nil) [](#method-c-load_key)
Loads a private key named `key_name` with `passphrase` in `test/rubygems/`
## rubybin() [](#method-c-rubybin)
Finds the path to the Ruby executable
## vc_windows?() [](#method-c-vc_windows?)
Returns whether or not we're on a version of Ruby built with VC++ (or Borland)
versus Cygwin, Mingw, etc.
**@return** [Boolean] 

# Attributes
## fetcher[RW] [](#attribute-i-fetcher)
:nodoc:

## gem_repo[RW] [](#attribute-i-gem_repo)
:nodoc:

## uri[RW] [](#attribute-i-uri)
:nodoc:


#Instance Methods
## add_to_fetcher(spec, pathnil, repo@gem_repo) [](#method-i-add_to_fetcher)
Add `spec` to +@fetcher+ serving the data in the file `path`. `repo` indicates
which repo to make `spec` appear to be in.

## all_spec_names() [](#method-i-all_spec_names)

## assert_activate(expected, *specs) [](#method-i-assert_activate)

## assert_contains_make_command(target, output, msgnil) [](#method-i-assert_contains_make_command)

## assert_directory_exists(path, msgnil) [](#method-i-assert_directory_exists)

## bindir(value) [](#method-i-bindir)
Sets the bindir entry in RbConfig::CONFIG to `value` and restores the original
value when the block ends

## build_rake_in(goodtrue) [](#method-i-build_rake_in)
Allows the proper version of `rake` to be used for the test.

## bundler_path() [](#method-i-bundler_path)

## capture_subprocess_io() [](#method-i-capture_subprocess_io)
Originally copied from minitest/assertions.rb

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## common_installer_setup() [](#method-i-common_installer_setup)

## common_installer_teardown() [](#method-i-common_installer_teardown)

## credential_setup() [](#method-i-credential_setup)

## credential_teardown() [](#method-i-credential_teardown)

## dep(name, *requirements) [](#method-i-dep)
Construct a new Gem::Dependency.

## dependency_request(dep, from_name, from_version, parentnil) [](#method-i-dependency_request)
Constructs a Gem::Resolver::DependencyRequest from a Gem::Dependency `dep`, a
`from_name` and `from_version` requesting the dependency and a `parent`
DependencyRequest

## enable_shared(value) [](#method-i-enable_shared)
Sets the ENABLE_SHARED entry in RbConfig::CONFIG to `value` and restores the
original value when the block ends

## exeext(value) [](#method-i-exeext)
Sets the EXEEXT entry in RbConfig::CONFIG to `value` and restores the original
value when the block ends

## extension_in_lib(valuetrue) [](#method-i-extension_in_lib)
Overrides the Gem.install_extension_in_lib function and restores the original
when the block ends

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## git_gem(name"a", version1) [](#method-i-git_gem)
A git_gem is used with a gem dependencies file.  The gem created here has no
files, just a gem specification for the given `name` and `version`.

Yields the `specification` to the block, if given

## have_git?() [](#method-i-have_git?)
Skips this test unless you have a git executable

**@return** [Boolean] 

## in_path?(executable) [](#method-i-in_path?)
:nodoc:

**@return** [Boolean] 

## install_default_gems(*specs) [](#method-i-install_default_gems)
Installs the provided default specs including writing the spec file

## install_gem(spec, options{}) [](#method-i-install_gem)
Builds and installs the Gem::Specification `spec`

## install_gem_user(spec) [](#method-i-install_gem_user)
Builds and installs the Gem::Specification `spec` into the user dir

## install_specs(*specs) [](#method-i-install_specs)
Install the provided specs

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## load_yaml(yaml) [](#method-i-load_yaml)
Load a YAML string, the psych 3 way

## load_yaml_file(file) [](#method-i-load_yaml_file)
Load a YAML file, the psych 3 way

## loaded_spec_names() [](#method-i-loaded_spec_names)

## make_command() [](#method-i-make_command)
Returns the make command for the current platform. For versions of Ruby built
on MS Windows with VC++ or Borland it will return 'nmake'. On all other
platforms, including Cygwin, it will return 'make'.

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## mingw_windows?() [](#method-i-mingw_windows?)
Is this test being run on a version of Ruby built with mingw?

**@return** [Boolean] 

## mu_pp(obj) [](#method-i-mu_pp)
Enables pretty-print for all tests

## new_default_spec(name, version, depsnil, *files, executable:false) [](#method-i-new_default_spec)

## nmake_found?() [](#method-i-nmake_found?)
Returns whether or not the nmake command could be found.

**@return** [Boolean] 

## parse_make_command_line_targets(line) [](#method-i-parse_make_command_line_targets)

## quick_gem(name, version"2") [](#method-i-quick_gem)
Creates a Gem::Specification with a minimum of extra work.  `name` and
`version` are the gem's name and version,  platform, author, email, homepage,
summary and description are defaulted.  The specification is yielded for
customization.

The gem is added to the installed gems in +@gemhome+ and the runtime.

Use this with #write_file to build an installed gem.

## read_binary(path) [](#method-i-read_binary)
Reads a binary file at `path`

## read_cache(path) [](#method-i-read_cache)
Reads a Marshal file at `path`

## refute_directory_exists(path, msgnil) [](#method-i-refute_directory_exists)

## req(*requirements) [](#method-i-req)
Constructs a new Gem::Requirement.

## ruby_repo?() [](#method-i-ruby_repo?)
Is this test being run on a ruby/ruby repository?

**@return** [Boolean] 

## ruby_with_rubygems_in_load_path() [](#method-i-ruby_with_rubygems_in_load_path)

## rubygems_path() [](#method-i-rubygems_path)

## save_gemspec(name"a", version1, directory".") [](#method-i-save_gemspec)
create_gemspec creates gem specification in given `directory` or '.' for the
given `name` and `version`.

Yields the `specification` to the block, if given

## scan_make_command_lines(output) [](#method-i-scan_make_command_lines)

## setup() [](#method-i-setup)
#setup prepares a sandboxed location to install gems.  All installs are
directed to a temporary directory.  All install plugins are removed.

If the `RUBY` environment variable is set the given path is used for
Gem::ruby.  The local platform is set to `i386-mswin32` for Windows or
`i686-darwin8.10.1` otherwise.

## silence_warnings() [](#method-i-silence_warnings)

## spec(name, version, &block) [](#method-i-spec)
Constructs a new Gem::Specification.

## spec_fetcher(repository@gem_repo) [](#method-i-spec_fetcher)
Creates a SpecFetcher pre-filled with the gems or specs defined in the block.

Yields a `fetcher` object that responds to `spec` and `gem`.  `spec` adds a
specification to the SpecFetcher while `gem` adds both a specification and the
gem data to the RemoteFetcher so the built gem can be downloaded.

If only the a-3 gem is supposed to be downloaded you can save setup time by
creating only specs for the other versions:

    spec_fetcher do |fetcher|
      fetcher.spec 'a', 1
      fetcher.spec 'a', 2, 'b' => 3 # dependency on b = 3
      fetcher.gem 'a', 3 do |spec|
        # spec is a Gem::Specification
        # ...
      end
    end

## teardown() [](#method-i-teardown)
#teardown restores the process to its original state and removes the tempdir

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## uninstall_gem(spec) [](#method-i-uninstall_gem)
Uninstalls the Gem::Specification `spec`

## unresolved_names() [](#method-i-unresolved_names)

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## util_build_gem(spec) [](#method-i-util_build_gem)
Builds a gem from `spec` and places it in `File.join @gemhome, 'cache'`. 
Automatically creates files based on `spec.files`

## util_clear_RUBY_VERSION() [](#method-i-util_clear_RUBY_VERSION)

## util_clear_gems() [](#method-i-util_clear_gems)
Removes all installed gems from +@gemhome+.

## util_gem(name, version, depsnil, &block) [](#method-i-util_gem)
Creates a gem with `name`, `version` and `deps`.  The specification will be
yielded before gem creation for customization.  The gem will be placed in
`File.join @tempdir, 'gems'`.  The specification and .gem file location are
returned.

## util_gzip(data) [](#method-i-util_gzip)
Gzips `data`.

## util_make_gems(prereleasefalse) [](#method-i-util_make_gems)
Creates several default gems which all have a lib/code.rb file.  The gems are
not installed but are available in the cache dir.

+@a1+
:   gem a version 1, this is the best-described gem.

+@a2+
:   gem a version 2

+@a3a
:   gem a version 3.a

+@a_evil9+
:   gem a_evil version 9, use this to ensure similarly-named gems don't
    collide with a.

+@b2+
:   gem b version 2

+@c1_2+
:   gem c version 1.2

+@pl1+
:   gem pl version 1, this gem has a legacy platform of i386-linux.


Additional `prerelease` gems may also be created:

+@a2_pre+
:   gem a version 2.a

TODO: nuke this and fix tests. this should speed up a lot

## util_remove_gem(spec) [](#method-i-util_remove_gem)

## util_restore_RUBY_VERSION() [](#method-i-util_restore_RUBY_VERSION)

## util_set_RUBY_VERSION(version, patchlevel, revision, description, engine"ruby", engine_versionnil) [](#method-i-util_set_RUBY_VERSION)

## util_set_arch(arch) [](#method-i-util_set_arch)
Set the platform to `arch`

## util_setup_spec_fetcher(*specs) [](#method-i-util_setup_spec_fetcher)
Sets up Gem::SpecFetcher to return information from the gems in `specs`.

## util_spec(name, version2, depsnil, *files) [](#method-i-util_spec)
Creates a spec with `name`, `version`.  `deps` can specify the dependency or a
`block` can be given for full customization of the specification.

## util_zip(data) [](#method-i-util_zip)
Deflates `data`

## v(string) [](#method-i-v)
Construct a new Gem::Version.

## vc_windows?() [](#method-i-vc_windows?)
see ::vc_windows?

**@return** [Boolean] 

## vendor_gem(name"a", version1, &block) [](#method-i-vendor_gem)
A vendor_gem is used with a gem dependencies file.  The gem created here has
no files, just a gem specification for the given `name` and `version`.

Yields the `specification` to the block, if given

## vendordir(value) [](#method-i-vendordir)
Sets the vendordir entry in RbConfig::CONFIG to `value` and restores the
original value when the block ends

## wait_for_child_process_to_exit() [](#method-i-wait_for_child_process_to_exit)
In case we're building docs in a background process, this method waits for
that process to exit (or if it's already been reaped, or never happened,
swallows the Errno::ECHILD error).

## with_clean_path_to_ruby() [](#method-i-with_clean_path_to_ruby)

## with_env(overrides, &block) [](#method-i-with_env)

## with_internal_encoding(encoding) [](#method-i-with_internal_encoding)

## without_any_upwards_gemfiles() [](#method-i-without_any_upwards_gemfiles)

## write_file(path) [](#method-i-write_file)
Writes a binary file to `path` which is relative to +@gemhome+

## write_marshalled_gemspecs(*all_specs) [](#method-i-write_marshalled_gemspecs)

