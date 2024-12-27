# Class: WIN32OLE::Type
**Inherits:** Object
    

`WIN32OLE::Type` objects represent OLE type library information.


# Class Methods
## ole_classes(typelib ) [](#method-c-ole_classes)
Returns array of WIN32OLE::Type objects defined by the *typelib* type library.

This method will be OBSOLETE. Use `WIN32OLE::TypeLib.new(typelib).ole_classes`
instead.
**@overload** [] 

## progids() [](#method-c-progids)
Returns array of ProgID.
**@overload** [] 

## typelibs() [](#method-c-typelibs)
Returns array of type libraries.

This method will be OBSOLETE. Use `WIN32OLE::TypeLib.typelibs.collect{|t|
t.name}` instead.
**@overload** [] 


#Instance Methods
## default_event_sources() [](#method-i-default_event_sources)
Returns the array of WIN32OLE::Type object which is implemented by the
WIN32OLE::Type object and having IMPLTYPEFLAG_FSOURCE and
IMPLTYPEFLAG_FDEFAULT.
    tobj = WIN32OLE::Type.new('Microsoft Internet Controls', "InternetExplorer")
    p tobj.default_event_sources  # => [#<WIN32OLE::Type:DWebBrowserEvents2>]

**@overload** [] 

## default_ole_types() [](#method-i-default_ole_types)
Returns the array of WIN32OLE::Type object which is implemented by the
WIN32OLE::Type object and having IMPLTYPEFLAG_FDEFAULT.
    tobj = WIN32OLE::Type.new('Microsoft Internet Controls', "InternetExplorer")
    p tobj.default_ole_types
    # => [#<WIN32OLE::Type:IWebBrowser2>, #<WIN32OLE::Type:DWebBrowserEvents2>]

**@overload** [] 

## guid() [](#method-i-guid)
Returns GUID.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Application')
    puts tobj.guid  # => {00024500-0000-0000-C000-000000000046}

## helpcontext() [](#method-i-helpcontext)
Returns helpcontext. If helpcontext is not found, then returns nil.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Worksheet')
    puts tobj.helpfile # => 131185

**@overload** [] 

## helpfile() [](#method-i-helpfile)
Returns helpfile path. If helpfile is not found, then returns nil.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Worksheet')
    puts tobj.helpfile # => C:\...\VBAXL9.CHM

**@overload** [] 

## helpstring() [](#method-i-helpstring)
Returns help string.
    tobj = WIN32OLE::Type.new('Microsoft Internet Controls', 'IWebBrowser')
    puts tobj.helpstring # => Web Browser interface

## implemented_ole_types() [](#method-i-implemented_ole_types)
Returns the array of WIN32OLE::Type object which is implemented by the
WIN32OLE::Type object.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Worksheet')
    p tobj.implemented_ole_types # => [_Worksheet, DocEvents]

**@overload** [] 

## initialize(typelib, oleclass) [](#method-i-initialize)
Returns a new WIN32OLE::Type object. The first argument *typelib* specifies
OLE type library name. The second argument specifies OLE class name.

    WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Application')
        # => WIN32OLE::Type object of Application class of Excel.

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns the type name with class name.

    ie = WIN32OLE.new('InternetExplorer.Application')
    ie.ole_type.inspect => #<WIN32OLE::Type:IWebBrowser2>

**@overload** [] 

## major_version() [](#method-i-major_version)
Returns major version.
    tobj = WIN32OLE::Type.new('Microsoft Word 10.0 Object Library', 'Documents')
    puts tobj.major_version # => 8

**@overload** [] 

## minor_version() [](#method-i-minor_version)
Returns minor version.
    tobj = WIN32OLE::Type.new('Microsoft Word 10.0 Object Library', 'Documents')
    puts tobj.minor_version # => 2

## name() [](#method-i-name)
Returns OLE type name.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Application')
    puts tobj.name  # => Application

## ole_methods() [](#method-i-ole_methods)
Returns array of WIN32OLE::Method objects which represent OLE method defined
in OLE type library.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Worksheet')
    methods = tobj.ole_methods.collect{|m|
      m.name
    }
    # => ['Activate', 'Copy', 'Delete',....]

## ole_type() [](#method-i-ole_type)
returns type of OLE class.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Application')
    puts tobj.ole_type  # => Class

## ole_typelib() [](#method-i-ole_typelib)
Returns the WIN32OLE::TypeLib object which is including the WIN32OLE::Type
object. If it is not found, then returns nil.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Worksheet')
    puts tobj.ole_typelib # => 'Microsoft Excel 9.0 Object Library'

**@overload** [] 

## progid() [](#method-i-progid)
Returns ProgID if it exists. If not found, then returns nil.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Application')
    puts tobj.progid  # =>   Excel.Application.9

## source_ole_types() [](#method-i-source_ole_types)
Returns the array of WIN32OLE::Type object which is implemented by the
WIN32OLE::Type object and having IMPLTYPEFLAG_FSOURCE.
    tobj = WIN32OLE::Type.new('Microsoft Internet Controls', "InternetExplorer")
    p tobj.source_ole_types
    # => [#<WIN32OLE::Type:DWebBrowserEvents2>, #<WIN32OLE::Type:DWebBrowserEvents>]

**@overload** [] 

## src_type() [](#method-i-src_type)
Returns source class when the OLE class is 'Alias'.
    tobj =  WIN32OLE::Type.new('Microsoft Office 9.0 Object Library', 'MsoRGBType')
    puts tobj.src_type # => I4

## typekind() [](#method-i-typekind)
Returns number which represents type.
    tobj = WIN32OLE::Type.new('Microsoft Word 10.0 Object Library', 'Documents')
    puts tobj.typekind # => 4

## variables() [](#method-i-variables)
Returns array of WIN32OLE::Variable objects which represent variables defined
in OLE class.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'XlSheetType')
    vars = tobj.variables
    vars.each do |v|
      puts "#{v.name} = #{v.value}"
    end

    The result of above sample script is follows:
      xlChart = -4109
      xlDialogSheet = -4116
      xlExcel4IntlMacroSheet = 4
      xlExcel4MacroSheet = 3
      xlWorksheet = -4167

**@overload** [] 

## visible?() [](#method-i-visible?)
Returns true if the OLE class is public.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Application')
    puts tobj.visible  # => true

**@overload** [] 

**@return** [Boolean] 

