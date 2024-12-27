# Class: Lrama::State
**Inherits:** Object
    



# Attributes
## accessing_symbol[RW] [](#attribute-i-accessing_symbol)
Returns the value of attribute accessing_symbol.

## closure[RW] [](#attribute-i-closure)
Returns the value of attribute closure.

## conflicts[RW] [](#attribute-i-conflicts)
Returns the value of attribute conflicts.

## default_reduction_rule[RW] [](#attribute-i-default_reduction_rule)
Returns the value of attribute default_reduction_rule.

## id[RW] [](#attribute-i-id)
Returns the value of attribute id.

## items[RW] [](#attribute-i-items)
Returns the value of attribute items.

## kernels[RW] [](#attribute-i-kernels)
Returns the value of attribute kernels.

## reduces[RW] [](#attribute-i-reduces)
Returns the value of attribute reduces.

## resolved_conflicts[RW] [](#attribute-i-resolved_conflicts)
Returns the value of attribute resolved_conflicts.

## shifts[RW] [](#attribute-i-shifts)
Returns the value of attribute shifts.


#Instance Methods
## compute_shifts_reduces() [](#method-i-compute_shifts_reduces)

## find_reduce_by_item!(item) [](#method-i-find_reduce_by_item!)

## has_conflicts?() [](#method-i-has_conflicts?)

**@return** [Boolean] 

## initialize(id, accessing_symbol, kernels) [](#method-i-initialize)

**@return** [State] a new instance of State

## non_default_reduces() [](#method-i-non_default_reduces)

## nterm_transitions() [](#method-i-nterm_transitions)

## rr_conflicts() [](#method-i-rr_conflicts)

## selected_term_transitions() [](#method-i-selected_term_transitions)

## set_items_to_state(items, next_state) [](#method-i-set_items_to_state)

## set_look_ahead(rule, look_ahead) [](#method-i-set_look_ahead)

## sr_conflicts() [](#method-i-sr_conflicts)

## term_transitions() [](#method-i-term_transitions)

## transition(sym) [](#method-i-transition)
Move to next state by sym

## transitions() [](#method-i-transitions)

