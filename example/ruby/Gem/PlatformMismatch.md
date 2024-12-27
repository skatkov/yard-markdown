# Class: Gem::PlatformMismatch
**Inherits:** Gem::ErrorReason
    

Generated when trying to lookup a gem to indicate that the gem was found, but
that it isn't usable on the current platform.

fetch and install read these and report them to the user to aid in figuring
out why a gem couldn't be installed.


# Attributes
## name[RW] [](#attribute-i-name)
the name of the gem

## platforms[RW] [](#attribute-i-platforms)
The platforms that are mismatched

## version[RW] [](#attribute-i-version)
the version


#Instance Methods
## add_platform(platform) [](#method-i-add_platform)
append a platform to the list of mismatched platforms.

Platforms are added via this instead of injected via the constructor so that
we can loop over a list of mismatches and just add them rather than perform
some kind of calculation mismatch summary before creation.

## initialize(name, version) [](#method-i-initialize)

**@return** [PlatformMismatch] a new instance of PlatformMismatch

## wordy() [](#method-i-wordy)
A wordy description of the error.

