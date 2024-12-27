# Class: OpenSSL::SSL::SSLContext
**Inherits:** Object
    

An SSLContext is used to set various options regarding certificates,
algorithms, verification, session caching, etc.  The SSLContext is used to
create an SSLSocket.

All attributes must be set before creating an SSLSocket as the SSLContext will
be frozen afterward.


# Attributes
## servername_cb[RW] [](#attribute-i-servername_cb)
A callback invoked at connect time to distinguish between multiple server
names.

The callback is invoked with an SSLSocket and a server name.  The callback
must return an SSLContext for the server name or nil.

## tmp_dh_callback[RW] [](#attribute-i-tmp_dh_callback)
A callback invoked when DH parameters are required for ephemeral DH key
exchange.

The callback is invoked with the SSLSocket, a flag indicating the use of an
export cipher and the keylength required.

The callback must return an OpenSSL::PKey::DH instance of the correct key
length.

**Deprecated in version 3.0.** Use #tmp_dh= instead.


#Instance Methods
## add_certificate(*args) [](#method-i-add_certificate)
Adds a certificate to the context. *pkey* must be a corresponding private key
with *certificate*.

Multiple certificates with different public key type can be added by repeated
calls of this method, and OpenSSL will choose the most appropriate certificate
during the handshake.

#cert=, #key=, and #extra_chain_cert= are old accessor methods for setting
certificate and internally call this method.

### Parameters
*certificate*
:   A certificate. An instance of OpenSSL::X509::Certificate.

*pkey*
:   The private key for *certificate*. An instance of OpenSSL::PKey::PKey.

*extra_certs*
:   Optional. An array of OpenSSL::X509::Certificate. When sending a
    certificate chain, the certificates specified by this are sent following
    *certificate*, in the order in the array.


### Example
    rsa_cert = OpenSSL::X509::Certificate.new(...)
    rsa_pkey = OpenSSL::PKey.read(...)
    ca_intermediate_cert = OpenSSL::X509::Certificate.new(...)
    ctx.add_certificate(rsa_cert, rsa_pkey, [ca_intermediate_cert])

    ecdsa_cert = ...
    ecdsa_pkey = ...
    another_ca_cert = ...
    ctx.add_certificate(ecdsa_cert, ecdsa_pkey, [another_ca_cert])

**@overload** [] 

## ciphers() [](#method-i-ciphers)
The list of cipher suites configured for this context.

**@overload** [] 

## ciphers=(v) [](#method-i-ciphers=)
ctx.ciphers = [name, ...]
    ctx.ciphers = [[name, version, bits, alg_bits], ...]

Sets the list of available cipher suites for this context.  Note in a server
context some ciphers require the appropriate certificates.  For example, an
RSA cipher suite can only be chosen when an RSA certificate is available.

## ciphersuites=(v) [](#method-i-ciphersuites=)
ctx.ciphersuites = [name, ...]
    ctx.ciphersuites = [[name, version, bits, alg_bits], ...]

Sets the list of available TLSv1.3 cipher suites for this context.

## ecdh_curves=(arg) [](#method-i-ecdh_curves=)
Sets the list of "supported elliptic curves" for this context.

For a TLS client, the list is directly used in the Supported Elliptic Curves
Extension. For a server, the list is used by OpenSSL to determine the set of
shared curves. OpenSSL will pick the most appropriate one from it.

### Example
    ctx1 = OpenSSL::SSL::SSLContext.new
    ctx1.ecdh_curves = "X25519:P-256:P-224"
    svr = OpenSSL::SSL::SSLServer.new(tcp_svr, ctx1)
    Thread.new { svr.accept }

    ctx2 = OpenSSL::SSL::SSLContext.new
    ctx2.ecdh_curves = "P-256"
    cli = OpenSSL::SSL::SSLSocket.new(tcp_sock, ctx2)
    cli.connect

    p cli.tmp_key.group.curve_name
    # => "prime256v1" (is an alias for NIST P-256)

**@overload** [] 

## enable_fallback_scsv() [](#method-i-enable_fallback_scsv)
Activate TLS_FALLBACK_SCSV for this context. See RFC 7507.

**@overload** [] 

## flush_sessions(*args) [](#method-i-flush_sessions)
Removes sessions in the internal cache that have expired at *time*.

**@overload** [] 

## initialize(versionnil) [](#method-i-initialize)
call-seq:
    SSLContext.new           -> ctx
    SSLContext.new(:TLSv1)   -> ctx
    SSLContext.new("SSLv23") -> ctx

Creates a new SSL context.

If an argument is given, #ssl_version= is called with the value. Note that
this form is deprecated. New applications should use #min_version= and
#max_version= as necessary.

**@return** [SSLContext] a new instance of SSLContext

## max_version=(version) [](#method-i-max_version=)
call-seq:
    ctx.max_version = OpenSSL::SSL::TLS1_2_VERSION
    ctx.max_version = :TLS1_2
    ctx.max_version = nil

Sets the upper bound of the supported SSL/TLS protocol version. See
#min_version= for the possible values.

## min_version=(version) [](#method-i-min_version=)
call-seq:
    ctx.min_version = OpenSSL::SSL::TLS1_2_VERSION
    ctx.min_version = :TLS1_2
    ctx.min_version = nil

Sets the lower bound on the supported SSL/TLS protocol version. The version
may be specified by an integer constant named OpenSSL::SSL::*_VERSION, a
Symbol, or `nil` which means "any version".

Be careful that you don't overwrite OpenSSL::SSL::OP_NO_{SSL,TLS}v* options by
#options= once you have called #min_version= or #max_version=.

