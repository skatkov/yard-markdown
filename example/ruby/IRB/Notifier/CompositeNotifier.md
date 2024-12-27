# Class: IRB::Notifier::CompositeNotifier
**Inherits:** IRB::Notifier::AbstractNotifier
    

A class that can be used to create a group of notifier objects with the intent
of representing a leveled notification system for irb.

This class will allow you to generate other notifiers, and assign them the
appropriate level for output.

The Notifier class provides a class-method Notifier.def_notifier to create a
new composite notifier. Using the first composite notifier object you create,
sibling notifiers can be initialized with #def_notifier.


# Attributes
## level_notifier[RW] [](#attribute-i-level_notifier)
Returns the leveled notifier for this object

## notifiers[RW] [](#attribute-i-notifiers)
List of notifiers in the group


#Instance Methods
## def_notifier(level, prefix"") [](#method-i-def_notifier)
Creates a new LeveledNotifier in the composite #notifiers group.

The given `prefix` will be assigned to the notifier, and `level` will be used
as the index of the #notifiers Array.

This method returns the newly created instance.

## initialize(prefix, base_notifier) [](#method-i-initialize)
Create a new composite notifier object with the given `prefix`, and
`base_notifier` to use for output.

**@return** [CompositeNotifier] a new instance of CompositeNotifier

