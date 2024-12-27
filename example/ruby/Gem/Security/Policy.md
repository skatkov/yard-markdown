# Class: Gem::Security::Policy
**Inherits:** Object
    
**Includes:** Gem::UserInteraction
  

:nodoc:


# Attributes
## name[RW] [](#attribute-i-name)
Returns the value of attribute name.

## only_signed[RW] [](#attribute-i-only_signed)
Returns the value of attribute only_signed.

## only_trusted[RW] [](#attribute-i-only_trusted)
Returns the value of attribute only_trusted.

## verify_chain[RW] [](#attribute-i-verify_chain)
Returns the value of attribute verify_chain.

## verify_data[RW] [](#attribute-i-verify_data)
Returns the value of attribute verify_data.

## verify_root[RW] [](#attribute-i-verify_root)
Returns the value of attribute verify_root.

## verify_signer[RW] [](#attribute-i-verify_signer)
Returns the value of attribute verify_signer.


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

## check_cert(signer, issuer, time) [](#method-i-check_cert)
Ensures that `signer` is valid for `time` and was signed by the `issuer`. If
the `issuer` is `nil` no verification is performed.

**@raise** [Gem::Security::Exception] 

## check_chain(chain, time) [](#method-i-check_chain)
Verifies each certificate in `chain` has signed the following certificate and
is valid for the given `time`.

**@raise** [Gem::Security::Exception] 

## check_data(public_key, digest, signature, data) [](#method-i-check_data)
Verifies that `data` matches the `signature` created by `public_key` and the
`digest` algorithm.

**@raise** [Gem::Security::Exception] 

## check_key(signer, key) [](#method-i-check_key)
Ensures the public key of `key` matches the public key in `signer`

**@raise** [Gem::Security::Exception] 

## check_root(chain, time) [](#method-i-check_root)
Ensures the root certificate in `chain` is self-signed and valid for `time`.

**@raise** [Gem::Security::Exception] 

## check_trust(chain, digester, trust_dir) [](#method-i-check_trust)
Ensures the root of `chain` has a trusted certificate in `trust_dir` and the
digests of the two certificates match according to `digester`

**@raise** [Gem::Security::Exception] 

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## initialize(name, policy{}, opt{}) [](#method-i-initialize)
Create a new Gem::Security::Policy object with the given mode and options.

**@return** [Policy] a new instance of Policy

## inspect() [](#method-i-inspect)
:nodoc:

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## say(statement"") [](#method-i-say)
Displays the given `statement` on the standard output (or equivalent).

## subject(certificate) [](#method-i-subject)
Extracts the email or subject from `certificate`

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

## verify(chain, keynil, digests{}, signatures{}, full_name"(unknown)") [](#method-i-verify)
For `full_name`, verifies the certificate `chain` is valid, the `digests`
match the signatures `signatures` created by the signer depending on the
`policy` settings.

If `key` is given it is used to validate the signing certificate.

## verify_signatures(spec, digests, signatures) [](#method-i-verify_signatures)
Extracts the certificate chain from the `spec` and calls #verify to ensure the
signatures and certificate chain is valid according to the policy..

