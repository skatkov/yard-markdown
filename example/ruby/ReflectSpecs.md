# Module: ReflectSpecs
    

These modules and classes are fixtures used by the Ruby reflection specs.
These include specs for methods:

Module:
    instance_methods
    public_instance_methods
    protected_instance_methods
    private_instance_methods

Kernel:
    methods
    public_methods
    protected_methods
    private_methods
    singleton_methods

The following naming scheme is used to keep the method names short and still
communicate the relevant facts about the methods:

    X[s]_VIS

where

    X is the name of the module or class in lower case
    s is the literal character 's' for singleton methods
    VIS is the first three letters of the corresponding visibility
    pub(lic), pro(tected), pri(vate)

For example:

    l_pub is a public method on module L
    ls_pri is a private singleton method on module L


# Class Methods
## o() [](#method-c-o)
An object with no singleton methods.
## oe() [](#method-c-oe)
An object extended with a module.
## oed() [](#method-c-oed)
An object with duplicate methods extended with a module.
## oee() [](#method-c-oee)
An object extended with two modules.
## oei() [](#method-c-oei)
An object extended with a module including a module.
## os() [](#method-c-os)
An object with singleton methods.

