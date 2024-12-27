# Class: RDoc::Generator::Darkfish
**Inherits:** Object
    
**Includes:** ERB::Util
  

Darkfish RDoc HTML Generator

$Id: darkfish.rb 52 2009-01-07 02:08:11Z deveiant $

## Author/s
*   Michael Granger (ged@FaerieMUD.org)

## Contributors
*   Mahlon E. Smith (mahlon@martini.nu)
*   Eric Hodel (drbrain@segment7.net)

## License

Copyright (c) 2007, 2008, Michael Granger. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

*   Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer.

*   Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

*   Neither the name of the author/s, nor the names of the project's
    contributors may be used to endorse or promote products derived from this
    software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## Attributions

Darkfish uses the [Silk Icons](http://www.famfamfam.com/lab/icons/silk/) set
by Mark James.


# Attributes
## asset_rel_path[RW] [](#attribute-i-asset_rel_path)
The relative path to style sheets and javascript.  By default this is set the
same as the rel_prefix.

## base_dir[RW] [](#attribute-i-base_dir)
The path to generate files into, combined with `--op` from the options for a
full path.

## classes[RW] [](#attribute-i-classes)
Classes and modules to be used by this generator, not necessarily displayed. 
See also #modsort

## dry_run[RW] [](#attribute-i-dry_run)
No files will be written when dry_run is true.

## file_output[RW] [](#attribute-i-file_output)
When false the generate methods return a String instead of writing to a file. 
The default is true.

## files[RW] [](#attribute-i-files)
Files to be displayed by this generator

## json_index[RW] [](#attribute-i-json_index)
The JSON index generator for this Darkfish generator

## methods[RW] [](#attribute-i-methods)
Methods to be displayed by this generator

## modsort[RW] [](#attribute-i-modsort)
Sorted list of classes and modules to be displayed by this generator

## outputdir[RW] [](#attribute-i-outputdir)
The output directory

## store[RW] [](#attribute-i-store)
The RDoc::Store that is the source of the generated content

## template_dir[RW] [](#attribute-i-template_dir)
The directory where the template files live


#Instance Methods
## assemble_template(body_file) [](#method-i-assemble_template)
Creates a template from its components and the `body_file`.

For backwards compatibility, if `body_file` contains "<html" the body is used
directly.

## class_dir() [](#method-i-class_dir)
Directory where generated class HTML files live relative to the output dir.

## copy_static() [](#method-i-copy_static)
Copies static files from the static_path into the output directory

## debug_msg(*msg) [](#method-i-debug_msg)
Output progress information if debugging is enabled

## excerpt(content) [](#method-i-excerpt)
Returns an excerpt of the content for usage in meta description tags

## file_dir() [](#method-i-file_dir)
Directory where generated class HTML files live relative to the output dir.

## gen_sub_directories() [](#method-i-gen_sub_directories)
Create the directories the generated docs will live in if they don't already
exist.

## generate() [](#method-i-generate)
Build the initial indices and output objects based on an array of TopLevel
objects containing the extracted information.

## generate_ancestor_list(ancestors, klass) [](#method-i-generate_ancestor_list)

## generate_class(klass, template_filenil) [](#method-i-generate_class)
Generates a class file for `klass`

## generate_class_files() [](#method-i-generate_class_files)
Generate a documentation file for each class and module

## generate_file_files() [](#method-i-generate_file_files)
Generate a documentation file for each file

## generate_index() [](#method-i-generate_index)
Generate an index page which lists all the classes which are documented.

## generate_page(file) [](#method-i-generate_page)
Generate a page file for `file`

## generate_servlet_not_found(message) [](#method-i-generate_servlet_not_found)
Generates the 404 page for the RDoc servlet

## generate_servlet_root(installed) [](#method-i-generate_servlet_root)
Generates the servlet root page for the RDoc servlet

## generate_table_of_contents() [](#method-i-generate_table_of_contents)
Generate an index page which lists all the classes which are documented.

## get_sorted_module_list(classes) [](#method-i-get_sorted_module_list)
Return a list of the documented modules sorted by salience first, then by
name.

## get_svninfo(klass) [](#method-i-get_svninfo)
Try to extract Subversion information out of the first constant whose value
looks like a subversion Id tag. If no matching constant is found, and empty
hash is returned.

## initialize(store, options) [](#method-i-initialize)
Initialize a few instance variables before we start

**@return** [Darkfish] a new instance of Darkfish

## install_rdoc_static_file(source, destination, options) [](#method-i-install_rdoc_static_file)
:nodoc:

## render(file_name) [](#method-i-render)
Renders the ERb contained in `file_name` relative to the template directory
and returns the result based on the current context.

## render_template(template_file, out_filenil) [](#method-i-render_template)
Load and render the erb template in the given `template_file` and write it out
to `out_file`.

Both `template_file` and `out_file` should be Pathname-like objects.

An io will be yielded which must be captured by binding in the caller.

## setup() [](#method-i-setup)
Prepares for generation of output from the current directory

## template_for(file, pagetrue, klassERB) [](#method-i-template_for)
Retrieves a cache template for `file`, if present, or fills the cache.

## template_result(template, context, template_file) [](#method-i-template_result)
Creates the result for `template` with `context`.  If an error is raised a
Pathname `template_file` will indicate the file where the error occurred.

## time_delta_string(seconds) [](#method-i-time_delta_string)
Return a string describing the amount of time in the given number of seconds
in terms a human can understand easily.

## write_style_sheet() [](#method-i-write_style_sheet)
Copy over the stylesheet into the appropriate place in the output directory.

