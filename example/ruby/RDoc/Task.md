# Class: RDoc::Task
**Inherits:** Rake::TaskLib
    

RDoc::Task creates the following rake tasks to generate and clean up RDoc
output:

rdoc
:   Main task for this RDoc task.


clobber_rdoc
:   Delete all the rdoc files.  This target is automatically added to the main
    clobber target.


rerdoc
:   Rebuild the rdoc files from scratch, even if they are not out of date.


rdoc:coverage
:   Print RDoc coverage report for all rdoc files.


Simple Example:

    require 'rdoc/task'

    RDoc::Task.new do |rdoc|
      rdoc.main = "README.rdoc"
      rdoc.rdoc_files.include("README.rdoc", "lib/**/*.rb")
    end

The `rdoc` object passed to the block is an RDoc::Task object. See the
attributes list for the RDoc::Task class for available customization options.

## Specifying different task names

You may wish to give the task a different name, such as if you are generating
two sets of documentation.  For instance, if you want to have a development
set of documentation including private methods:

    require 'rdoc/task'

    RDoc::Task.new :rdoc_dev do |rdoc|
      rdoc.main = "README.rdoc"
      rdoc.rdoc_files.include("README.rdoc", "lib/**/*.rb")
      rdoc.options << "--all"
    end

The tasks would then be named :*rdoc_dev*, :clobber_*rdoc_dev*, and
:re*rdoc_dev*.

If you wish to have completely different task names, then pass a Hash as first
argument. With the `:rdoc`, `:clobber_rdoc` and `:rerdoc` options, you can
customize the task names to your liking.

For example:

    require 'rdoc/task'

    RDoc::Task.new(:rdoc => "rdoc", :clobber_rdoc => "rdoc:clean",
                   :rerdoc => "rdoc:force")

This will create the tasks `:rdoc`, `:rdoc:clean`, `:rdoc:force`, and
`:rdoc:coverage`.


# Attributes
## external[RW] [](#attribute-i-external)
Whether to run the rdoc process as an external shell (default is false)

## generator[RW] [](#attribute-i-generator)
Name of format generator (`--format`) used by rdoc. (defaults to rdoc's
default)

## main[RW] [](#attribute-i-main)
Name of file to be used as the main, top level file of the RDoc. (default is
none)

## markup[RW] [](#attribute-i-markup)
The markup format; one of: `rdoc` (the default), `markdown`, `rd`, `tomdoc`.
See [Markup Formats](rdoc-ref:RDoc::Markup@Markup+Formats).

## name[RW] [](#attribute-i-name)
Name of the main, top level task.  (default is :rdoc)

## options[RW] [](#attribute-i-options)
Additional list of options to be passed rdoc.  (default is [])

## rdoc_dir[RW] [](#attribute-i-rdoc_dir)
Name of directory to receive the html output files. (default is "html")

## rdoc_files[RW] [](#attribute-i-rdoc_files)
List of files to be included in the rdoc generation. (default is [])

## template[RW] [](#attribute-i-template)
Name of template to be used by rdoc. (defaults to rdoc's default)

## title[RW] [](#attribute-i-title)
Title of RDoc documentation. (defaults to rdoc's default)


#Instance Methods
## before_running_rdoc(&block) [](#method-i-before_running_rdoc)
The block passed to this method will be called just before running the RDoc
generator. It is allowed to modify RDoc::Task attributes inside the block.

## check_names(names) [](#method-i-check_names)
Ensures that `names` only includes names for the :rdoc, :clobber_rdoc and
:rerdoc.  If other names are given an ArgumentError is raised.

## clobber_task_description() [](#method-i-clobber_task_description)
Task description for the clobber rdoc task or its renamed equivalent

## coverage_task_description() [](#method-i-coverage_task_description)
Task description for the coverage task or its renamed description

## defaults() [](#method-i-defaults)
Sets default task values

## define() [](#method-i-define)
Create the tasks defined by this task lib.

## initialize(name:rdoc) [](#method-i-initialize)
Create an RDoc task with the given name. See the RDoc::Task class overview for
documentation.

**@return** [Task] a new instance of Task

**@yield** [_self] 

**@yieldparam** [RDoc::Task] the object that the method was called on

## inline_source() [](#method-i-inline_source)
All source is inline now.  This method is deprecated

## inline_source=(value) [](#method-i-inline_source=)
All source is inline now.  This method is deprecated

## option_list() [](#method-i-option_list)
List of options that will be supplied to RDoc

## rdoc_task_description() [](#method-i-rdoc_task_description)
Task description for the rdoc task or its renamed equivalent

## rerdoc_task_description() [](#method-i-rerdoc_task_description)
Task description for the rerdoc task or its renamed description

