# Class: WIN32OLE::Record
**Inherits:** Object
    

`WIN32OLE::Record` objects represents VT_RECORD OLE variant.
    Win32OLE returns WIN32OLE::Record object if the result value of invoking
    OLE methods.

    If COM server in VB.NET ComServer project is the following:

      Imports System.Runtime.InteropServices
      Public Class ComClass
          Public Structure Book
              <MarshalAs(UnmanagedType.BStr)> _
              Public title As String
              Public cost As Integer
          End Structure
          Public Function getBook() As Book
              Dim book As New Book
              book.title = "The Ruby Book"
              book.cost = 20
              Return book
          End Function
      End Class

    then, you can retrieve getBook return value from the following
    Ruby script:

      require 'win32ole'
      obj = WIN32OLE.new('ComServer.ComClass')
      book = obj.getBook
      book.class # => WIN32OLE::Record
      book.title # => "The Ruby Book"
      book.cost  # => 20



#Instance Methods
## initialize(typename, oleobj) [](#method-i-initialize)
Returns WIN32OLE::Record object. The first argument is struct name (String or
Symbol). The second parameter obj should be WIN32OLE object or
WIN32OLE::TypeLib object. If COM server in VB.NET ComServer project is the
following:

    Imports System.Runtime.InteropServices
    Public Class ComClass
        Public Structure Book
            <MarshalAs(UnmanagedType.BStr)> _
            Public title As String
            Public cost As Integer
        End Structure
    End Class

then, you can create WIN32OLE::Record object is as following:

    require 'win32ole'
    obj = WIN32OLE.new('ComServer.ComClass')
    book1 = WIN32OLE::Record.new('Book', obj) # => WIN32OLE::Record object
    tlib = obj.ole_typelib
    book2 = WIN32OLE::Record.new('Book', tlib) # => WIN32OLE::Record object

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns the OLE struct name and member name and the value of member

If COM server in VB.NET ComServer project is the following:

    Imports System.Runtime.InteropServices
    Public Class ComClass
        <MarshalAs(UnmanagedType.BStr)> _
        Public title As String
        Public cost As Integer
    End Class

then

    srver = WIN32OLE.new('ComServer.ComClass')
    obj = WIN32OLE::Record.new('Book', server)
    obj.inspect # => <WIN32OLE::Record(ComClass) {"title" => nil, "cost" => nil}>

**@overload** [] 

## method_missing(*args) [](#method-i-method_missing)
Returns value specified by the member name of VT_RECORD OLE variable. Or sets
value specified by the member name of VT_RECORD OLE variable. If the member
name is not correct, KeyError exception is raised.

If COM server in VB.NET ComServer project is the following:

    Imports System.Runtime.InteropServices
    Public Class ComClass
        Public Structure Book
            <MarshalAs(UnmanagedType.BStr)> _
            Public title As String
            Public cost As Integer
        End Structure
    End Class

Then getting/setting value from Ruby is as the following:

    obj = WIN32OLE.new('ComServer.ComClass')
    book = WIN32OLE::Record.new('Book', obj)
    book.title # => nil ( book.method_missing(:title) is invoked. )
    book.title = "Ruby" # ( book.method_missing(:title=, "Ruby") is invoked. )

**@overload** [] 

## ole_instance_variable_get(name) [](#method-i-ole_instance_variable_get)
Returns value specified by the member name of VT_RECORD OLE object. If the
member name is not correct, KeyError exception is raised. If you can't access
member variable of VT_RECORD OLE object directly, use this method.

If COM server in VB.NET ComServer project is the following:

    Imports System.Runtime.InteropServices
    Public Class ComClass
        Public Structure ComObject
            Public object_id As Ineger
        End Structure
    End Class

and Ruby Object class has title attribute:

then accessing object_id of ComObject from Ruby is as the following:

    srver = WIN32OLE.new('ComServer.ComClass')
    obj = WIN32OLE::Record.new('ComObject', server)
    # obj.object_id returns Ruby Object#object_id
    obj.ole_instance_variable_get(:object_id) # => nil

**@overload** [] 

## ole_instance_variable_set(name, val) [](#method-i-ole_instance_variable_set)
Sets value specified by the member name of VT_RECORD OLE object. If the member
name is not correct, KeyError exception is raised. If you can't set value of
member of VT_RECORD OLE object directly, use this method.

If COM server in VB.NET ComServer project is the following:

    Imports System.Runtime.InteropServices
    Public Class ComClass
        <MarshalAs(UnmanagedType.BStr)> _
        Public title As String
        Public cost As Integer
    End Class

then setting value of the `title' member is as following:

    srver = WIN32OLE.new('ComServer.ComClass')
    obj = WIN32OLE::Record.new('Book', server)
    obj.ole_instance_variable_set(:title, "The Ruby Book")

**@overload** [] 

## to_h() [](#method-i-to_h)
Returns Ruby Hash object which represents VT_RECORD variable. The keys of Hash
object are member names of VT_RECORD OLE variable and the values of Hash
object are values of VT_RECORD OLE variable.

If COM server in VB.NET ComServer project is the following:

    Imports System.Runtime.InteropServices
    Public Class ComClass
        Public Structure Book
            <MarshalAs(UnmanagedType.BStr)> _
            Public title As String
            Public cost As Integer
        End Structure
        Public Function getBook() As Book
            Dim book As New Book
            book.title = "The Ruby Book"
            book.cost = 20
            Return book
        End Function
    End Class

then, the result of WIN32OLE::Record#to_h is the following:

    require 'win32ole'
    obj = WIN32OLE.new('ComServer.ComClass')
    book = obj.getBook
    book.to_h # => {"title"=>"The Ruby Book", "cost"=>20}

**@overload** [] 

## typename() [](#method-i-typename)
Returns the type name of VT_RECORD OLE variable.

If COM server in VB.NET ComServer project is the following:

    Imports System.Runtime.InteropServices
    Public Class ComClass
        Public Structure Book
            <MarshalAs(UnmanagedType.BStr)> _
            Public title As String
            Public cost As Integer
        End Structure
        Public Function getBook() As Book
            Dim book As New Book
            book.title = "The Ruby Book"
            book.cost = 20
            Return book
        End Function
    End Class

then, the result of WIN32OLE::Record#typename is the following:

    require 'win32ole'
    obj = WIN32OLE.new('ComServer.ComClass')
    book = obj.getBook
    book.typename # => "Book"

