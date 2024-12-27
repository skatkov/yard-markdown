# Class: Gem::Security::Signer
**Inherits:** Object
    
**Includes:** Gem::UserInteraction
  



# Class Methods
## re_sign_cert(expired_cert , expired_cert_path , private_key ) [](#method-c-re_sign_cert)
Attempts to re-sign an expired cert with a given private key
**@yield** [expired_cert_path, new_expired_cert_path] 

# Attributes
## cert_chain[RW] [](#attribute-i-cert_chain)
The chain of certificates for signing including the signing certificate

## digest_algorithm[RW] [](#attribute-i-digest_algorithm)
The digest algorithm used to create the signature

## digest_name[RW] [](#attribute-i-digest_name)
The name of the digest algorithm, used to pull digests out of the hash by
name.

## key[RW] [](#attribute-i-key)
The private key for the signing certificate

## options[RW] [](#attribute-i-options)
Gem::Security::Signer options


#Instance Methods
## alert(statement, questionnil) [](#method-i-alert)
Displays an alert `statement`.  Asks a `question` if given.

## alert_error(statement, questionnil) [](#method-i-alert_error)
Displays an error `statement` to the error output location.  Asks a `question`
if given.

## alert_warning(statement, questionnil) [](#method-i-alert_warning)
Displays a warning `statement` to the warning output location.  Asks a
`question` if given.

## ask(question) [](#method-i-ask)
Asks a `question` and returns the answer.

## ask_for_password(prompt) [](#method-i-ask_for_password)
Asks for a password with a `prompt`

## ask_yes_no(question, defaultnil) [](#method-i-ask_yes_no)
Asks a yes or no `question`.  Returns true for yes, false for no.

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## extract_name(cert) [](#method-i-extract_name)
Extracts the full name of `cert`.  If the certificate has a subjectAltName
this value is preferred, otherwise the subject is used.

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## initialize(key, cert_chain, passphrasenil, options{}) [](#method-i-initialize)
Creates a new signer with an RSA `key` or path to a key, and a certificate
`chain` containing X509 certificates, encoding certificates or paths to
certificates.

**@return** [Signer] a new instance of Signer

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## load_cert_chain() [](#method-i-load_cert_chain)
Loads any missing issuers in the cert chain from the trusted certificates.

If the issuer does not exist it is ignored as it will be checked later.

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## re_sign_key(expiration_length:Gem::Security::ONE_YEAR) [](#method-i-re_sign_key)
Attempts to re-sign the private key if the signing certificate is expired.

The key will be re-signed if:
*   The expired certificate is self-signed
*   The expired certificate is saved at ~/.gem/gem-public_cert.pem and the
    private key is saved at ~/.gem/gem-private_key.pem
*   There is no file matching the expiry date at
    ~/.gem/gem-public_cert.pem.expired.%Y%m%d%H%M%S

If the signing certificate can be re-signed the expired certificate will be
saved as ~/.gem/gem-public_cert.pem.expired.%Y%m%d%H%M%S where the expiry time
(not after) is used for the timestamp.

## say(statement"") [](#method-i-say)
Displays the given `statement` on the standard output (or equivalent).

## sign(data) [](#method-i-sign)
Sign data with given digest algorithm

**@raise** [Gem::Security::Exception] 

## terminate_interaction(exit_code0) [](#method-i-terminate_interaction)
Terminates the RubyGems process with the given `exit_code`

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

