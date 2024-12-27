# Class: WIN32OLE::Method
**Inherits:** Object
    

`WIN32OLE::Method` objects represent OLE method information.



#Instance Methods
## dispid() [](#method-i-dispid)
Returns dispatch ID.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE::Method.new(tobj, 'Add')
    puts method.dispid # => 181

**@overload** [] 

## event?() [](#method-i-event?)
Returns true if the method is event.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SheetActivate')
    puts method.event? # => true

**@overload** [] 

**@return** [Boolean] 

## event_interface() [](#method-i-event_interface)
Returns event interface name if the method is event.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SheetActivate')
    puts method.event_interface # =>  WorkbookEvents

**@overload** [] 

## helpcontext() [](#method-i-helpcontext)
Returns help context.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE::Method.new(tobj, 'Add')
    puts method.helpcontext # => 65717

**@overload** [] 

## helpfile() [](#method-i-helpfile)
Returns help file. If help file is not found, then the method returns nil.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE::Method.new(tobj, 'Add')
    puts method.helpfile # => C:\...\VBAXL9.CHM

**@overload** [] 

## helpstring() [](#method-i-helpstring)
Returns help string of OLE method. If the help string is not found, then the
method returns nil.
    tobj = WIN32OLE::Type.new('Microsoft Internet Controls', 'IWebBrowser')
    method = WIN32OLE::Method.new(tobj, 'Navigate')
    puts method.helpstring # => Navigates to a URL or file.

**@overload** [] 

## initialize(oletype, method) [](#method-i-initialize)
Returns a new WIN32OLE::Method object which represents the information about
OLE method. The first argument *ole_type* specifies WIN32OLE::Type object. The
second argument *method* specifies OLE method name defined OLE class which
represents WIN32OLE::Type object.

    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SaveAs')

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns the method name with class name.

**@overload** [] 

## invkind() [](#method-i-invkind)
Returns the method invoke kind.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE::Method.new(tobj, 'Add')
    puts method.invkind # => 1

**@overload** [] 

## invoke_kind() [](#method-i-invoke_kind)
Returns the method kind string. The string is "UNKNOWN" or "PROPERTY" or
"PROPERTY" or "PROPERTYGET" or "PROPERTYPUT" or "PROPERTYPPUTREF" or "FUNC".
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE::Method.new(tobj, 'Add')
    puts method.invoke_kind # => "FUNC"

**@overload** [] 

## name() [](#method-i-name)
Returns the name of the method.

    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SaveAs')
    puts method.name # => SaveAs

**@overload** [] 

## offset_vtbl() [](#method-i-offset_vtbl)
Returns the offset ov VTBL.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE::Method.new(tobj, 'Add')
    puts method.offset_vtbl # => 40

**@overload** [] 

## params() [](#method-i-params)
returns array of WIN32OLE::Param object corresponding with method parameters.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SaveAs')
    p method.params # => [Filename, FileFormat, Password, WriteResPassword,
                          ReadOnlyRecommended, CreateBackup, AccessMode,
                          ConflictResolution, AddToMru, TextCodepage,
                          TextVisualLayout]

**@overload** [] 

## return_type() [](#method-i-return_type)
Returns string of return value type of method.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE::Method.new(tobj, 'Add')
    puts method.return_type # => Workbook

**@overload** [] 

## return_type_detail() [](#method-i-return_type_detail)
Returns detail information of return value type of method. The information is
array.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE::Method.new(tobj, 'Add')
    p method.return_type_detail # => ["PTR", "USERDEFINED", "Workbook"]

**@overload** [] 

## return_vtype() [](#method-i-return_vtype)
Returns number of return value type of method.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE::Method.new(tobj, 'Add')
    puts method.return_vtype # => 26

**@overload** [] 

## size_opt_params() [](#method-i-size_opt_params)
Returns the size of optional parameters.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SaveAs')
    puts method.size_opt_params # => 4

**@overload** [] 

## size_params() [](#method-i-size_params)
Returns the size of arguments of the method.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SaveAs')
    puts method.size_params # => 11

**@overload** [] 

## visible?() [](#method-i-visible?)
Returns true if the method is public.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE::Method.new(tobj, 'Add')
    puts method.visible? # => true

**@overload** [] 

**@return** [Boolean] 

