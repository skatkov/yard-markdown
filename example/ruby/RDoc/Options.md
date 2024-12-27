# Class: RDoc::Options
**Inherits:** Object
    

RDoc::Options handles the parsing and storage of options

## Saved Options

You can save some options like the markup format in the `.rdoc_options` file
in your gem.  The easiest way to do this is:

    rdoc --markup tomdoc --write-options

Which will automatically create the file and fill it with the options you
specified.

The following options will not be saved since they interfere with the user's
preferences or with the normal operation of RDoc:

*   `--coverage-report`
*   `--dry-run`
*   `--encoding`
*   `--force-update`
*   `--format`
*   `--pipe`
*   `--quiet`
*   `--template`
*   `--verbose`

## Custom Options

Generators can hook into RDoc::Options to add generator-specific command line
options.

When `--format` is encountered in ARGV, RDoc calls ::setup_options on the
generator class to add extra options to the option parser.  Options for custom
generators must occur after `--format`.  `rdoc --help` will list options for
all installed generators.

Example:

    class RDoc::Generator::Spellcheck
      RDoc::RDoc.add_generator self

      def self.setup_options rdoc_options
        op = rdoc_options.option_parser

        op.on('--spell-dictionary DICTIONARY',
              RDoc::Options::Path) do |dictionary|
          rdoc_options.spell_dictionary = dictionary
        end
      end
    end

Of course, RDoc::Options does not respond to `spell_dictionary` by default so
you will need to add it:

    class RDoc::Options

      ##
      # The spell dictionary used by the spell-checking plugin.

      attr_accessor :spell_dictionary

    end

## Option Validators

OptionParser validators will validate and cast user input values.  In addition
to the validators that ship with OptionParser (String, Integer, Float,
TrueClass, FalseClass, Array, Regexp, Date, Time, URI, etc.), RDoc::Options
adds Path, PathArray and Template.


# Class Methods
## load_options() [](#method-c-load_options)
Loads options from .rdoc_options if the file exists, otherwise creates a new
RDoc::Options instance.
**@raise** [RDoc::Error] 

# Attributes
## apply_default_exclude[RW] [](#attribute-i-apply_default_exclude)
Exclude the default patterns as well if true.

## charset[RW] [](#attribute-i-charset)
Character-set for HTML output.  #encoding is preferred over #charset

## coverage_report[RW] [](#attribute-i-coverage_report)
If true, only report on undocumented files

## dry_run[RW] [](#attribute-i-dry_run)
If true, RDoc will not write any files.

## embed_mixins[RW] [](#attribute-i-embed_mixins)
Embed mixin methods, attributes, and constants into class documentation. Set
via `--[no-]embed-mixins` (Default is `false`.)

## encoding[RW] [](#attribute-i-encoding)
The output encoding.  All input files will be transcoded to this encoding.

The default encoding is UTF-8.  This is set via --encoding.

## exclude[RW] [](#attribute-i-exclude)
Create a regexp for #exclude

## files[RW] [](#attribute-i-files)
The list of files to be processed

## force_output[RW] [](#attribute-i-force_output)
Create the output even if the output directory does not look like an rdoc
output directory

## force_update[RW] [](#attribute-i-force_update)
Scan newer sources than the flag file if true.

## formatter[RW] [](#attribute-i-formatter)
Formatter to mark up text with

## generator[RW] [](#attribute-i-generator)
Description of the output generator (set with the `--format` option)

## generator_name[RW] [](#attribute-i-generator_name)
For #==

## generator_options[RW] [](#attribute-i-generator_options)
Loaded generator options.  Used to prevent --help from loading the same
options multiple times.

## hyperlink_all[RW] [](#attribute-i-hyperlink_all)
Old rdoc behavior: hyperlink all words that match a method name, even if not
preceded by '#' or '::'

## line_numbers[RW] [](#attribute-i-line_numbers)
Include line numbers in the source code

## locale[RW] [](#attribute-i-locale)
The output locale.

## locale_dir[RW] [](#attribute-i-locale_dir)
The directory where locale data live.

## main_page[RW] [](#attribute-i-main_page)
Name of the file, class or module to display in the initial index page (if not
specified the first file we encounter is used)

## markup[RW] [](#attribute-i-markup)
The markup format. One of: `rdoc` (the default), `markdown`, `rd`, `tomdoc`.
See [Markup Formats](rdoc-ref:RDoc::Markup@Markup+Formats).

