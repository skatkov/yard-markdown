# Class: TSortHash
**Inherits:** Hash
    
**Includes:** TSort
  

:nodoc:



#Instance Methods
## each_strongly_connected_component(&block) [](#method-i-each_strongly_connected_component)
The iterator version of the #strongly_connected_components method.
*`obj*.each_strongly_connected_component` is similar to
*`obj*.strongly_connected_components.each`, but modification of *obj* during
the iteration may lead to unexpected results.

#each_strongly_connected_component returns `nil`.

    class G
      include TSort
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
      include TSort
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

## strongly_connected_components() [](#method-i-strongly_connected_components)
Returns strongly connected components as an array of arrays of nodes. The
array is sorted from children to parents. Each elements of the array
represents a strongly connected component.

    class G
      include TSort
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

If there is a cycle, TSort::Cyclic is raised.

    class G
      include TSort
      def initialize(g)
        @g = g
      end
      def tsort_each_child(n, &b) @g[n].each(&b) end
      def tsort_each_node(&b) @g.each_key(&b) end
    end

    graph = G.new({1=>[2, 3], 2=>[4], 3=>[2, 4], 4=>[]})
    p graph.tsort #=> [4, 2, 3, 1]

    graph = G.new({1=>[2], 2=>[3, 4], 3=>[2], 4=>[]})
    p graph.tsort # raises TSort::Cyclic

## tsort_each(&block) [](#method-i-tsort_each)
The iterator version of the #tsort method. *`obj*.tsort_each` is similar to
*`obj*.tsort.each`, but modification of *obj* during the iteration may lead to
unexpected results.

#tsort_each returns `nil`. If there is a cycle, TSort::Cyclic is raised.

    class G
      include TSort
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

## tsort_each_child(node, &block) [](#method-i-tsort_each_child)

