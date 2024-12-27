# Module: Gem::Molinillo::UI
    

Conveys information about the resolution process to a user.



#Instance Methods
## after_resolution() [](#method-i-after_resolution)
Called after resolution ends (either successfully or with an error). By
default, prints a newline.

**@return** [void] 

## before_resolution() [](#method-i-before_resolution)
Called before resolution begins.

**@return** [void] 

## debug(depth0) [](#method-i-debug)
Conveys debug information to the user.

**@param** [Integer] the current depth of the resolution process.

**@return** [void] 

## debug?() [](#method-i-debug?)
Whether or not debug messages should be printed. By default, whether or not
the `MOLINILLO_DEBUG` environment variable is set.

**@return** [Boolean] 

## indicate_progress() [](#method-i-indicate_progress)
Called roughly every {#progress_rate}, this method should convey progress to
the user.

**@return** [void] 

## output() [](#method-i-output)
The {IO} object that should be used to print output. `STDOUT`, by default.

**@return** [IO] 

## progress_rate() [](#method-i-progress_rate)
How often progress should be conveyed to the user via {#indicate_progress}, in
seconds. A third of a second, by default.

**@return** [Float] 