## op_dir[RW] [](#attribute-i-op_dir)
The name of the output directory

## option_parser[RW] [](#attribute-i-option_parser)
The OptionParser for this instance

## output_decoration[RW] [](#attribute-i-output_decoration)
Output heading decorations?

## page_dir[RW] [](#attribute-i-page_dir)
Directory where guides, FAQ, and other pages not associated with a class live.
 You may leave this unset if these are at the root of your project.

## pipe[RW] [](#attribute-i-pipe)
Is RDoc in pipe mode?

## rdoc_include[RW] [](#attribute-i-rdoc_include)
Array of directories to search for files to satisfy an :include:

## root[RW] [](#attribute-i-root)
Root of the source documentation will be generated for.  Set this when
building documentation outside the source directory.  Defaults to the current
directory.

## show_hash[RW] [](#attribute-i-show_hash)
Include the '#' at the front of hyperlinked instance method names

## skip_tests[RW] [](#attribute-i-skip_tests)
Indicates if files of test suites should be skipped

## static_path[RW] [](#attribute-i-static_path)
Directory to copy static files from

## tab_width[RW] [](#attribute-i-tab_width)
The number of columns in a tab

## template[RW] [](#attribute-i-template)
Template to be used when generating output

## template_dir[RW] [](#attribute-i-template_dir)
Directory the template lives in

## template_stylesheets[RW] [](#attribute-i-template_stylesheets)
Additional template stylesheets

## title[RW] [](#attribute-i-title)
Documentation title

## update_output_dir[RW] [](#attribute-i-update_output_dir)
Should RDoc update the timestamps in the output dir?

## verbosity[RW] [](#attribute-i-verbosity)
Verbosity, zero means quiet

## visibility[RW] [](#attribute-i-visibility)
Minimum visibility of a documented method. One of `:public`, `:protected`,
`:private` or `:nodoc`.

The `:nodoc` visibility ignores all directives related to visibility.  The
other visibilities may be overridden on a per-method basis with the :doc:
directive.

## warn_missing_rdoc_ref[RW] [](#attribute-i-warn_missing_rdoc_ref)
Warn if rdoc-ref links can't be resolved Default is `false`

## webcvs[RW] [](#attribute-i-webcvs)
URL of web cvs frontend


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## check_files() [](#method-i-check_files)
Check that the files on the command line exist

## check_generator() [](#method-i-check_generator)
Ensure only one generator is loaded

## default_title=(string) [](#method-i-default_title=)
Set the title, but only if not already set. Used to set the title from a
source file, so that a title set from the command line will have the priority.

## finish() [](#method-i-finish)
Completes any unfinished option setup business such as filtering for existent
files, creating a regexp for #exclude and setting a default #template.

## finish_page_dir() [](#method-i-finish_page_dir)
Fixes the page_dir to be relative to the root_dir and adds the page_dir to the
files list.

## generator_descriptions() [](#method-i-generator_descriptions)
Returns a properly-space list of generators and their descriptions.

## init_ivars() [](#method-i-init_ivars)
:nodoc:

## init_with(map) [](#method-i-init_with)
:nodoc:

## initialize(loaded_optionsnil) [](#method-i-initialize)
:nodoc:

**@return** [Options] a new instance of Options

## override(map) [](#method-i-override)
:nodoc:

## parse(argv) [](#method-i-parse)
Parses command line options.

## quiet() [](#method-i-quiet)
Don't display progress as we process the files

## quiet=(bool) [](#method-i-quiet=)
Set quietness to `bool`

## sanitize_path(path) [](#method-i-sanitize_path)
Removes directories from `path` that are outside the current directory

## setup_generator(generator_name@generator_name) [](#method-i-setup_generator)
Set up an output generator for the named `generator_name`.

If the found generator responds to :setup_options it will be called with the
options instance.  This allows generators to add custom options or set default
options.

## template_dir_for(template) [](#method-i-template_dir_for)
Finds the template dir for `template`

## to_yaml(*options) [](#method-i-to_yaml)
For dumping YAML

## warn(message) [](#method-i-warn)
Displays a warning using Kernel#warn if we're being verbose

## write_options() [](#method-i-write_options)
Writes the YAML file .rdoc_options to the current directory containing the
parsed options.

## yaml_initialize(tag, map) [](#method-i-yaml_initialize)
:nodoc:

