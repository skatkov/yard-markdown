# Class: CGI::HTML4Tr
**Inherits:** Object
    
**Includes:** CGI::Html4Tr, CGI::HtmlExtension
  




#Instance Methods
## a(href"") [](#method-i-a)
Generate an Anchor element as a string.

`href` can either be a string, giving the URL for the HREF attribute, or it
can be a hash of the element's attributes.

The body of the element is the string returned by the no-argument block passed
in.

    a("http://www.example.com") { "Example" }
      # => "<A HREF=\"http://www.example.com\">Example</A>"

    a("HREF" => "http://www.example.com", "TARGET" => "_top") { "Example" }
      # => "<A HREF=\"http://www.example.com\" TARGET=\"_top\">Example</A>"

## base(href"") [](#method-i-base)
Generate a Document Base URI element as a String.

`href` can either by a string, giving the base URL for the HREF attribute, or
it can be a has of the element's attributes.

The passed-in no-argument block is ignored.

    base("http://www.example.com/cgi")
      # => "<BASE HREF=\"http://www.example.com/cgi\">"

## blockquote(cite{}) [](#method-i-blockquote)
Generate a BlockQuote element as a string.

`cite` can either be a string, give the URI for the source of the quoted text,
or a hash, giving all attributes of the element, or it can be omitted, in
which case the element has no attributes.

The body is provided by the passed-in no-argument block

    blockquote("http://www.example.com/quotes/foo.html") { "Foo!" }
      #=> "<BLOCKQUOTE CITE=\"http://www.example.com/quotes/foo.html\">Foo!</BLOCKQUOTE>

## caption(align{}) [](#method-i-caption)
Generate a Table Caption element as a string.

`align` can be a string, giving the alignment of the caption (one of top,
bottom, left, or right).  It can be a hash of all the attributes of the
element.  Or it can be omitted.

The body of the element is provided by the passed-in no-argument block.

    caption("left") { "Capital Cities" }
      # => <CAPTION ALIGN=\"left\">Capital Cities</CAPTION>

## checkbox(name"", valuenil, checkednil) [](#method-i-checkbox)
Generate a Checkbox Input element as a string.

The attributes of the element can be specified as three arguments, `name`,
`value`, and `checked`.  `checked` is a boolean value; if true, the CHECKED
attribute will be included in the element.

Alternatively, the attributes can be specified as a hash.

    checkbox("name")
      # = checkbox("NAME" => "name")

    checkbox("name", "value")
      # = checkbox("NAME" => "name", "VALUE" => "value")

    checkbox("name", "value", true)
      # = checkbox("NAME" => "name", "VALUE" => "value", "CHECKED" => true)

## checkbox_group(name"", *values) [](#method-i-checkbox_group)
Generate a sequence of checkbox elements, as a String.

The checkboxes will all have the same `name` attribute. Each checkbox is
followed by a label. There will be one checkbox for each value.  Each value
can be specified as a String, which will be used both as the value of the
VALUE attribute and as the label for that checkbox.  A single-element array
has the same effect.

Each value can also be specified as a three-element array. The first element
is the VALUE attribute; the second is the label; and the third is a boolean
specifying whether this checkbox is CHECKED.

Each value can also be specified as a two-element array, by omitting either
the value element (defaults to the same as the label), or the boolean checked
element (defaults to false).

    checkbox_group("name", "foo", "bar", "baz")
      # <INPUT TYPE="checkbox" NAME="name" VALUE="foo">foo
      # <INPUT TYPE="checkbox" NAME="name" VALUE="bar">bar
      # <INPUT TYPE="checkbox" NAME="name" VALUE="baz">baz

    checkbox_group("name", ["foo"], ["bar", true], "baz")
      # <INPUT TYPE="checkbox" NAME="name" VALUE="foo">foo
      # <INPUT TYPE="checkbox" CHECKED NAME="name" VALUE="bar">bar
      # <INPUT TYPE="checkbox" NAME="name" VALUE="baz">baz

    checkbox_group("name", ["1", "Foo"], ["2", "Bar", true], "Baz")
      # <INPUT TYPE="checkbox" NAME="name" VALUE="1">Foo
      # <INPUT TYPE="checkbox" CHECKED NAME="name" VALUE="2">Bar
      # <INPUT TYPE="checkbox" NAME="name" VALUE="Baz">Baz

    checkbox_group("NAME" => "name",
                     "VALUES" => ["foo", "bar", "baz"])

    checkbox_group("NAME" => "name",
                     "VALUES" => [["foo"], ["bar", true], "baz"])

    checkbox_group("NAME" => "name",
                     "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"])

