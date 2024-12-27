# Class: RDoc::ERBPartial
**Inherits:** ERB
    

Allows an ERB template to be rendered in the context (binding) of an existing
ERB template evaluation.



#Instance Methods
## set_eoutvar(compiler, eoutvar'_erbout') [](#method-i-set_eoutvar)
Overrides `compiler` startup to set the `eoutvar` to an empty string only if
it isn't already set.

