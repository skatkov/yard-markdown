# Module: OpenURI::OpenRead
    

Mixin for HTTP and FTP URIs.



#Instance Methods
## open(*rest, &block) [](#method-i-open)
OpenURI::OpenRead#open provides `open' for URI::HTTP and URI::FTP.

OpenURI::OpenRead#open takes optional 3 arguments as:

    OpenURI::OpenRead#open([mode [, perm]] [, options]) [{|io| ... }]

OpenURI::OpenRead#open returns an IO-like object if block is not given.
Otherwise it yields the IO object and return the value of the block. The IO
object is extended with OpenURI::Meta.

`mode` and `perm` are the same as Kernel#open.

However, `mode` must be read mode because OpenURI::OpenRead#open doesn't
support write mode (yet). Also `perm` is ignored because it is meaningful only
for file creation.

`options` must be a hash.

Each option with a string key specifies an extra header field for HTTP. I.e.,
it is ignored for FTP without HTTP proxy.

The hash may include other options, where keys are symbols:

:proxy
:   Synopsis:
        :proxy => "http://proxy.foo.com:8000/"
        :proxy => URI.parse("http://proxy.foo.com:8000/")
        :proxy => true
        :proxy => false
        :proxy => nil

    If :proxy option is specified, the value should be String, URI, boolean or
    nil.

    When String or URI is given, it is treated as proxy URI.

    When true is given or the option itself is not specified, environment
    variable `scheme_proxy' is examined. `scheme' is replaced by `http',
    `https' or `ftp'.

    When false or nil is given, the environment variables are ignored and
    connection will be made to a server directly.


:proxy_http_basic_authentication
:   Synopsis:
        :proxy_http_basic_authentication =>
          ["http://proxy.foo.com:8000/", "proxy-user", "proxy-password"]
        :proxy_http_basic_authentication =>
          [URI.parse("http://proxy.foo.com:8000/"),
           "proxy-user", "proxy-password"]

    If :proxy option is specified, the value should be an Array with 3
    elements.  It should contain a proxy URI, a proxy user name and a proxy
    password.  The proxy URI should be a String, an URI or nil.  The proxy
    user name and password should be a String.

    If nil is given for the proxy URI, this option is just ignored.

    If :proxy and :proxy_http_basic_authentication is specified, ArgumentError
    is raised.


:http_basic_authentication
:   Synopsis:
        :http_basic_authentication=>[user, password]

    If :http_basic_authentication is specified, the value should be an array
    which contains 2 strings: username and password. It is used for HTTP Basic
    authentication defined by RFC 2617.


:content_length_proc
:   Synopsis:
        :content_length_proc => lambda {|content_length| ... }

    If :content_length_proc option is specified, the option value procedure is
    called before actual transfer is started. It takes one argument, which is
    expected content length in bytes.

    If two or more transfers are performed by HTTP redirection, the procedure
    is called only once for the last transfer.

    When expected content length is unknown, the procedure is called with nil.
     This happens when the HTTP response has no Content-Length header.


:progress_proc
:   Synopsis:
        :progress_proc => lambda {|size| ...}

    If :progress_proc option is specified, the proc is called with one
    argument each time when `open' gets content fragment from network. The
    argument `size` is the accumulated transferred size in bytes.

    If two or more transfer is done by HTTP redirection, the procedure is
    called only one for a last transfer.

    :progress_proc and :content_length_proc are intended to be used for
    progress bar. For example, it can be implemented as follows using
    Ruby/ProgressBar.

        pbar = nil
        open("http://...",
          :content_length_proc => lambda {|t|
            if t && 0 < t
              pbar = ProgressBar.new("...", t)
              pbar.file_transfer_mode
            end
          },
          :progress_proc => lambda {|s|
            pbar.set s if pbar
          }) {|f| ... }


:read_timeout
:   Synopsis:
        :read_timeout=>nil     (no timeout)
        :read_timeout=>10      (10 second)

    :read_timeout option specifies a timeout of read for http connections.


:open_timeout
:   Synopsis:
        :open_timeout=>nil     (no timeout)
        :open_timeout=>10      (10 second)

    :open_timeout option specifies a timeout of open for http connections.


:ssl_ca_cert
:   Synopsis:
        :ssl_ca_cert=>filename or an Array of filenames

    :ssl_ca_cert is used to specify CA certificate for SSL. If it is given,
    default certificates are not used.


:ssl_verify_mode
:   Synopsis:
        :ssl_verify_mode=>mode

    :ssl_verify_mode is used to specify openssl verify mode.


:ssl_min_version
:   Synopsis:
        :ssl_min_version=>:TLS1_2

    :ssl_min_version option specifies the minimum allowed SSL/TLS protocol
    version.  See also OpenSSL::SSL::SSLContext#min_version=.


:ssl_max_version
:   Synopsis:
        :ssl_max_version=>:TLS1_2

    :ssl_max_version option specifies the maximum allowed SSL/TLS protocol
    version.  See also OpenSSL::SSL::SSLContext#max_version=.


:ftp_active_mode
:   Synopsis:
        :ftp_active_mode=>bool

    `:ftp_active_mode => true` is used to make ftp active mode. Ruby 1.9 uses
    passive mode by default. Note that the active mode is default in Ruby 1.8
    or prior.


:redirect
:   Synopsis:
        :redirect=>bool

    `:redirect` is true by default.  `:redirect => false` is used to disable
    all HTTP redirects.

    OpenURI::HTTPRedirect exception raised on redirection. Using `true` also
    means that redirections between http and ftp are permitted.


:max_redirects
:   Synopsis:
        :max_redirects=>int

    Number of HTTP redirects allowed before OpenURI::TooManyRedirects is
    raised. The default is 64.


:request_specific_fields
:   Synopsis:
        :request_specific_fields => {}
        :request_specific_fields => lambda {|url| ...}

    :request_specific_fields option allows specifying custom header fields
    that are sent with the HTTP request. It can be passed as a Hash or a Proc
    that gets evaluated on each request and returns a Hash of header fields.

    If a Hash is provided, it specifies the headers only for the initial
    request and these headers will not be sent on redirects.

    If a Proc is provided, it will be executed for each request including
    redirects, allowing dynamic header customization based on the request URL.
    It is important that the Proc returns a Hash. And this Hash specifies the
    headers to be sent with the request.

    For Example with Hash
        URI.open("http://...",
                 request_specific_fields: {"Authorization" => "token dummy"}) {|f| ... }

    For Example with Proc:
        URI.open("http://...",
                 request_specific_fields: lambda { |uri|
                   if uri.host == "example.com"
                     {"Authorization" => "token dummy"}
                   else
                     {}
                   end
                 }) {|f| ... }


## read(options{}) [](#method-i-read)
OpenURI::OpenRead#read([ options ]) reads a content referenced by self and
returns the content as string. The string is extended with OpenURI::Meta. The
argument `options` is same as OpenURI::OpenRead#open.

