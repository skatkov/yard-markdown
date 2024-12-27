# Class: Bundler::CLI
**Inherits:** Bundler::Thor
    
**Includes:** Bundler::Thor::Actions
  



# Class Methods
## aliases_for(command_name ) [](#method-c-aliases_for)
## all_aliases() [](#method-c-all_aliases)
## check_deprecated_ext_option(arguments ) [](#method-c-check_deprecated_ext_option)
## deprecated_ext_value?(arguments ) [](#method-c-deprecated_ext_value?)
**@return** [Boolean] 

## dispatch() [](#method-c-dispatch)
## handle_no_command_error(command , has_namespace $thor_runner) [](#method-c-handle_no_command_error)
## reformatted_help_args(args ) [](#method-c-reformatted_help_args)
Reformat the arguments passed to bundle that include a --help flag into the
corresponding `bundle help #{command}` call
## source_root() [](#method-c-source_root)
## start() [](#method-c-start)

#Instance Methods
## action(instance) [](#method-i-action)
Wraps an action object and call it accordingly to the thor class behavior.

## add(*gems) [](#method-i-add)

## append_to_file(path, *args, &block) [](#method-i-append_to_file)
Append text to a file. Since it depends on insert_into_file, it's reversible.

#### Parameters
path<String>
:   path of the file to be changed

data<String>
:   the data to append to the file, can be also given as a block.

config<Hash>
:   give :verbose => false to not log the status.


#### Example

    append_to_file 'config/environments/test.rb', 'config.gem "rspec"'

    append_to_file 'config/environments/test.rb' do
      'config.gem "rspec"'
    end

## apply(path, config{}) [](#method-i-apply)
Loads an external file and execute it in the instance binding.

#### Parameters
path<String>
:   The path to the file to execute. Can be a web address or a relative path
    from the source root.


#### Examples

    apply "http://gist.github.com/103208"

    apply "recipes/jquery.rb"

## binstubs(*gems) [](#method-i-binstubs)

## cache() [](#method-i-cache)

## check() [](#method-i-check)

## chmod(path, mode, config{}) [](#method-i-chmod)
Changes the mode of the given file or directory.

#### Parameters
mode<Integer>
:   the file mode

path<String>
:   the name of the file to change mode

config<Hash>
:   give :verbose => false to not log the status.


#### Example

    chmod "script/server", 0755

## clean() [](#method-i-clean)

## cli_help() [](#method-i-cli_help)

## comment_lines(path, flag, *args) [](#method-i-comment_lines)
Comment all lines matching a given regex.  It will leave the space which
existed before the beginning of the line in tact and will insert a single
space after the comment hash.

#### Parameters
path<String>
:   path of the file to be changed

flag<Regexp|String>
:   the regexp or string used to decide which lines to comment

config<Hash>
:   give :verbose => false to not log the status.


#### Example

    comment_lines 'config/initializers/session_store.rb', /cookie_store/

## console(groupnil) [](#method-i-console)

## copy_file(source, *args, &block) [](#method-i-copy_file)
Copies the file from the relative source to the relative destination. If the
destination is not given it's assumed to be equal to the source.

#### Parameters
source<String>
:   the relative path to the source root.

destination<String>
:   the relative path to the destination root.

config<Hash>
:   give :verbose => false to not log the status, and :mode => :preserve, to
    preserve the file mode from the source.


#### Examples

    copy_file "README", "doc/README"

    copy_file "doc/README"

## create_file(destination, *args, &block) [](#method-i-create_file)
Create a new file relative to the destination root with the given data, which
is the return value of a block or a data string.

#### Parameters
destination<String>
:   the relative path to the destination root.

data<String|NilClass>
:   the data to append to the file.

config<Hash>
:   give :verbose => false to not log the status.


#### Examples

    create_file "lib/fun_party.rb" do
      hostname = ask("What is the virtual hostname I should use?")
      "vhost.name = #{hostname}"
    end

    create_file "config/apache.conf", "your apache config"

## create_link(destination, *args) [](#method-i-create_link)
Create a new file relative to the destination root from the given source.

#### Parameters
destination<String>
:   the relative path to the destination root.

source<String|NilClass>
:   the relative path to the source root.

config<Hash>
:   give :verbose => false to not log the status.

:   give :symbolic => false for hard link.


#### Examples

    create_link "config/apache.conf", "/etc/apache.conf"

## destination_root() [](#method-i-destination_root)
Returns the root for this thor class (also aliased as destination root).

## destination_root=(root) [](#method-i-destination_root=)
Sets the root for this thor class. Relatives path are added to the directory
where the script was invoked and expanded.