### Example
    ctx = OpenSSL::SSL::SSLContext.new
    ctx.min_version = OpenSSL::SSL::TLS1_1_VERSION
    ctx.max_version = OpenSSL::SSL::TLS1_2_VERSION

    sock = OpenSSL::SSL::SSLSocket.new(tcp_sock, ctx)
    sock.connect # Initiates a connection using either TLS 1.1 or TLS 1.2

## options() [](#method-i-options)
Gets various OpenSSL options.

**@overload** [] 

## options=(options) [](#method-i-options=)
Sets various OpenSSL options. The options are a bit field and can be combined
with the bitwise OR operator (`|`). Available options are defined as constants
in OpenSSL::SSL that begin with `OP_`.

For backwards compatibility, passing `nil` has the same effect as passing
OpenSSL::SSL::OP_ALL.

See also man page SSL_CTX_set_options(3).

**@overload** [] 

## security_level() [](#method-i-security_level)
Returns the security level for the context.

See also OpenSSL::SSL::SSLContext#security_level=.

**@overload** [] 

## security_level=(value) [](#method-i-security_level=)
Sets the security level for the context. OpenSSL limits parameters according
to the level. The "parameters" include: ciphersuites, curves, key sizes,
certificate signature algorithms, protocol version and so on. For example,
level 1 rejects parameters offering below 80 bits of security, such as
ciphersuites using MD5 for the MAC or RSA keys shorter than 1024 bits.

Note that attempts to set such parameters with insufficient security are also
blocked. You need to lower the level first.

This feature is not supported in OpenSSL < 1.1.0, and setting the level to
other than 0 will raise NotImplementedError. Level 0 means everything is
permitted, the same behavior as previous versions of OpenSSL.

See the manpage of SSL_CTX_set_security_level(3) for details.

**@overload** [] 

## session_add(arg) [](#method-i-session_add)
Adds *session* to the session cache.

**@overload** [] 

## session_cache_mode() [](#method-i-session_cache_mode)
The current session cache mode.

**@overload** [] 

## session_cache_mode=(arg) [](#method-i-session_cache_mode=)
Sets the SSL session cache mode.  Bitwise-or together the desired
SESSION_CACHE_* constants to set.  See SSL_CTX_set_session_cache_mode(3) for
details.

**@overload** [] 

## session_cache_size() [](#method-i-session_cache_size)
Returns the current session cache size.  Zero is used to represent an
unlimited cache size.

**@overload** [] 

## session_cache_size=(arg) [](#method-i-session_cache_size=)
Sets the session cache size.  Returns the previously valid session cache size.
 Zero is used to represent an unlimited session cache size.

**@overload** [] 

## session_cache_stats() [](#method-i-session_cache_stats)
Returns a Hash containing the following keys:

:accept
:   Number of started SSL/TLS handshakes in server mode

:accept_good
:   Number of established SSL/TLS sessions in server mode

:accept_renegotiate
:   Number of start renegotiations in server mode

:cache_full
:   Number of sessions that were removed due to cache overflow

:cache_hits
:   Number of successfully reused connections

:cache_misses
:   Number of sessions proposed by clients that were not found

    in the cache

:cache_num
:   Number of sessions in the internal session cache

:cb_hits
:   Number of sessions retrieved from the external cache in server

    mode

:connect
:   Number of started SSL/TLS handshakes in client mode

:connect_good
:   Number of established SSL/TLS sessions in client mode

:connect_renegotiate
:   Number of start renegotiations in client mode

:timeouts
:   Number of sessions proposed by clients that were found in the

    cache but had expired due to timeouts

**@overload** [] 

## session_remove(arg) [](#method-i-session_remove)
Removes *session* from the session cache.

**@overload** [] 

## set_params(params{}) [](#method-i-set_params)
call-seq:
    ctx.set_params(params = {}) -> params

Sets saner defaults optimized for the use with HTTP-like protocols.

If a Hash *params* is given, the parameters are overridden with it. The keys
in *params* must be assignment methods on SSLContext.

If the verify_mode is not VERIFY_NONE and ca_file, ca_path and cert_store are
not set then the system default certificate store is used.

## setup() [](#method-i-setup)
This method is called automatically when a new SSLSocket is created. However,
it is not thread-safe and must be called before creating SSLSocket objects in
a multi-threaded program.

**@overload** [] 

**@overload** [] 

## ssl_version=(meth) [](#method-i-ssl_version=)
call-seq:
    ctx.ssl_version = :TLSv1
    ctx.ssl_version = "SSLv23"

Sets the SSL/TLS protocol version for the context. This forces connections to
use only the specified protocol version. This is deprecated and only provided
for backwards compatibility. Use #min_version= and #max_version= instead.

### History
As the name hints, this used to call the SSL_CTX_set_ssl_version() function
which sets the SSL method used for connections created from the context. As of
Ruby/OpenSSL 2.1, this accessor method is implemented to call #min_version=
and #max_version= instead.

## tmp_dh=(arg) [](#method-i-tmp_dh=)
Sets DH parameters used for ephemeral DH key exchange. This is relevant for
servers only.

`pkey` is an instance of OpenSSL::PKey::DH. Note that key components contained
in the key object, if any, are ignored. The server will always generate a new
key pair for each handshake.

Added in version 3.0. See also the man page SSL_set0_tmp_dh_pkey(3).

Example:
    ctx = OpenSSL::SSL::SSLContext.new
    ctx.tmp_dh = OpenSSL::DH.generate(2048)
    svr = OpenSSL::SSL::SSLServer.new(tcp_svr, ctx)
    Thread.new { svr.accept }

**@overload** [] 

