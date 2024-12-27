# Class: Gem::Molinillo::Resolver::Resolution::Conflict
**Inherits:** Struct
    

A conflict that the resolution process encountered

**@attr** [Object] the requirement that immediately led to the conflict

**@attr** [{String,Nil=>[Object]}] the requirements that caused the conflict

**@attr** [Object, nil] the existing spec that was in conflict with
the {#possibility}

**@attr** [Object] the set of specs that was unable to be
activated due to a conflict.

**@attr** [Object] the relevant locking requirement.

**@attr** [Array<Array<Object>>] the different requirement
trees that led to every requirement for the conflicting name.

**@attr** [{String=>Object}] the already-activated specs.

**@attr** [Object] an error that has occurred during resolution, and
will be raised at the end of it if no resolution is found.


# Attributes
## activated_by_name[RW] [](#attribute-i-activated_by_name)
the already-activated specs.

**@return** [{String=>Object}] the current value of activated_by_name

## existing[RW] [](#attribute-i-existing)
the existing spec that was in conflict with the {#possibility}

**@return** [Object, nil] the current value of existing

## locked_requirement[RW] [](#attribute-i-locked_requirement)
the relevant locking requirement.

**@return** [Object] the current value of locked_requirement

## possibility_set[RW] [](#attribute-i-possibility_set)
the set of specs that was unable to be activated due to a conflict.

**@return** [Object] the current value of possibility_set

## requirement[RW] [](#attribute-i-requirement)
the requirement that immediately led to the conflict

**@return** [Object] the current value of requirement

## requirement_trees[RW] [](#attribute-i-requirement_trees)
the different requirement trees that led to every requirement for the
conflicting name.

**@return** [Array<Array<Object>>] the current value of requirement_trees

## requirements[RW] [](#attribute-i-requirements)
the requirements that caused the conflict

**@return** [{String,Nil=>[Object]}] the current value of requirements

## underlying_error[RW] [](#attribute-i-underlying_error)
an error that has occurred during resolution, and will be raised at the end of
it if no resolution is found.

**@return** [Object] the current value of underlying_error


#Instance Methods
## possibility() [](#method-i-possibility)

**@return** [Object] a spec that was unable to be activated due to a conflict

