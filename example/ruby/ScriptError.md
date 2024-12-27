# Exception: ScriptError
**Inherits:** Exception
    

ScriptError is the superclass for errors raised when a script can not be
executed because of a `LoadError`, `NotImplementedError` or a `SyntaxError`.
Note these type of `ScriptErrors` are not `StandardError` and will not be
rescued unless it is specified explicitly (or its ancestor `Exception`).



