# Exception: FiberError
**Inherits:** StandardError
    

Raised when an invalid operation is attempted on a Fiber, in particular when
attempting to call/resume a dead fiber, attempting to yield from the root
fiber, or calling a fiber across threads.

    fiber = Fiber.new{}
    fiber.resume #=> nil
    fiber.resume #=> FiberError: dead fiber called