## directory(source, *args, &block) [](#method-i-directory)
Copies recursively the files from source directory to root directory. If any
of the files finishes with .tt, it's considered to be a template and is placed
in the destination without the extension .tt. If any empty directory is found,
it's copied and all .empty_directory files are ignored. If any file name is
wrapped within % signs, the text within the % signs will be executed as a
method and replaced with the returned value. Let's suppose a doc directory
with the following files:

    doc/
      components/.empty_directory
      README
      rdoc.rb.tt
      %app_name%.rb

When invoked as:

    directory "doc"

It will create a doc directory in the destination with the following files
(assuming that the `app_name` method returns the value "blog"):

    doc/
      components/
      README
      rdoc.rb
      blog.rb

**Encoded path note:** Since Bundler::Thor internals use Object#respond_to? to
check if it can expand %something%, this `something` should be a public method
in the class calling #directory. If a method is private, Bundler::Thor stack
raises PrivateMethodEncodedError.

#### Parameters
source<String>
:   the relative path to the source root.

destination<String>
:   the relative path to the destination root.

config<Hash>
:   give :verbose => false to not log the status. If :recursive => false, does
    not look for paths recursively. If :mode => :preserve, preserve the file
    mode from the source. If :exclude_pattern => /regexp/, prevents copying
    files that match that regexp.


#### Examples

    directory "doc"
    directory "doc", "docs", :recursive => false

## doctor() [](#method-i-doctor)

## empty_directory(destination, config{}) [](#method-i-empty_directory)
Creates an empty directory.

#### Parameters
destination<String>
:   the relative path to the destination root.

config<Hash>
:   give :verbose => false to not log the status.


#### Examples

    empty_directory "doc"

## env() [](#method-i-env)

## exec(*args) [](#method-i-exec)

## find_in_source_paths(file) [](#method-i-find_in_source_paths)
Receives a file or directory and search for it in the source paths.

**@raise** [Error] 

## fund() [](#method-i-fund)

## gem(name) [](#method-i-gem)

## get(source, *args, &block) [](#method-i-get)
Gets the content at the given address and places it at the given relative
destination. If a block is given instead of destination, the content of the
url is yielded and used as location.

`get` relies on open-uri, so passing application user input would provide a
command injection attack vector.

#### Parameters
source<String>
:   the address of the given content.

destination<String>
:   the relative path to the destination root.

config<Hash>
:   give :verbose => false to not log the status, and :http_headers => <Hash>
    to add headers to an http request.


#### Examples

    get "http://gist.github.com/103208", "doc/README"

    get "http://gist.github.com/103208", "doc/README", :http_headers => {"Content-Type" => "application/json"}

    get "http://gist.github.com/103208" do |content|
      content.split("\n").first
    end

## gsub_file(path, flag, *args, &block) [](#method-i-gsub_file)
Run a regular expression replacement on a file.

#### Parameters
path<String>
:   path of the file to be changed

flag<Regexp|String>
:   the regexp or string to be replaced

replacement<String>
:   the replacement, can be also given as a block

config<Hash>
:   give :verbose => false to not log the status, and :force => true, to force
    the replacement regardless of runner behavior.


#### Example

    gsub_file 'app/controllers/application_controller.rb', /#\s*(filter_parameter_logging :password)/, '\1'

    gsub_file 'README', /rake/, :green do |match|
      match << " no more. Use thor!"
    end

## help(clinil) [](#method-i-help)

## in_root() [](#method-i-in_root)
Goes to the root and execute the given block.

## info(gem_name) [](#method-i-info)

## init() [](#method-i-init)

## initialize(*args) [](#method-i-initialize)

**@return** [CLI] a new instance of CLI

## inject(name, version) [](#method-i-inject)

## inject_into_class(path, klass, *args, &block) [](#method-i-inject_into_class)
Injects text right after the class definition. Since it depends on
insert_into_file, it's reversible.

#### Parameters
path<String>
:   path of the file to be changed

klass<String|Class>
:   the class to be manipulated

data<String>
:   the data to append to the class, can be also given as a block.

config<Hash>
:   give :verbose => false to not log the status.


#### Examples

    inject_into_class "app/controllers/application_controller.rb", "ApplicationController", "  filter_parameter :password\n"

    inject_into_class "app/controllers/application_controller.rb", "ApplicationController" do
      "  filter_parameter :password\n"
    end

## inject_into_module(path, module_name, *args, &block) [](#method-i-inject_into_module)
Injects text right after the module definition. Since it depends on
insert_into_file, it's reversible.

#### Parameters
path<String>
:   path of the file to be changed

module_name<String|Class>
:   the module to be manipulated

data<String>
:   the data to append to the class, can be also given as a block.

config<Hash>
:   give :verbose => false to not log the status.


