# Class: RDoc::Servlet
**Inherits:** WEBrick::HTTPServlet::AbstractServlet
    

This is a WEBrick servlet that allows you to browse ri documentation.

You can show documentation through either `ri --server` or, with RubyGems 2.0
or newer, `gem server`.  For ri, the server runs on port 8214 by default.  For
RubyGems the server runs on port 8808 by default.

You can use this servlet in your own project by mounting it on a WEBrick
server:

    require 'webrick'

    server = WEBrick::HTTPServer.new Port: 8000

    server.mount '/', RDoc::Servlet

If you want to mount the servlet some other place than the root, provide the
base path when mounting:

    server.mount '/rdoc', RDoc::Servlet, '/rdoc'


# Class Methods
## get_instance(server , *options ) [](#method-c-get_instance)
Creates an instance of this servlet that shares cached data between requests.
# Attributes
## asset_dirs[RW] [](#attribute-i-asset_dirs)
Maps an asset type to its path on the filesystem

## options[RW] [](#attribute-i-options)
An RDoc::Options instance used for rendering options


#Instance Methods
## asset(generator_name, req, res) [](#method-i-asset)
Serves the asset at the path in `req` for `generator_name` via `res`.

## do_GET(req, res) [](#method-i-do_GET)
GET request entry point.  Fills in `res` for the path, etc. in `req`.

## documentation_page(store, generator, path, req, res) [](#method-i-documentation_page)
Fills in `res` with the class, module or page for `req` from `store`.

`path` is relative to the mount_path and is used to determine the class,
module or page name (/RDoc/Servlet.html becomes RDoc::Servlet). `generator` is
used to create the page.

## documentation_search(store, generator, req, res) [](#method-i-documentation_search)
Creates the JSON search index on `res` for the given `store`.  `generator`
must respond to #json_index to build.  `req` is ignored.

## documentation_source(path) [](#method-i-documentation_source)
Returns the RDoc::Store and path relative to `mount_path` for documentation at
`path`.

## error(exception, req, res) [](#method-i-error)
Generates an error page for the `exception` while handling `req` on `res`.

## generator_for(store) [](#method-i-generator_for)
Instantiates a Darkfish generator for `store`

## if_modified_since(req, res, pathnil) [](#method-i-if_modified_since)
Handles the If-Modified-Since HTTP header on `req` for `path`.  If the file
has not been modified a Not Modified response is returned.  If the file has
been modified a Last-Modified header is added to `res`.

## initialize(server, stores, cache, mount_pathnil, extra_doc_dirs[]) [](#method-i-initialize)
Creates a new WEBrick servlet.

Use `mount_path` when mounting the servlet somewhere other than /.

Use `extra_doc_dirs` for additional documentation directories.

`server` is provided automatically by WEBrick when mounting.  `stores` and
`cache` are provided automatically by the servlet.

**@return** [Servlet] a new instance of Servlet

## installed_docs() [](#method-i-installed_docs)
Returns an Array of installed documentation.

Each entry contains the documentation name (gem name, 'Ruby Documentation',
etc.), the path relative to the mount point, whether the documentation exists,
the type of documentation (See RDoc::RI::Paths#each) and the filesystem to the
RDoc::Store for the documentation.

## not_found(generator, req, res, messagenil) [](#method-i-not_found)
Returns a 404 page built by `generator` for `req` on `res`.

## ri_paths(&block) [](#method-i-ri_paths)
Enumerates the ri paths.  See RDoc::RI::Paths#each

## root(req, res) [](#method-i-root)
Generates the root page on `res`.  `req` is ignored.

## root_search(req, res) [](#method-i-root_search)
Generates a search index for the root page on `res`.  `req` is ignored.

## show_documentation(req, res) [](#method-i-show_documentation)
Displays documentation for `req` on `res`, whether that be HTML or some asset.

## store_for(source_name) [](#method-i-store_for)
Returns an RDoc::Store for the given `source_name` ('ruby' or a gem name).

