# Class: WIN32OLE::TypeLib
**Inherits:** Object
    

`WIN32OLE::TypeLib` objects represent OLE tyblib information.


# Class Methods
## typelibs() [](#method-c-typelibs)
Returns the array of WIN32OLE::TypeLib object.

    tlibs = WIN32OLE::TypeLib.typelibs
**@overload** [] 


#Instance Methods
## guid() [](#method-i-guid)
Returns guid string which specifies type library.

    tlib = WIN32OLE::TypeLib.new('Microsoft Excel 9.0 Object Library')
    guid = tlib.guid # -> '{00020813-0000-0000-C000-000000000046}'

**@overload** [] 

## initialize(args) [](#method-i-initialize)
Returns a new WIN32OLE::TypeLib object.

The first argument *typelib*  specifies OLE type library name or GUID or OLE
library file. The second argument is major version or version of the type
library. The third argument is minor version. The second argument and third
argument are optional. If the first argument is type library name, then the
second and third argument are ignored.

    tlib1 = WIN32OLE::TypeLib.new('Microsoft Excel 9.0 Object Library')
    tlib2 = WIN32OLE::TypeLib.new('{00020813-0000-0000-C000-000000000046}')
    tlib3 = WIN32OLE::TypeLib.new('{00020813-0000-0000-C000-000000000046}', 1.3)
    tlib4 = WIN32OLE::TypeLib.new('{00020813-0000-0000-C000-000000000046}', 1, 3)
    tlib5 = WIN32OLE::TypeLib.new("C:\\WINNT\\SYSTEM32\\SHELL32.DLL")
    puts tlib1.name  # -> 'Microsoft Excel 9.0 Object Library'
    puts tlib2.name  # -> 'Microsoft Excel 9.0 Object Library'
    puts tlib3.name  # -> 'Microsoft Excel 9.0 Object Library'
    puts tlib4.name  # -> 'Microsoft Excel 9.0 Object Library'
    puts tlib5.name  # -> 'Microsoft Shell Controls And Automation'

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns the type library name with class name.

    tlib = WIN32OLE::TypeLib.new('Microsoft Excel 9.0 Object Library')
    tlib.inspect # => "<#WIN32OLE::TypeLib:Microsoft Excel 9.0 Object Library>"

**@overload** [] 

## library_name() [](#method-i-library_name)
Returns library name. If the method fails to access library name,
WIN32OLE::RuntimeError is raised.

    tlib = WIN32OLE::TypeLib.new('Microsoft Excel 9.0 Object Library')
    tlib.library_name # => Excel

**@overload** [] 

## major_version() [](#method-i-major_version)
Returns the type library major version.

    tlib = WIN32OLE::TypeLib.new('Microsoft Excel 9.0 Object Library')
    puts tlib.major_version # -> 1

**@overload** [] 

## minor_version() [](#method-i-minor_version)
Returns the type library minor version.

    tlib = WIN32OLE::TypeLib.new('Microsoft Excel 9.0 Object Library')
    puts tlib.minor_version # -> 3

**@overload** [] 

## name() [](#method-i-name)
Returns the type library name.

    tlib = WIN32OLE::TypeLib.new('Microsoft Excel 9.0 Object Library')
    name = tlib.name # -> 'Microsoft Excel 9.0 Object Library'

**@overload** [] 

## ole_types() [](#method-i-ole_types)
Returns the type library file path.

    tlib = WIN32OLE::TypeLib.new('Microsoft Excel 9.0 Object Library')
    classes = tlib.ole_types.collect{|k| k.name} # -> ['AddIn', 'AddIns' ...]

**@overload** [] 

## path() [](#method-i-path)
Returns the type library file path.

    tlib = WIN32OLE::TypeLib.new('Microsoft Excel 9.0 Object Library')
    puts tlib.path #-> 'C:\...\EXCEL9.OLB'

**@overload** [] 

## version() [](#method-i-version)
Returns the type library version.

    tlib = WIN32OLE::TypeLib.new('Microsoft Excel 9.0 Object Library')
    puts tlib.version #-> "1.3"

**@overload** [] 

## visible?() [](#method-i-visible?)
Returns true if the type library information is not hidden. If wLibFlags of
TLIBATTR is 0 or LIBFLAG_FRESTRICTED or LIBFLAG_FHIDDEN, the method returns
false, otherwise, returns true. If the method fails to access the TLIBATTR
information, then WIN32OLE::RuntimeError is raised.

    tlib = WIN32OLE::TypeLib.new('Microsoft Excel 9.0 Object Library')
    tlib.visible? # => true

**@overload** [] 

**@return** [Boolean] 

