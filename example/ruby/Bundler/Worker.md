# Class: Bundler::Worker
**Inherits:** Object
    



# Attributes
## name[RW] [](#attribute-i-name)

**@return** [String] the name of the worker


#Instance Methods
## deq() [](#method-i-deq)
Retrieves results of job function being executed in worker pool

## enq(obj) [](#method-i-enq)
Enqueue a request to be executed in the worker pool

**@param** [String] mostly it is name of spec that should be downloaded

## initialize(size, name, func) [](#method-i-initialize)
Creates a worker pool of specified size

**@param** [Integer] Size of pool

**@param** [String] name the name of the worker

**@param** [Proc] job to run in inside the worker pool

**@return** [Worker] a new instance of Worker

## stop() [](#method-i-stop)

