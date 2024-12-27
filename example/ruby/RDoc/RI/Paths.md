# Module: RDoc::RI::Paths
    

The directories where ri data lives.  Paths can be enumerated via ::each, or
queried individually via ::system_dir, ::site_dir, ::home_dir and ::gem_dir.


# Class Methods
## each(system true, site true, home true, gems :latest, *extra_dirs ) [](#method-c-each)
Iterates over each selected path yielding the directory and type.

Yielded types:
:system
:   Where Ruby's ri data is stored.  Yielded when `system` is true

:site
:   Where ri for installed libraries are stored.  Yielded when `site` is true.
     Normally no ri data is stored here.

:home
:   ~/.rdoc.  Yielded when `home` is true.

:gem
:   ri data for an installed gem.  Yielded when `gems` is true.

:extra
:   ri data directory from the command line.  Yielded for each entry in
    `extra_dirs`

**@yield** [system_dir, :system] 

## gem_dir(name , version ) [](#method-c-gem_dir)
The ri directory for the gem with `gem_name`.
## gemdirs(filter :latest) [](#method-c-gemdirs)
The latest installed gems' ri directories.  `filter` can be :all or :latest.

A `filter` :all includes all versions of gems and includes gems without ri
documentation.
## home_dir() [](#method-c-home_dir)
The location of the rdoc data in the user's home directory.

Like ::system, ri data in the user's home directory is rare and predates
libraries distributed via RubyGems.  ri data is rarely generated into this
directory.
## path(system true, site true, home true, gems :latest, *extra_dirs ) [](#method-c-path)
Returns existing directories from the selected documentation directories as an
Array.

See also ::each
## raw_path(system , site , home , gems , *extra_dirs ) [](#method-c-raw_path)
Returns selected documentation directories including nonexistent directories.

See also ::each
## site_dir() [](#method-c-site_dir)
The location of ri data installed into the site dir.

Historically this was available for documentation installed by Ruby libraries
predating RubyGems.  It is unlikely to contain any content for modern Ruby
installations.
## system_dir() [](#method-c-system_dir)
The location of the built-in ri data.

This data is built automatically when `make` is run when Ruby is installed. 
If you did not install Ruby by hand you may need to install the documentation
yourself.  Please consult the documentation for your package manager or Ruby
installer for details.  You can also use the rdoc-data gem to install system
ri data for common versions of Ruby.

