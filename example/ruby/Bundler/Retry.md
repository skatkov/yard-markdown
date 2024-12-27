# Class: Bundler::Retry
**Inherits:** Object
    

General purpose class for retrying code that may fail


# Class Methods
## default_attempts() [](#method-c-default_attempts)
## default_retries() [](#method-c-default_retries)
# Attributes
## current_run[RW] [](#attribute-i-current_run)
Returns the value of attribute current_run.

## name[RW] [](#attribute-i-name)
Returns the value of attribute name.

## total_runs[RW] [](#attribute-i-total_runs)
Returns the value of attribute total_runs.


#Instance Methods
## attempt(&block) [](#method-i-attempt)

## initialize(name, exceptionsnil, retriesself.class.default_retries) [](#method-i-initialize)

**@return** [Retry] a new instance of Retry

