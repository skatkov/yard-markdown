# Class: Gem::RequestSet
**Inherits:** Object
    
**Includes:** Gem::TSort
  

A RequestSet groups a request to activate a set of dependencies.

    nokogiri = Gem::Dependency.new 'nokogiri', '~> 1.6'
    pg = Gem::Dependency.new 'pg', '~> 0.14'

    set = Gem::RequestSet.new nokogiri, pg

    requests = set.resolve

    p requests.map { |r| r.full_name }
    #=> ["nokogiri-1.6.0", "mini_portile-0.5.1", "pg-0.17.0"]


# Attributes
## always_install[RW] [](#attribute-i-always_install)
Array of gems to install even if already installed

## dependencies[RW] [](#attribute-i-dependencies)
Returns the value of attribute dependencies.

## development[RW] [](#attribute-i-development)
Returns the value of attribute development.

## development_shallow[RW] [](#attribute-i-development_shallow)
Set to true if you want to install only direct development dependencies.

## errors[RW] [](#attribute-i-errors)
Errors fetching gems during resolution.

## git_set[RW] [](#attribute-i-git_set)
The set of git gems imported via load_gemdeps.

## ignore_dependencies[RW] [](#attribute-i-ignore_dependencies)
When true, dependency resolution is not performed, only the requested gems are
installed.

## install_dir[RW] [](#attribute-i-install_dir)
:nodoc:

## prerelease[RW] [](#attribute-i-prerelease)
If true, allow dependencies to match prerelease gems.

## remote[RW] [](#attribute-i-remote)
When false no remote sets are used for resolving gems.

## resolver[RW] [](#attribute-i-resolver)
:nodoc:

## sets[RW] [](#attribute-i-sets)
Sets used for resolution

## soft_missing[RW] [](#attribute-i-soft_missing)
Treat missing dependencies as silent errors

## source_set[RW] [](#attribute-i-source_set)
The set of source gems imported via load_gemdeps.

## vendor_set[RW] [](#attribute-i-vendor_set)
The set of vendor gems imported via load_gemdeps.


#Instance Methods
## each_strongly_connected_component(&block) [](#method-i-each_strongly_connected_component)
The iterator version of the #strongly_connected_components method.
*`obj*.each_strongly_connected_component` is similar to
*`obj*.strongly_connected_components.each`, but modification of *obj* during
the iteration may lead to unexpected results.

#each_strongly_connected_component returns `nil`.

    class G
      include Gem::TSort
      def initialize(g)
        @g = g
      end
      def tsort_each_child(n, &b) @g[n].each(&b) end
      def tsort_each_node(&b) @g.each_key(&b) end
    end

    graph = G.new({1=>[2, 3], 2=>[4], 3=>[2, 4], 4=>[]})
    graph.each_strongly_connected_component {|scc| p scc }
    #=> [4]
    #   [2]
    #   [3]
    #   [1]

    graph = G.new({1=>[2], 2=>[3, 4], 3=>[2], 4=>[]})
    graph.each_strongly_connected_component {|scc| p scc }
    #=> [4]
    #   [2, 3]
    #   [1]

## each_strongly_connected_component_from(node, id_map{}, stack[], &block) [](#method-i-each_strongly_connected_component_from)
Iterates over strongly connected component in the subgraph reachable from
*node*.

Return value is unspecified.

#each_strongly_connected_component_from doesn't call #tsort_each_node.

    class G
      include Gem::TSort
      def initialize(g)
        @g = g
      end
      def tsort_each_child(n, &b) @g[n].each(&b) end
      def tsort_each_node(&b) @g.each_key(&b) end
    end

    graph = G.new({1=>[2, 3], 2=>[4], 3=>[2, 4], 4=>[]})
    graph.each_strongly_connected_component_from(2) {|scc| p scc }
    #=> [4]
    #   [2]

    graph = G.new({1=>[2], 2=>[3, 4], 3=>[2], 4=>[]})
    graph.each_strongly_connected_component_from(2) {|scc| p scc }
    #=> [4]
    #   [2, 3]

## gem(name, *reqs) [](#method-i-gem)
Declare that a gem of name `name` with `reqs` requirements is needed.

## import(deps) [](#method-i-import)
Add `deps` Gem::Dependency objects to the set.

