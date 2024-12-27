# Class: Benchmark::Job
**Inherits:** Object
    

A Job is a sequence of labelled blocks to be processed by the Benchmark.bmbm
method.  It is of little direct interest to the user.


# Attributes
## list[RW] [](#attribute-i-list)
An array of 2-element arrays, consisting of label and block pairs.

## width[RW] [](#attribute-i-width)
Length of the widest label in the #list.


#Instance Methods
## initialize(width) [](#method-i-initialize)
Returns an initialized Job instance. Usually, one doesn't call this method
directly, as new Job objects are created by the #bmbm method. `width` is a
initial value for the label offset used in formatting; the #bmbm method passes
its `width` argument to this constructor.

**@return** [Job] a new instance of Job

## item(label"", &blk) [](#method-i-item)
Registers the given label and block pair in the job list.

**@raise** [ArgumentError] 