#### Examples

    inject_into_module "app/helpers/application_helper.rb", "ApplicationHelper", "  def help; 'help'; end\n"

    inject_into_module "app/helpers/application_helper.rb", "ApplicationHelper" do
      "  def help; 'help'; end\n"
    end

## insert_into_file(destination, *args, &block) [](#method-i-insert_into_file)

## inside(dir"", config{}, &block) [](#method-i-inside)
Do something in the root or on a provided subfolder. If a relative path is
given it's referenced from the current root. The full path is yielded to the
block you provide. The path is set back to the previous path when the method
exits.

Returns the value yielded by the block.

#### Parameters
dir<String>
:   the directory to move to.

config<Hash>
:   give :verbose => true to log and use padding.


## install() [](#method-i-install)

## issue() [](#method-i-issue)

## licenses() [](#method-i-licenses)

## link_file(source, *args) [](#method-i-link_file)
Links the file from the relative source to the relative destination. If the
destination is not given it's assumed to be equal to the source.

#### Parameters
source<String>
:   the relative path to the source root.

destination<String>
:   the relative path to the destination root.

config<Hash>
:   give :verbose => false to not log the status.


#### Examples

    link_file "README", "doc/README"

    link_file "doc/README"

## list() [](#method-i-list)

## lock() [](#method-i-lock)

## open(name) [](#method-i-open)

## outdated(*gems) [](#method-i-outdated)

## platform() [](#method-i-platform)

## prepend_to_file(path, *args, &block) [](#method-i-prepend_to_file)
Prepend text to a file. Since it depends on insert_into_file, it's reversible.

#### Parameters
path<String>
:   path of the file to be changed

data<String>
:   the data to prepend to the file, can be also given as a block.

config<Hash>
:   give :verbose => false to not log the status.


#### Example

    prepend_to_file 'config/environments/test.rb', 'config.gem "rspec"'

    prepend_to_file 'config/environments/test.rb' do
      'config.gem "rspec"'
    end

## pristine(*gems) [](#method-i-pristine)

## relative_to_original_destination_root(path, remove_dottrue) [](#method-i-relative_to_original_destination_root)
Returns the given path relative to the absolute root (ie, root where the
script started).

## remove(*gems) [](#method-i-remove)

## remove_file(path, config{}) [](#method-i-remove_file)
Removes a file at the given location.

#### Parameters
path<String>
:   path of the file to be changed

config<Hash>
:   give :verbose => false to not log the status.


#### Example

    remove_file 'README'
    remove_file 'app/controllers/application_controller.rb'

## run(command, config{}) [](#method-i-run)
Executes a command returning the contents of the command.

#### Parameters
command<String>
:   the command to be executed.

config<Hash>
:   give :verbose => false to not log the status, :capture => true to hide to
    output. Specify :with to append an executable to command execution.


#### Example

    inside('vendor') do
      run('ln -s ~/edge rails')
    end

## run_ruby_script(command, config{}) [](#method-i-run_ruby_script)
Executes a ruby script (taking into account WIN32 platform quirks).

#### Parameters
command<String>
:   the command to be executed.

config<Hash>
:   give :verbose => false to not log the status.


## show(gem_namenil) [](#method-i-show)

## source_paths() [](#method-i-source_paths)
Holds source paths in instance so they can be manipulated.

## template(source, *args, &block) [](#method-i-template)
Gets an ERB template at the relative source, executes it and makes a copy at
the relative destination. If the destination is not given it's assumed to be
equal to the source removing .tt from the filename.

#### Parameters
source<String>
:   the relative path to the source root.

destination<String>
:   the relative path to the destination root.

config<Hash>
:   give :verbose => false to not log the status.


#### Examples

    template "README", "doc/README"

    template "doc/README"

## thor(command, *args) [](#method-i-thor)
Run a thor command. A hash of options can be given and it's converted to
switches.

#### Parameters
command<String>
:   the command to be invoked

args<Array>
:   arguments to the command

config<Hash>
:   give :verbose => false to not log the status, :capture => true to hide to
    output. Other options are given as parameter to Bundler::Thor.


#### Examples

    thor :install, "http://gist.github.com/103208"
    #=> thor install http://gist.github.com/103208

    thor :list, :all => true, :substring => 'rails'
    #=> thor list --all --substring=rails

## uncomment_lines(path, flag, *args) [](#method-i-uncomment_lines)
Uncomment all lines matching a given regex. Preserves indentation before the
comment hash and removes the hash and any immediate following space.

#### Parameters
path<String>
:   path of the file to be changed

flag<Regexp|String>
:   the regexp or string used to decide which lines to uncomment

config<Hash>
:   give :verbose => false to not log the status.


#### Example

    uncomment_lines 'config/initializers/session_store.rb', /active_record/

## update(*gems) [](#method-i-update)

## version() [](#method-i-version)

## viz() [](#method-i-viz)

