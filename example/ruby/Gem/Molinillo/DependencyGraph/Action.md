# Class: Gem::Molinillo::DependencyGraph::Action
**Inherits:** Object
    

An action that modifies a {DependencyGraph} that is reversible.

**@abstract** [] 


# Class Methods
## action_name() [](#method-c-action_name)
**@return** [Symbol] The name of the action.

# Attributes
## next[RW] [](#attribute-i-next)

**@return** [Action, Nil] The next action

## previous[RW] [](#attribute-i-previous)

**@return** [Action, Nil] The previous action


#Instance Methods
## down(graph) [](#method-i-down)
Reverses the action on the given graph.

**@param** [DependencyGraph] the graph to reverse the action on.

**@return** [Void] 

## up(graph) [](#method-i-up)
Performs the action on the given graph.

**@param** [DependencyGraph] the graph to perform the action on.

**@return** [Void] 