## initialize(*deps) [](#method-i-initialize)
Creates a RequestSet for a list of Gem::Dependency objects, `deps`.  You can
then #resolve and #install the resolved list of dependencies.

    nokogiri = Gem::Dependency.new 'nokogiri', '~> 1.6'
    pg = Gem::Dependency.new 'pg', '~> 0.14'

    set = Gem::RequestSet.new nokogiri, pg

**@return** [RequestSet] a new instance of RequestSet

**@yield** [_self] 

**@yieldparam** [Gem::RequestSet] the object that the method was called on

## install(options, &block) [](#method-i-install)
Installs gems for this RequestSet using the Gem::Installer `options`.

If a `block` is given an activation `request` and `installer` are yielded. The
`installer` will be `nil` if a gem matching the request was already installed.

## install_from_gemdeps(options, &block) [](#method-i-install_from_gemdeps)
Installs from the gem dependencies files in the `:gemdeps` option in
`options`, yielding to the `block` as in #install.

If `:without_groups` is given in the `options`, those groups in the gem
dependencies file are not used.  See Gem::Installer for other `options`.

## install_hooks(requests, options) [](#method-i-install_hooks)
Call hooks on installed gems

## install_into(dir, forcetrue, options{}) [](#method-i-install_into)

## load_gemdeps(path, without_groups[], installingfalse) [](#method-i-load_gemdeps)
Load a dependency management file.

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## resolve(setGem::Resolver::BestSet.new) [](#method-i-resolve)
Resolve the requested dependencies and return an Array of Specification
objects to be activated.

## resolve_current() [](#method-i-resolve_current)
Resolve the requested dependencies against the gems available via Gem.path and
return an Array of Specification objects to be activated.

## sorted_requests() [](#method-i-sorted_requests)

## specs() [](#method-i-specs)

## specs_in(dir) [](#method-i-specs_in)

## strongly_connected_components() [](#method-i-strongly_connected_components)
Returns strongly connected components as an array of arrays of nodes. The
array is sorted from children to parents. Each elements of the array
represents a strongly connected component.

    class G
      include Gem::TSort
      def initialize(g)
        @g = g
      end
      def tsort_each_child(n, &b) @g[n].each(&b) end
      def tsort_each_node(&b) @g.each_key(&b) end
    end

    graph = G.new({1=>[2, 3], 2=>[4], 3=>[2, 4], 4=>[]})
    p graph.strongly_connected_components #=> [[4], [2], [3], [1]]

    graph = G.new({1=>[2], 2=>[3, 4], 3=>[2], 4=>[]})
    p graph.strongly_connected_components #=> [[4], [2, 3], [1]]

## tsort() [](#method-i-tsort)
Returns a topologically sorted array of nodes. The array is sorted from
children to parents, i.e. the first element has no child and the last node has
no parent.

If there is a cycle, Gem::TSort::Cyclic is raised.

    class G
      include Gem::TSort
      def initialize(g)
        @g = g
      end
      def tsort_each_child(n, &b) @g[n].each(&b) end
      def tsort_each_node(&b) @g.each_key(&b) end
    end

    graph = G.new({1=>[2, 3], 2=>[4], 3=>[2, 4], 4=>[]})
    p graph.tsort #=> [4, 2, 3, 1]

    graph = G.new({1=>[2], 2=>[3, 4], 3=>[2], 4=>[]})
    p graph.tsort # raises Gem::TSort::Cyclic

## tsort_each(&block) [](#method-i-tsort_each)
The iterator version of the #tsort method. *`obj*.tsort_each` is similar to
*`obj*.tsort.each`, but modification of *obj* during the iteration may lead to
unexpected results.

#tsort_each returns `nil`. If there is a cycle, Gem::TSort::Cyclic is raised.

    class G
      include Gem::TSort
      def initialize(g)
        @g = g
      end
      def tsort_each_child(n, &b) @g[n].each(&b) end
      def tsort_each_node(&b) @g.each_key(&b) end
    end

    graph = G.new({1=>[2, 3], 2=>[4], 3=>[2, 4], 4=>[]})
    graph.tsort_each {|n| p n }
    #=> 4
    #   2
    #   3
    #   1

## tsort_each_child(node) [](#method-i-tsort_each_child)
:nodoc:

## tsort_each_node(&block) [](#method-i-tsort_each_node)
:nodoc:

