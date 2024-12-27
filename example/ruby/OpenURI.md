# Module: OpenURI
    

OpenURI is an easy-to-use wrapper for Net::HTTP, Net::HTTPS and Net::FTP.

## Example

It is possible to open an http, https or ftp URL as though it were a file:

    URI.open("http://www.ruby-lang.org/") {|f|
      f.each_line {|line| p line}
    }

The opened file has several getter methods for its meta-information, as
follows, since it is extended by OpenURI::Meta.

    URI.open("http://www.ruby-lang.org/en") {|f|
      f.each_line {|line| p line}
      p f.base_uri         # <URI::HTTP:0x40e6ef2 URL:http://www.ruby-lang.org/en/>
      p f.content_type     # "text/html"
      p f.charset          # "iso-8859-1"
      p f.content_encoding # []
      p f.last_modified    # Thu Dec 05 02:45:02 UTC 2002
    }

Additional header fields can be specified by an optional hash argument.

    URI.open("http://www.ruby-lang.org/en/",
      "User-Agent" => "Ruby/#{RUBY_VERSION}",
      "From" => "foo@bar.invalid",
      "Referer" => "http://www.ruby-lang.org/") {|f|
      # ...
    }

The environment variables such as http_proxy, https_proxy and ftp_proxy are in
effect by default. Here we disable proxy:

    URI.open("http://www.ruby-lang.org/en/", :proxy => nil) {|f|
      # ...
    }

See OpenURI::OpenRead.open and URI.open for more on available options.

URI objects can be opened in a similar way.

    uri = URI.parse("http://www.ruby-lang.org/en/")
    uri.open {|f|
      # ...
    }

URI objects can be read directly. The returned string is also extended by
OpenURI::Meta.

    str = uri.read
    p str.base_uri

Author
:   Tanaka Akira <akr@m17n.org>



# Class Methods
## check_options(options ) [](#method-c-check_options)
:nodoc:
## open_http(buf , target , proxy , options ) [](#method-c-open_http)
:nodoc:
## open_loop(uri , options ) [](#method-c-open_loop)
:nodoc:
## open_uri(name , *rest ) [](#method-c-open_uri)
:nodoc:
**@raise** [ArgumentError] 

## redirectable?(uri1 , uri2 ) [](#method-c-redirectable?)
:nodoc:
**@return** [Boolean] 

## scan_open_optional_arguments(*rest ) [](#method-c-scan_open_optional_arguments)
:nodoc:

