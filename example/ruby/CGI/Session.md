# Class: CGI::Session
**Inherits:** Object
    

## Overview

This file provides the CGI::Session class, which provides session support for
CGI scripts.  A session is a sequence of HTTP requests and responses linked
together and associated with a single client. Information associated with the
session is stored on the server between requests.  A session id is passed
between client and server with every request and response, transparently to
the user.  This adds state information to the otherwise stateless HTTP
request/response protocol.

## Lifecycle

A CGI::Session instance is created from a CGI object.  By default, this
CGI::Session instance will start a new session if none currently exists, or
continue the current session for this client if one does exist.  The
`new_session` option can be used to either always or never create a new
session.  See #new() for more details.

#delete() deletes a session from session storage.  It does not however remove
the session id from the client.  If the client makes another request with the
same id, the effect will be to start a new session with the old session's id.

## Setting and retrieving session data.

The Session class associates data with a session as key-value pairs. This data
can be set and retrieved by indexing the Session instance using '[]', much the
same as hashes (although other hash methods are not supported).

When session processing has been completed for a request, the session should
be closed using the close() method.  This will store the session's state to
persistent storage.  If you want to store the session's state to persistent
storage without finishing session processing for this request, call the
update() method.

## Storing session state

The caller can specify what form of storage to use for the session's data with
the `database_manager` option to CGI::Session::new.  The following storage
classes are provided as part of the standard library:

CGI::Session::FileStore
:   stores data as plain text in a flat file.  Only works with String data. 
    This is the default storage type.

CGI::Session::MemoryStore
:   stores data in an in-memory hash.  The data only persists for as long as
    the current Ruby interpreter instance does.

CGI::Session::PStore
:   stores data in Marshalled format.  Provided by cgi/session/pstore.rb. 
    Supports data of any type, and provides file-locking and transaction
    support.


Custom storage types can also be created by defining a class with the
following methods:

    new(session, options)
    restore  # returns hash of session data.
    update
    close
    delete

Changing storage type mid-session does not work.  Note in particular that by
default the FileStore and PStore session data files have the same name.  If
your application switches from one to the other without making sure that
filenames will be different and clients still have old sessions lying around
in cookies, then things will break nastily!

## Maintaining the session id.

Most session state is maintained on the server.  However, a session id must be
passed backwards and forwards between client and server to maintain a
reference to this session state.

The simplest way to do this is via cookies.  The CGI::Session class provides
transparent support for session id communication via cookies if the client has
cookies enabled.

If the client has cookies disabled, the session id must be included as a
parameter of all requests sent by the client to the server.  The CGI::Session
class in conjunction with the CGI class will transparently add the session id
as a hidden input field to all forms generated using the CGI#form() HTML
generation method.  No built-in support is provided for other mechanisms, such
as URL re-writing.  The caller is responsible for extracting the session id
from the session_id attribute and manually encoding it in URLs and adding it
as a hidden input to HTML forms created by other mechanisms.  Also, session
expiry is not automatically handled.

## Examples of use

### Setting the user's name

    require 'cgi'
    require 'cgi/session'
    require 'cgi/session/pstore'     # provides CGI::Session::PStore

    cgi = CGI.new("html4")

    session = CGI::Session.new(cgi,
        'database_manager' => CGI::Session::PStore,  # use PStore
        'session_key' => '_rb_sess_id',              # custom session key
        'session_expires' => Time.now + 30 * 60,     # 30 minute timeout
        'prefix' => 'pstore_sid_')                   # PStore option
    if cgi.has_key?('user_name') and cgi['user_name'] != ''
        # coerce to String: cgi[] returns the
        # string-like CGI::QueryExtension::Value
        session['user_name'] = cgi['user_name'].to_s
    elsif !session['user_name']
        session['user_name'] = "guest"
    end
    session.close

### Creating a new session safely

    require 'cgi'
    require 'cgi/session'

    cgi = CGI.new("html4")

    # We make sure to delete an old session if one exists,
    # not just to free resources, but to prevent the session
    # from being maliciously hijacked later on.
    begin
        session = CGI::Session.new(cgi, 'new_session' => false)
        session.delete
    rescue ArgumentError  # if no old session
    end
    session = CGI::Session.new(cgi, 'new_session' => true)
    session.close


# Class Methods
## callback(dbman ) [](#method-c-callback)
:nodoc:
# Attributes
## new_session[RW] [](#attribute-i-new_session)
The id of this session.

## session_id[RW] [](#attribute-i-session_id)
The id of this session.


#Instance Methods
## [](key) [](#method-i-[])
Retrieve the session data for key `key`.

## []=(key, val) [](#method-i-[]=)
Set the session data for key `key`.

## close() [](#method-i-close)
Store session data on the server and close the session storage. For some
session storage types, this is a no-op.

## delete() [](#method-i-delete)
Delete the session from storage.  Also closes the storage.

Note that the session's data is *not* automatically deleted upon the session
expiring.

## initialize(request, option{}) [](#method-i-initialize)
Create a new CGI::Session object for `request`.

`request` is an instance of the `CGI` class (see cgi.rb). `option` is a hash
of options for initialising this CGI::Session instance.  The following options
are recognised:

session_key
:   the parameter name used for the session id. Defaults to '_session_id'.

session_id
:   the session id to use.  If not provided, then it is retrieved from the
    `session_key` parameter of the request, or automatically generated for a
    new session.

new_session
:   if true, force creation of a new session.  If not set, a new session is
    only created if none currently exists.  If false, a new session is never
    created, and if none currently exists and the `session_id` option is not
    set, an ArgumentError is raised.

database_manager
:   the name of the class providing storage facilities for session state
    persistence.  Built-in support is provided for `FileStore` (the default),
    `MemoryStore`, and `PStore` (from cgi/session/pstore.rb).  See the
    documentation for these classes for more details.


The following options are also recognised, but only apply if the session id is
stored in a cookie.

session_expires
:   the time the current session expires, as a `Time` object.  If not set, the
    session will terminate when the user's browser is closed.

session_domain
:   the hostname domain for which this session is valid. If not set, defaults
    to the hostname of the server.

session_secure
:   if `true`, this session will only work over HTTPS.

session_path
:   the path for which this session applies.  Defaults to the directory of the
    CGI script.


`option` is also passed on to the session storage class initializer; see the
documentation for each session storage class for the options they support.

The retrieved or created session is automatically added to `request` as a
cookie, and also to its `output_hidden` table, which is used to add hidden
input elements to forms.

**WARNING** the `output_hidden` fields are surrounded by a <fieldset> tag in
HTML 4 generation, which is *not* invisible on many browsers; you may wish to
disable the use of fieldsets with code similar to the following (see
https://blade.ruby-lang.org/ruby-list/37805)

    cgi = CGI.new("html4")
    class << cgi
        undef_method :fieldset
    end

**@return** [Session] a new instance of Session

## new_store_file(option{}) [](#method-i-new_store_file)
Create a new file to store the session data.

This file will be created if it does not exist, or opened if it does.

This path is generated under *tmpdir* from *prefix*, the digested session id,
and *suffix*.

`option` is a hash of options for the initializer.  The following options are
recognised:

tmpdir
:   the directory to use for storing the FileStore file.  Defaults to
    Dir::tmpdir (generally "/tmp" on Unix systems).

prefix
:   the prefix to add to the session id when generating the filename for this
    session's FileStore file. Defaults to "cgi_sid_".

suffix
:   the prefix to add to the session id when generating the filename for this
    session's FileStore file. Defaults to the empty string.


## update() [](#method-i-update)
Store session data on the server.  For some session storage types, this is a
no-op.