## doctype() [](#method-i-doctype)
The DOCTYPE declaration for this version of HTML

## file_field(name"", size20, maxlengthnil) [](#method-i-file_field)
Generate an File Upload Input element as a string.

The attributes of the element can be specified as three arguments, `name`,
`size`, and `maxlength`.  `maxlength` is the maximum length of the file's
*name*, not of the file's *contents*.

Alternatively, the attributes can be specified as a hash.

See #multipart_form() for forms that include file uploads.

    file_field("name")
      # <INPUT TYPE="file" NAME="name" SIZE="20">

    file_field("name", 40)
      # <INPUT TYPE="file" NAME="name" SIZE="40">

    file_field("name", 40, 100)
      # <INPUT TYPE="file" NAME="name" SIZE="40" MAXLENGTH="100">

    file_field("NAME" => "name", "SIZE" => 40)
      # <INPUT TYPE="file" NAME="name" SIZE="40">

## form(method"post", actionscript_name, enctype"application/x-www-form-urlencoded") [](#method-i-form)
Generate a Form element as a string.

`method` should be either "get" or "post", and defaults to the latter.
`action` defaults to the current CGI script name.  `enctype` defaults to
"application/x-www-form-urlencoded".

Alternatively, the attributes can be specified as a hash.

See also #multipart_form() for forms that include file uploads.

    form{ "string" }
      # <FORM METHOD="post" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

    form("get") { "string" }
      # <FORM METHOD="get" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

    form("get", "url") { "string" }
      # <FORM METHOD="get" ACTION="url" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

    form("METHOD" => "post", "ENCTYPE" => "enctype") { "string" }
      # <FORM METHOD="post" ENCTYPE="enctype">string</FORM>

## hidden(name"", valuenil) [](#method-i-hidden)
Generate a Hidden Input element as a string.

The attributes of the element can be specified as two arguments, `name` and
`value`.

Alternatively, the attributes can be specified as a hash.

    hidden("name")
      # <INPUT TYPE="hidden" NAME="name">

    hidden("name", "value")
      # <INPUT TYPE="hidden" NAME="name" VALUE="value">

    hidden("NAME" => "name", "VALUE" => "reset", "ID" => "foo")
      # <INPUT TYPE="hidden" NAME="name" VALUE="value" ID="foo">

## html(attributes{}) [](#method-i-html)
Generate a top-level HTML element as a string.

The attributes of the element are specified as a hash.  The pseudo-attribute
"PRETTY" can be used to specify that the generated HTML string should be
indented.  "PRETTY" can also be specified as a string as the sole argument to
this method.  The pseudo-attribute "DOCTYPE", if given, is used as the leading
DOCTYPE SGML tag; it should include the entire text of this tag, including
angle brackets.

The body of the html element is supplied as a block.

    html{ "string" }
      # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN"><HTML>string</HTML>

    html("LANG" => "ja") { "string" }
      # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN"><HTML LANG="ja">string</HTML>

    html("DOCTYPE" => false) { "string" }
      # <HTML>string</HTML>

    html("DOCTYPE" => '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">') { "string" }
      # <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN"><HTML>string</HTML>

    html("PRETTY" => "  ") { "<BODY></BODY>" }
      # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
      # <HTML>
      #   <BODY>
      #   </BODY>
      # </HTML>

    html("PRETTY" => "\t") { "<BODY></BODY>" }
      # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
      # <HTML>
      #         <BODY>
      #         </BODY>
      # </HTML>

    html("PRETTY") { "<BODY></BODY>" }
      # = html("PRETTY" => "  ") { "<BODY></BODY>" }

    html(if $VERBOSE then "PRETTY" end) { "HTML string" }

## image_button(src"", namenil, altnil) [](#method-i-image_button)
Generate an Image Button Input element as a string.

`src` is the URL of the image to use for the button.  `name` is the input
name.  `alt` is the alternative text for the image.

Alternatively, the attributes can be specified as a hash.

    image_button("url")
      # <INPUT TYPE="image" SRC="url">

    image_button("url", "name", "string")
      # <INPUT TYPE="image" SRC="url" NAME="name" ALT="string">

    image_button("SRC" => "url", "ALT" => "string")
      # <INPUT TYPE="image" SRC="url" ALT="string">

## img(src"", alt"", widthnil, heightnil) [](#method-i-img)
Generate an Image element as a string.

`src` is the URL of the image.  `alt` is the alternative text for the image. 
`width` is the width of the image, and `height` is its height.

