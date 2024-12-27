# Module: RDoc::Encoding
    

This class is a wrapper around File IO and Encoding that helps RDoc load files
and convert them to the correct encoding.


# Class Methods
## change_encoding(text , encoding ) [](#method-c-change_encoding)
Changes encoding based on `encoding` without converting and returns new string
## detect_encoding(string ) [](#method-c-detect_encoding)
Detects the encoding of `string` based on the magic comment
## read_file(filename , encoding , force_transcode false) [](#method-c-read_file)
Reads the contents of `filename` and handles any encoding directives in the
file.

The content will be converted to the `encoding`.  If the file cannot be
converted a warning will be printed and nil will be returned.

If `force_transcode` is true the document will be transcoded and any unknown
character in the target encoding will be replaced with '?'
## remove_magic_comment(string ) [](#method-c-remove_magic_comment)
Removes magic comments and shebang

