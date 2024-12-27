# Class: Gem::StreamUI::SilentProgressReporter
**Inherits:** Object
    

An absolutely silent progress reporter.


# Attributes
## count[RW] [](#attribute-i-count)
The count of items is never updated for the silent progress reporter.


#Instance Methods
## done() [](#method-i-done)
Does not print anything when complete as this object has taken a vow of
silence.

## initialize(out_stream, size, initial_message, terminal_messagenil) [](#method-i-initialize)
Creates a silent progress reporter that ignores all input arguments.

**@return** [SilentProgressReporter] a new instance of SilentProgressReporter

## updated(message) [](#method-i-updated)
Does not print `message` when updated as this object has taken a vow of
silence.

