# Class: URI::MailTo
**Inherits:** URI::Generic
    
**Includes:** URI::RFC2396_REGEXP
  

RFC6068, the mailto URL scheme.


# Class Methods
## build(args ) [](#method-c-build)
## Description

Creates a new URI::MailTo object from components, with syntax checking.

Components can be provided as an Array or Hash. If an Array is used, the
components must be supplied as `[to, headers]`.

If a Hash is used, the keys are the component names preceded by colons.

The headers can be supplied as a pre-encoded string, such as
`"subject=subscribe&cc=address"`, or as an Array of Arrays like `[['subject',
'subscribe'], ['cc', 'address']]`.

Examples:

    require 'uri'

    m1 = URI::MailTo.build(['joe@example.com', 'subject=Ruby'])
    m1.to_s  # => "mailto:joe@example.com?subject=Ruby"

    m2 = URI::MailTo.build(['john@example.com', [['Subject', 'Ruby'], ['Cc', 'jack@example.com']]])
    m2.to_s  # => "mailto:john@example.com?Subject=Ruby&Cc=jack@example.com"

    m3 = URI::MailTo.build({:to => 'listman@example.com', :headers => [['subject', 'subscribe']]})
    m3.to_s  # => "mailto:listman@example.com?subject=subscribe"
# Attributes
## headers[RW] [](#attribute-i-headers)
E-mail headers set by the URL, as an Array of Arrays.

## to[RW] [](#attribute-i-to)
The primary e-mail address of the URL, as a String.


#Instance Methods
## initialize(*arg) [](#method-i-initialize)
## Description

Creates a new URI::MailTo object from generic URL components with no syntax
checking.

This method is usually called from URI::parse, which checks the validity of
each component.

**@return** [MailTo] a new instance of MailTo

## to_mailtext() [](#method-i-to_mailtext)
Returns the RFC822 e-mail text equivalent of the URL, as a String.

Example:

    require 'uri'

    uri = URI.parse("mailto:ruby-list@ruby-lang.org?Subject=subscribe&cc=myaddr")
    uri.to_mailtext
    # => "To: ruby-list@ruby-lang.org\nSubject: subscribe\nCc: myaddr\n\n\n"

## to_s() [](#method-i-to_s)
Constructs String from URI.

