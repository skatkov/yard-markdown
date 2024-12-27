# Exception: Bundler::Thor::Error
**Inherits:** StandardError
    

Bundler::Thor::Error is raised when it's caused by wrong usage of thor
classes. Those errors have their backtrace suppressed and are nicely shown to
the user.

Errors that are caused by the developer, like declaring a method which
overwrites a thor keyword, SHOULD NOT raise a Bundler::Thor::Error. This way,
we ensure that developer errors are shown with full backtrace.



