# Class: MultiPart
**Inherits:** Object
    

usage:
    boundary = 'foobar1234'  # or nil
    multipart = MultiPart.new(boundary)
    multipart.append('name1', 'value1')
    multipart.append('file1', File.read('file1.html'), 'file1.html')
    str = multipart.close()
    str.each_line {|line| p line }
    ## output:
    # "--foobar1234\r\n"
    # "Content-Disposition: form-data: name=\"name1\"\r\n"
    # "\r\n"
    # "value1\r\n"
    # "--foobar1234\r\n"
    # "Content-Disposition: form-data: name=\"file1\"; filename=\"file1.html\"\r\n"
    # "Content-Type: text/html\r\n"
    # "\r\n"
    # "<html>\n"
    # "<body><p>Hello</p></body>\n"
    # "</html>\n"
    # "\r\n"
    # "--foobar1234--\r\n"


# Attributes
## boundary[RW] [](#attribute-i-boundary)
Returns the value of attribute boundary.


#Instance Methods
## append(name, value, filenamenil, content_typenil) [](#method-i-append)

## close() [](#method-i-close)

## create_boundary() [](#method-i-create_boundary)
:nodoc:

## detect_content_type(filename) [](#method-i-detect_content_type)
:nodoc:

## initialize(boundarynil) [](#method-i-initialize)

**@return** [MultiPart] a new instance of MultiPart

