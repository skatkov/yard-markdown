# Module: GC::Profiler
    



# Class Methods
## clear() [](#method-c-clear)
Clears the GC profiler data.
**@overload** [] 

## disable() [](#method-c-disable)
Stops the GC profiler.
**@overload** [] 

## enable() [](#method-c-enable)
Starts the GC profiler.
**@overload** [] 

## enabled?() [](#method-c-enabled?)
The current status of GC profile mode.
**@overload** [] 

**@return** [Boolean] 

## raw_data() [](#method-c-raw_data)
Returns an Array of individual raw profile data Hashes ordered from earliest
to latest by `:GC_INVOKE_TIME`.

For example:

    [

{
    :GC_TIME=>1.3000000000000858e-05,
    :GC_INVOKE_TIME=>0.010634999999999999,
    :HEAP_USE_SIZE=>289640,
    :HEAP_TOTAL_SIZE=>588960,
    :HEAP_TOTAL_OBJECTS=>14724,
    :GC_IS_MARKED=>false

},
      # ...
    ]

The keys mean:

`:GC_TIME`
:   Time elapsed in seconds for this GC run
    `:GC_INVOKE_TIME`
:       Time elapsed in seconds from startup to when the GC was invoked
        `:HEAP_USE_SIZE`
:           Total bytes of heap used
            `:HEAP_TOTAL_SIZE`
:               Total size of heap in bytes
                `:HEAP_TOTAL_OBJECTS`
:                   Total number of objects
                    `:GC_IS_MARKED`
:                       Returns `true` if the GC is in mark phase

                        If ruby was built with `GC_PROFILE_MORE_DETAIL`, you
                        will also have access to the following hash keys:

                        `:GC_MARK_TIME`
`:GC_SWEEP_TIME`
`:ALLOCATE_INCREASE`
`:ALLOCATE_LIMIT`
`:HEAP_USE_PAGES`
`:HEAP_LIVE_OBJECTS`
`:HEAP_FREE_OBJECTS`
`:HAVE_FINALIZE`
:                           






**@overload** [] 

## report(*args ) [](#method-c-report)
Writes the GC::Profiler.result to `$stdout` or the given IO object.
**@overload** [] 

**@overload** [] 

## result() [](#method-c-result)
Returns a profile data report such as:

    GC 1 invokes.
    Index    Invoke Time(sec)       Use Size(byte)     Total Size(byte)         Total Object                    GC time(ms)
        1               0.012               159240               212940                10647         0.00000000000001530000
**@overload** [] 

## total_time() [](#method-c-total_time)
The total time used for garbage collection in seconds
**@overload** [] 


