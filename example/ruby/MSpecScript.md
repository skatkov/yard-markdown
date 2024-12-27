# Class: MSpecScript
**Inherits:** Object
    

MSpecScript provides a skeleton for all the MSpec runner scripts.


# Class Methods
## child_process?() [](#method-c-child_process?)
True if the current process is the one going to run the specs with
`MSpec.process`. False for e.g. `mspec` which exec's to `mspec-run`. This is
useful in .mspec config files.
**@return** [Boolean] 

## config() [](#method-c-config)
Returns the config object. Maintained at the class level to easily enable
simple config files. See the class method `set`.
## get(key ) [](#method-c-get)
Gets the value of `key` from the config object. Simplifies getting values in a
config file:

    class MSpecScript
      set :a, 1
      set :b, 2
      set :c, get(:a) + get(:b)
    end
## main(child_process true) [](#method-c-main)
Instantiates an instance and calls the series of methods to invoke the script.
## set(key , value ) [](#method-c-set)
Associates `value` with `key` in the config object. Enables simple config
files of the form:

    class MSpecScript
      set :target, "ruby"
      set :files, ["one_spec.rb", "two_spec.rb"]
    end
# Attributes
## child_process[RW] [](#attribute-c-child_process)
Returns the value of attribute child_process.


#Instance Methods
## config() [](#method-i-config)
Returns the config object maintained by the instance's class. See the class
methods `set` and `config`.

## config_formatter() [](#method-i-config_formatter)
Makes a formatter specified by :formatter option.

## cores(max) [](#method-i-cores)

## custom_options(options) [](#method-i-custom_options)
Callback for enabling custom options. This version is a no-op. Provide an
implementation specific version in a config file. Called by #options after the
MSpec-provided options are added.

## custom_register() [](#method-i-custom_register)
Callback for enabling custom actions, etc. This version is a no-op. Provide an
implementation specific version in a config file. Called by #register.

## entries(partial) [](#method-i-entries)
Attempts to resolve `partial` as a file or directory name in the following
order:

    1. +partial+
    2. +partial+ + "_spec.rb"
    3. <tt>File.join(config[:prefix], partial)</tt>
    4. <tt>File.join(config[:prefix], partial + "_spec.rb")</tt>

If it is a file name, returns the name as an entry in an array. If it is a
directory, returns all *_spec.rb files in the directory and subdirectories.

If unable to resolve `partial`, `Kernel.abort` is called.

## files(patterns) [](#method-i-files)
Resolves each entry in `patterns` to a set of files.

If the pattern has a leading '^' character, the list of files is subtracted
from the list of files accumulated to that point.

If the entry has a leading ':' character, the corresponding key is looked up
in the config object and the entries in the value retrieved are processed
through #entries.

## files_from_patterns(patterns) [](#method-i-files_from_patterns)

## initialize() [](#method-i-initialize)

**@return** [MSpecScript] a new instance of MSpecScript

## load(target) [](#method-i-load)

## load_default() [](#method-i-load_default)
Attempts to load a default config file. First tries to load 'default.mspec'.
If that fails, attempts to load a config file name constructed from the value
of RUBY_ENGINE and the first two numbers in RUBY_VERSION. For example, on MRI
1.8.6, the file name would be 'ruby.1.8.mspec'.

## register() [](#method-i-register)
Registers all filters and actions.

## setup_env() [](#method-i-setup_env)

## signals() [](#method-i-signals)
Sets up signal handlers. Only a handler for SIGINT is registered currently.

## try_load(target) [](#method-i-try_load)
Returns `true` if the file was located in `config[:path]`, possibly appending
+[config](:config_ext). Returns `false` otherwise.

