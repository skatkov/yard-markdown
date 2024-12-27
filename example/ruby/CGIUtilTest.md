# Class: CGIUtilTest
**Inherits:** Test::Unit::TestCase
    
**Includes:** CGI::Util, CGIUtilTest::UnescapeHTMLTests, UpdateEnv
  




#Instance Methods
## assert_cgi_escape_html_preserve_encoding(str, encoding) [](#method-i-assert_cgi_escape_html_preserve_encoding)

## escape(string) [](#method-i-escape)
URL-encode a string into application/x-www-form-urlencoded. Space characters
(+" "+) are encoded with plus signs (+"+"+)
    url_encoded_string = CGI.escape("'Stop!' said Fred")
       # => "%27Stop%21%27+said+Fred"

## escapeElement(string, *elements) [](#method-i-escapeElement)
Escape only the tags of certain HTML elements in `string`.

Takes an element or elements or array of elements.  Each element is specified
by the name of the element, without angle brackets. This matches both the
start and the end tag of that element. The attribute list of the open tag will
also be escaped (for instance, the double-quotes surrounding attribute
values).

    print CGI.escapeElement('<BR><A HREF="url"></A>', "A", "IMG")
      # "<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt"

    print CGI.escapeElement('<BR><A HREF="url"></A>', ["A", "IMG"])
      # "<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt"

## escapeHTML(string) [](#method-i-escapeHTML)
Escape special characters in HTML, namely '&"<>
    CGI.escapeHTML('Usage: foo "bar" <baz>')
       # => "Usage: foo &quot;bar&quot; &lt;baz&gt;"

## escapeURIComponent(string) [](#method-i-escapeURIComponent)
URL-encode a string following RFC 3986 Space characters (+" "+) are encoded
with (+"%20"+)
    url_encoded_string = CGI.escapeURIComponent("'Stop!' said Fred")
       # => "%27Stop%21%27%20said%20Fred"

## pretty(string, shift"  ") [](#method-i-pretty)
Prettify (indent) an HTML string.

`string` is the HTML string to indent.  `shift` is the indentation unit to
use; it defaults to two spaces.

    print CGI.pretty("<HTML><BODY></BODY></HTML>")
      # <HTML>
      #   <BODY>
      #   </BODY>
      # </HTML>

    print CGI.pretty("<HTML><BODY></BODY></HTML>", "\t")
      # <HTML>
      #         <BODY>
      #         </BODY>
      # </HTML>

## rfc1123_date(time) [](#method-i-rfc1123_date)
Format a `Time` object as a String using the format specified by RFC 1123.

    CGI.rfc1123_date(Time.now)
      # Sat, 01 Jan 2000 00:00:00 GMT

## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## test_cgi_escape() [](#method-i-test_cgi_escape)

## test_cgi_escapeElement() [](#method-i-test_cgi_escapeElement)

## test_cgi_escapeHTML() [](#method-i-test_cgi_escapeHTML)

## test_cgi_escapeURIComponent() [](#method-i-test_cgi_escapeURIComponent)

## test_cgi_escapeURIComponent_preserve_encoding() [](#method-i-test_cgi_escapeURIComponent_preserve_encoding)

## test_cgi_escapeURIComponent_with_invalid_byte_sequence() [](#method-i-test_cgi_escapeURIComponent_with_invalid_byte_sequence)

## test_cgi_escapeURIComponent_with_unreserved_characters() [](#method-i-test_cgi_escapeURIComponent_with_unreserved_characters)

## test_cgi_escape_html_dont_freeze() [](#method-i-test_cgi_escape_html_dont_freeze)

## test_cgi_escape_html_duplicated() [](#method-i-test_cgi_escape_html_duplicated)

## test_cgi_escape_html_large() [](#method-i-test_cgi_escape_html_large)

## test_cgi_escape_html_preserve_encoding() [](#method-i-test_cgi_escape_html_preserve_encoding)

