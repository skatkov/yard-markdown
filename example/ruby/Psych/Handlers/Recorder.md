# Class: Psych::Handlers::Recorder
**Inherits:** Psych::Handler
    

This handler will capture an event and record the event.  Recorder events are
available vial Psych::Handlers::Recorder#events.

For example:

    recorder = Psych::Handlers::Recorder.new
    parser = Psych::Parser.new recorder
    parser.parse '--- foo'

    recorder.events # => [list of events]

    # Replay the events

    emitter = Psych::Emitter.new $stdout
    recorder.events.each do |m, args|
      emitter.send m, *args
    end


# Attributes
## events[RW] [](#attribute-i-events)
Returns the value of attribute events.


#Instance Methods
## initialize() [](#method-i-initialize)

**@return** [Recorder] a new instance of Recorder

