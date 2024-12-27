# Class: WIN32OLE::Param
**Inherits:** Object
    

`WIN32OLE::Param` objects represent param information of
    the OLE method.



#Instance Methods
## default() [](#method-i-default)
Returns default value. If the default value does not exist, this method
returns nil.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SaveAs')
    method.params.each do |param|
      if param.default
        puts "#{param.name} (= #{param.default})"
      else
        puts "#{param}"
      end
    end

The above script result is following:
    Filename
    FileFormat
    Password
    WriteResPassword
    ReadOnlyRecommended
    CreateBackup
    AccessMode (= 1)
    ConflictResolution
    AddToMru
    TextCodepage
    TextVisualLayout

**@overload** [] 

## initialize(olemethod, n) [](#method-i-initialize)
Returns WIN32OLE::Param object which represents OLE parameter information. 1st
argument should be WIN32OLE::Method object. 2nd argument `n' is n-th parameter
of the method specified by 1st argument.

    tobj = WIN32OLE::Type.new('Microsoft Scripting Runtime', 'IFileSystem')
    method = WIN32OLE::Method.new(tobj, 'CreateTextFile')
    param = WIN32OLE::Param.new(method, 2) # => #<WIN32OLE::Param:Overwrite=true>

**@overload** [] 

## input?() [](#method-i-input?)
Returns true if the parameter is input.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SaveAs')
    param1 = method.params[0]
    puts param1.input? # => true

**@overload** [] 

**@return** [Boolean] 

## inspect() [](#method-i-inspect)
Returns the parameter name with class name. If the parameter has default
value, then returns name=value string with class name.

**@overload** [] 

## name() [](#method-i-name)
Returns name.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SaveAs')
    param1 = method.params[0]
    puts param1.name # => Filename

**@overload** [] 

## ole_type() [](#method-i-ole_type)
Returns OLE type of WIN32OLE::Param object(parameter of OLE method).
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SaveAs')
    param1 = method.params[0]
    puts param1.ole_type # => VARIANT

**@overload** [] 

## ole_type_detail() [](#method-i-ole_type_detail)
Returns detail information of type of argument.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'IWorksheetFunction')
    method = WIN32OLE::Method.new(tobj, 'SumIf')
    param1 = method.params[0]
    p param1.ole_type_detail # => ["PTR", "USERDEFINED", "Range"]

**@overload** [] 

## optional?() [](#method-i-optional?)
Returns true if argument is optional.
    tobj = WIN32OLE::Type.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE::Method.new(tobj, 'SaveAs')
    param1 = method.params[0]
    puts "#{param1.name} #{param1.optional?}" # => Filename true

**@overload** [] 

**@return** [Boolean] 

## output?() [](#method-i-output?)
Returns true if argument is output.
    tobj = WIN32OLE::Type.new('Microsoft Internet Controls', 'DWebBrowserEvents')
    method = WIN32OLE::Method.new(tobj, 'NewWindow')
    method.params.each do |param|
      puts "#{param.name} #{param.output?}"
    end

The result of above script is following:
    URL false
    Flags false
    TargetFrameName false
    PostData false
    Headers false
    Processed true

**@overload** [] 

**@return** [Boolean] 

## retval?() [](#method-i-retval?)
Returns true if argument is return value.
    tobj = WIN32OLE::Type.new('DirectX 7 for Visual Basic Type Library',
                              'DirectPlayLobbyConnection')
    method = WIN32OLE::Method.new(tobj, 'GetPlayerShortName')
    param = method.params[0]
    puts "#{param.name} #{param.retval?}"  # => name true

**@overload** [] 

**@return** [Boolean] 