Alternatively, the attributes can be specified as a hash.

    img("src", "alt", 100, 50)
      # <IMG SRC="src" ALT="alt" WIDTH="100" HEIGHT="50">

    img("SRC" => "src", "ALT" => "alt", "WIDTH" => 100, "HEIGHT" => 50)
      # <IMG SRC="src" ALT="alt" WIDTH="100" HEIGHT="50">

## multipart_form(actionnil, enctype"multipart/form-data") [](#method-i-multipart_form)
Generate a Form element with multipart encoding as a String.

Multipart encoding is used for forms that include file uploads.

`action` is the action to perform.  `enctype` is the encoding type, which
defaults to "multipart/form-data".

Alternatively, the attributes can be specified as a hash.

    multipart_form{ "string" }
      # <FORM METHOD="post" ENCTYPE="multipart/form-data">string</FORM>

    multipart_form("url") { "string" }
      # <FORM METHOD="post" ACTION="url" ENCTYPE="multipart/form-data">string</FORM>

## nOE_element(element, attributes{}) [](#method-i-nOE_element)
Generate code for an empty element.

    - O EMPTY

## nOE_element_def(attributes{}, &block) [](#method-i-nOE_element_def)

## nO_element(element, attributes{}) [](#method-i-nO_element)
Generate code for an element for which the end (and possibly the start) tag is
optional.

    O O or - O

## nO_element_def(attributes{}, &block) [](#method-i-nO_element_def)

## nn_element(element, attributes{}) [](#method-i-nn_element)
Generate code for an element with required start and end tags.

    - -

## nn_element_def(attributes{}, &block) [](#method-i-nn_element_def)

## password_field(name"", valuenil, size40, maxlengthnil) [](#method-i-password_field)
Generate a Password Input element as a string.

`name` is the name of the input field.  `value` is its default value.  `size`
is the size of the input field display.  `maxlength` is the maximum length of
the inputted password.

Alternatively, attributes can be specified as a hash.

    password_field("name")
      # <INPUT TYPE="password" NAME="name" SIZE="40">

    password_field("name", "value")
      # <INPUT TYPE="password" NAME="name" VALUE="value" SIZE="40">

    password_field("password", "value", 80, 200)
      # <INPUT TYPE="password" NAME="name" VALUE="value" SIZE="80" MAXLENGTH="200">

    password_field("NAME" => "name", "VALUE" => "value")
      # <INPUT TYPE="password" NAME="name" VALUE="value">

## popup_menu(name"", *values) [](#method-i-popup_menu)
Generate a Select element as a string.

`name` is the name of the element.  The `values` are the options that can be
selected from the Select menu.  Each value can be a String or a one, two, or
three-element Array.  If a String or a one-element Array, this is both the
value of that option and the text displayed for it.  If a three-element Array,
the elements are the option value, displayed text, and a boolean value
specifying whether this option starts as selected. The two-element version
omits either the option value (defaults to the same as the display text) or
the boolean selected specifier (defaults to false).

The attributes and options can also be specified as a hash.  In this case,
options are specified as an array of values as described above, with the hash
key of "VALUES".

    popup_menu("name", "foo", "bar", "baz")
      # <SELECT NAME="name">
      #   <OPTION VALUE="foo">foo</OPTION>
      #   <OPTION VALUE="bar">bar</OPTION>
      #   <OPTION VALUE="baz">baz</OPTION>
      # </SELECT>

    popup_menu("name", ["foo"], ["bar", true], "baz")
      # <SELECT NAME="name">
      #   <OPTION VALUE="foo">foo</OPTION>
      #   <OPTION VALUE="bar" SELECTED>bar</OPTION>
      #   <OPTION VALUE="baz">baz</OPTION>
      # </SELECT>

    popup_menu("name", ["1", "Foo"], ["2", "Bar", true], "Baz")
      # <SELECT NAME="name">
      #   <OPTION VALUE="1">Foo</OPTION>
      #   <OPTION SELECTED VALUE="2">Bar</OPTION>
      #   <OPTION VALUE="Baz">Baz</OPTION>
      # </SELECT>

    popup_menu("NAME" => "name", "SIZE" => 2, "MULTIPLE" => true,
                "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"])
      # <SELECT NAME="name" MULTIPLE SIZE="2">
      #   <OPTION VALUE="1">Foo</OPTION>
      #   <OPTION SELECTED VALUE="2">Bar</OPTION>
      #   <OPTION VALUE="Baz">Baz</OPTION>
      # </SELECT>

