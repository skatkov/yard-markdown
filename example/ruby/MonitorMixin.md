# Module: MonitorMixin
    

In concurrent programming, a monitor is an object or module intended to be
used safely by more than one thread. The defining characteristic of a monitor
is that its methods are executed with mutual exclusion. That is, at each point
in time, at most one thread may be executing any of its methods. This mutual
exclusion greatly simplifies reasoning about the implementation of monitors
compared to reasoning about parallel code that updates a data structure.

You can read more about the general principles on the Wikipedia page for
[Monitors](https://en.wikipedia.org/wiki/Monitor_%28synchronization%29).

## Examples

### Simple object.extend

    require 'monitor.rb'

    buf = []
    buf.extend(MonitorMixin)
    empty_cond = buf.new_cond

    # consumer
    Thread.start do
      loop do
        buf.synchronize do
          empty_cond.wait_while { buf.empty? }
          print buf.shift
        end
      end
    end

    # producer
    while line = ARGF.gets
      buf.synchronize do
        buf.push(line)
        empty_cond.signal
      end
    end

The consumer thread waits for the producer thread to push a line to buf while
`buf.empty?`. The producer thread (main thread) reads a line from ARGF and
pushes it into buf then calls `empty_cond.signal` to notify the consumer
thread of new data.

### Simple Class include

    require 'monitor'

    class SynchronizedArray < Array

      include MonitorMixin

      def initialize(*args)
        super(*args)
      end

      alias :old_shift :shift
      alias :old_unshift :unshift

      def shift(n=1)
        self.synchronize do
          self.old_shift(n)
        end
      end

      def unshift(item)
        self.synchronize do
          self.old_unshift(item)
        end
      end

      # other methods ...
    end

`SynchronizedArray` implements an Array with synchronized access to items.
This Class is implemented as subclass of Array which includes the MonitorMixin
module.


# Class Methods
## extend_object(obj ) [](#method-c-extend_object)
:nodoc:

#Instance Methods
## mon_enter() [](#method-i-mon_enter)
Enters exclusive section.

## mon_exit() [](#method-i-mon_exit)
Leaves exclusive section.

## mon_locked?() [](#method-i-mon_locked?)
Returns true if this monitor is locked by any thread

**@return** [Boolean] 

## mon_owned?() [](#method-i-mon_owned?)
Returns true if this monitor is locked by current thread.

**@return** [Boolean] 

## mon_synchronize(&b) [](#method-i-mon_synchronize)
Enters exclusive section and executes the block.  Leaves the exclusive section
automatically when the block exits.  See example under `MonitorMixin`.

## mon_try_enter() [](#method-i-mon_try_enter)
Attempts to enter exclusive section.  Returns `false` if lock fails.

## new_cond() [](#method-i-new_cond)
Creates a new MonitorMixin::ConditionVariable associated with the Monitor
object.

