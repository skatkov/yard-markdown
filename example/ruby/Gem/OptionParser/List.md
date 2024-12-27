# Class: Gem::OptionParser::List
**Inherits:** Object
    

Simple option list providing mapping from short and/or long option string to
Gem::OptionParser::Switch and mapping from acceptable argument to matching
pattern and converter pair. Also provides summary feature.


# Attributes
## atype[RW] [](#attribute-i-atype)
Map from acceptable argument types to pattern and converter pairs.

## list[RW] [](#attribute-i-list)
List of all switches and summary string.

## long[RW] [](#attribute-i-long)
Map from long style option switches to actual switch objects.

## short[RW] [](#attribute-i-short)
Map from short style option switches to actual switch objects.


#Instance Methods
## accept(t, pat/.*/m, &block) [](#method-i-accept)
See Gem::OptionParser.accept.

## add_banner(to) [](#method-i-add_banner)
:nodoc:

## append(*args) [](#method-i-append)
Appends `switch` at the tail of the list, and associates short, long and
negated long options. Arguments are:

`switch`
:   Gem::OptionParser::Switch instance to be inserted.

`short_opts`
:   List of short style options.

`long_opts`
:   List of long style options.

`nolong_opts`
:   List of long style options with "no-" prefix.


    append(switch, short_opts, long_opts, nolong_opts)

## complete(id, opt, icasefalse, *pat, &block) [](#method-i-complete)
Searches list `id` for `opt` and the optional patterns for completion `pat`.
If `icase` is true, the search is case insensitive. The result is returned or
yielded if a block is given. If it isn't found, nil is returned.

## compsys(*args, &block) [](#method-i-compsys)
:nodoc:

## each_option(&block) [](#method-i-each_option)
Iterates over each option, passing the option to the `block`.

## get_candidates(id) [](#method-i-get_candidates)

**@yield** [__send__(id).keys] 

## initialize() [](#method-i-initialize)
Just initializes all instance variables.

**@return** [List] a new instance of List

## prepend(*args) [](#method-i-prepend)
Inserts `switch` at the head of the list, and associates short, long and
negated long options. Arguments are:

`switch`
:   Gem::OptionParser::Switch instance to be inserted.

`short_opts`
:   List of short style options.

`long_opts`
:   List of long style options.

`nolong_opts`
:   List of long style options with "no-" prefix.


    prepend(switch, short_opts, long_opts, nolong_opts)

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## reject(t) [](#method-i-reject)
See Gem::OptionParser.reject.

## search(id, key) [](#method-i-search)
Searches `key` in `id` list. The result is returned or yielded if a block is
given. If it isn't found, nil is returned.

## summarize(*args, &block) [](#method-i-summarize)
Creates the summary table, passing each line to the `block` (without newline).
The arguments `args` are passed along to the summarize method which is called
on every option.

