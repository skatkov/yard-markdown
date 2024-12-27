# Exception: Ractor::ClosedError
**Inherits:** StopIteration
    

Raised when an attempt is made to send a message to a closed port, or to
retrieve a message from a closed and empty port. Ports may be closed
explicitly with Ractor#close_outgoing/close_incoming and are closed implicitly
when a Ractor terminates.

    r = Ractor.new { sleep(500) }
    r.close_outgoing
    r.take # Ractor::ClosedError

ClosedError is a descendant of StopIteration, so the closing of the ractor
will break the loops without propagating the error:

    r = Ractor.new do
      loop do
        msg = receive # raises ClosedError and loop traps it
        puts "Received: #{msg}"
      end
      puts "loop exited"
    end

    3.times{|i| r << i}
    r.close_incoming
    r.take
    puts "Continue successfully"

This will print:

    Received: 0
    Received: 1
    Received: 2
    loop exited
    Continue successfully



