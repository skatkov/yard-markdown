# Module: Coverage
    



# Class Methods
## line_stub(file ) [](#method-c-line_stub)
## peek_result() [](#method-c-peek_result)
Returns a hash that contains filename as key and coverage array as value. This
is the same as `Coverage.result(stop: false, clear: false)`.

    {
      "file.rb" => [1, 2, nil],
      ...
    }
**@overload** [] 

## result(*args ) [](#method-c-result)
Returns a hash that contains filename as key and coverage array as value. If
`clear` is true, it clears the counters to zero. If `stop` is true, it
disables coverage measurement.
**@overload** [] 

## resume() [](#method-c-resume)
Start/resume the coverage measurement.

Caveat: Currently, only process-global coverage measurement is supported. You
cannot measure per-thread coverage. If your process has multiple thread, using
Coverage.resume/suspend to capture code coverage executed from only a limited
code block, may yield misleading results.
**@overload** [] 

## running?() [](#method-c-running?)
Returns true if coverage stats are currently being collected (after
Coverage.start call, but before Coverage.result call)
**@overload** [] 

## setup(*args ) [](#method-c-setup)
Set up the coverage measurement.

Note that this method does not start the measurement itself. Use
Coverage.resume to start the measurement.

You may want to use Coverage.start to setup and then start the measurement.
**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## start(*args ) [](#method-c-start)
Enables the coverage measurement. See the documentation of Coverage class in
detail. This is equivalent to Coverage.setup and Coverage.resume.
**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## state() [](#method-c-state)
Returns the state of the coverage measurement.
**@overload** [] 

## supported?(_mode ) [](#method-c-supported?)
Returns true if coverage measurement is supported for the given mode.

The mode should be one of the following symbols: `:lines`, `:oneshot_lines`,
`:branches`, `:methods`, `:eval`.

Example:

    Coverage.supported?(:lines)  #=> true
    Coverage.supported?(:all)    #=> false
**@overload** [] 

## suspend() [](#method-c-suspend)
Suspend the coverage measurement. You can use Coverage.resume to restart the
measurement.
**@overload** [] 