## test_cgi_escape_preserve_encoding() [](#method-i-test_cgi_escape_preserve_encoding)

## test_cgi_escape_uri_component() [](#method-i-test_cgi_escape_uri_component)

## test_cgi_escape_with_invalid_byte_sequence() [](#method-i-test_cgi_escape_with_invalid_byte_sequence)

## test_cgi_escape_with_unreserved_characters() [](#method-i-test_cgi_escape_with_unreserved_characters)

## test_cgi_include_escape() [](#method-i-test_cgi_include_escape)

## test_cgi_include_escapeHTML() [](#method-i-test_cgi_include_escapeHTML)

## test_cgi_include_h() [](#method-i-test_cgi_include_h)

## test_cgi_include_unescape() [](#method-i-test_cgi_include_unescape)

## test_cgi_include_unescapeHTML() [](#method-i-test_cgi_include_unescapeHTML)

## test_cgi_pretty() [](#method-i-test_cgi_pretty)

## test_cgi_unescape() [](#method-i-test_cgi_unescape)

## test_cgi_unescapeElement() [](#method-i-test_cgi_unescapeElement)

## test_cgi_unescapeHTML() [](#method-i-test_cgi_unescapeHTML)

## test_cgi_unescapeHTML_following_invalid_numeric() [](#method-i-test_cgi_unescapeHTML_following_invalid_numeric)

## test_cgi_unescapeHTML_following_known_first_letter() [](#method-i-test_cgi_unescapeHTML_following_known_first_letter)

## test_cgi_unescapeHTML_following_number_sign() [](#method-i-test_cgi_unescapeHTML_following_number_sign)

## test_cgi_unescapeHTML_invalid() [](#method-i-test_cgi_unescapeHTML_invalid)

## test_cgi_unescapeHTML_uppercasecharacter() [](#method-i-test_cgi_unescapeHTML_uppercasecharacter)

## test_cgi_unescapeURIComponent() [](#method-i-test_cgi_unescapeURIComponent)

## test_cgi_unescapeURIComponent_accept_charset() [](#method-i-test_cgi_unescapeURIComponent_accept_charset)

## test_cgi_unescapeURIComponent_preserve_encoding() [](#method-i-test_cgi_unescapeURIComponent_preserve_encoding)

## test_cgi_unescape_accept_charset() [](#method-i-test_cgi_unescape_accept_charset)

## test_cgi_unescape_preserve_encoding() [](#method-i-test_cgi_unescape_preserve_encoding)

## test_cgi_unescape_uri_component() [](#method-i-test_cgi_unescape_uri_component)

## unescape(string, encoding@@accept_charset) [](#method-i-unescape)
URL-decode an application/x-www-form-urlencoded string with
encoding(optional).
    string = CGI.unescape("%27Stop%21%27+said+Fred")
       # => "'Stop!' said Fred"

## unescapeElement(string, *elements) [](#method-i-unescapeElement)
Undo escaping such as that done by CGI.escapeElement()

    print CGI.unescapeElement(
            CGI.escapeHTML('<BR><A HREF="url"></A>'), "A", "IMG")
      # "&lt;BR&gt;<A HREF="url"></A>"

    print CGI.unescapeElement(
            CGI.escapeHTML('<BR><A HREF="url"></A>'), ["A", "IMG"])
      # "&lt;BR&gt;<A HREF="url"></A>"

## unescapeHTML(string) [](#method-i-unescapeHTML)
Unescape a string that has been HTML-escaped
    CGI.unescapeHTML("Usage: foo &quot;bar&quot; &lt;baz&gt;")
       # => "Usage: foo \"bar\" <baz>"

## unescapeURIComponent(string, encoding@@accept_charset) [](#method-i-unescapeURIComponent)
URL-decode a string following RFC 3986 with encoding(optional).
    string = CGI.unescapeURIComponent("%27Stop%21%27+said%20Fred")
       # => "'Stop!'+said Fred"

## update_env(environ) [](#method-i-update_env)