## radio_button(name"", valuenil, checkednil) [](#method-i-radio_button)
Generates a radio-button Input element.

`name` is the name of the input field.  `value` is the value of the field if
checked.  `checked` specifies whether the field starts off checked.

Alternatively, the attributes can be specified as a hash.

    radio_button("name", "value")
      # <INPUT TYPE="radio" NAME="name" VALUE="value">

    radio_button("name", "value", true)
      # <INPUT TYPE="radio" NAME="name" VALUE="value" CHECKED>

    radio_button("NAME" => "name", "VALUE" => "value", "ID" => "foo")
      # <INPUT TYPE="radio" NAME="name" VALUE="value" ID="foo">

## radio_group(name"", *values) [](#method-i-radio_group)
Generate a sequence of radio button Input elements, as a String.

This works the same as #checkbox_group().  However, it is not valid to have
more than one radiobutton in a group checked.

    radio_group("name", "foo", "bar", "baz")
      # <INPUT TYPE="radio" NAME="name" VALUE="foo">foo
      # <INPUT TYPE="radio" NAME="name" VALUE="bar">bar
      # <INPUT TYPE="radio" NAME="name" VALUE="baz">baz

    radio_group("name", ["foo"], ["bar", true], "baz")
      # <INPUT TYPE="radio" NAME="name" VALUE="foo">foo
      # <INPUT TYPE="radio" CHECKED NAME="name" VALUE="bar">bar
      # <INPUT TYPE="radio" NAME="name" VALUE="baz">baz

    radio_group("name", ["1", "Foo"], ["2", "Bar", true], "Baz")
      # <INPUT TYPE="radio" NAME="name" VALUE="1">Foo
      # <INPUT TYPE="radio" CHECKED NAME="name" VALUE="2">Bar
      # <INPUT TYPE="radio" NAME="name" VALUE="Baz">Baz

    radio_group("NAME" => "name",
                  "VALUES" => ["foo", "bar", "baz"])

    radio_group("NAME" => "name",
                  "VALUES" => [["foo"], ["bar", true], "baz"])

    radio_group("NAME" => "name",
                  "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"])

## reset(valuenil, namenil) [](#method-i-reset)
Generate a reset button Input element, as a String.

This resets the values on a form to their initial values.  `value` is the text
displayed on the button. `name` is the name of this button.

Alternatively, the attributes can be specified as a hash.

    reset
      # <INPUT TYPE="reset">

    reset("reset")
      # <INPUT TYPE="reset" VALUE="reset">

    reset("VALUE" => "reset", "ID" => "foo")
      # <INPUT TYPE="reset" VALUE="reset" ID="foo">

## submit(valuenil, namenil) [](#method-i-submit)
Generate a submit button Input element, as a String.

`value` is the text to display on the button.  `name` is the name of the
input.

Alternatively, the attributes can be specified as a hash.

    submit
      # <INPUT TYPE="submit">

    submit("ok")
      # <INPUT TYPE="submit" VALUE="ok">

    submit("ok", "button1")
      # <INPUT TYPE="submit" VALUE="ok" NAME="button1">

    submit("VALUE" => "ok", "NAME" => "button1", "ID" => "foo")
      # <INPUT TYPE="submit" VALUE="ok" NAME="button1" ID="foo">

## text_field(name"", valuenil, size40, maxlengthnil) [](#method-i-text_field)
Generate a text field Input element, as a String.

`name` is the name of the input field.  `value` is its initial value.  `size`
is the size of the input area.  `maxlength` is the maximum length of input
accepted.

Alternatively, the attributes can be specified as a hash.

    text_field("name")
      # <INPUT TYPE="text" NAME="name" SIZE="40">

    text_field("name", "value")
      # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="40">

    text_field("name", "value", 80)
      # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="80">

    text_field("name", "value", 80, 200)
      # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="80" MAXLENGTH="200">

    text_field("NAME" => "name", "VALUE" => "value")
      # <INPUT TYPE="text" NAME="name" VALUE="value">

## textarea(name"", cols70, rows10) [](#method-i-textarea)
Generate a TextArea element, as a String.

`name` is the name of the textarea.  `cols` is the number of columns and
`rows` is the number of rows in the display.

Alternatively, the attributes can be specified as a hash.

The body is provided by the passed-in no-argument block

    textarea("name")
       # = textarea("NAME" => "name", "COLS" => 70, "ROWS" => 10)

    textarea("name", 40, 5)
       # = textarea("NAME" => "name", "COLS" => 40, "ROWS" => 5)

