# Module: RDoc
    

This class is referenced by RubyGems to create documents. All implementations
are moved to the above RubyGemsHook.

This class does nothing when this RDoc is installed as a normal gem or a
bundled gem.

This class does generate/remove documents for compatibility when this RDoc is
installed as a default gem.

We can remove this when all maintained RubyGems remove `rubygems/rdoc.rb`.


# Class Methods
## home() [](#method-c-home)
Searches and returns the directory for settings.

1.  `$HOME/.rdoc` directory, if it exists.
2.  The `rdoc` directory under the path specified by the `XDG_DATA_HOME`
    environment variable, if it is set.
3.  `$HOME/.local/share/rdoc` directory.

Other than the home directory, the containing directory will be created
automatically.
## load_yaml() [](#method-c-load_yaml)
Loads the best available YAML library.

