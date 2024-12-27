# Exception: WIN32OLE::RuntimeError
**Inherits:** RuntimeError
    

Raised when OLE processing failed.

EX:

    obj = WIN32OLE.new("NonExistProgID")

raises the exception:

    WIN32OLE::RuntimeError: unknown OLE server: `NonExistProgID'
        HRESULT error code:0x800401f3
          Invalid class string



