# Class: Gem::Uri
**Inherits:** Object
    

The Uri handles rubygems source URIs.


# Class Methods
## parse(uri ) [](#method-c-parse)
Parses uri, returning the original uri if it's invalid
## parse!(uri ) [](#method-c-parse!)
Parses uri, raising if it's invalid
**@raise** [Gem::URI::InvalidURIError] 

## redact(uri ) [](#method-c-redact)
Parses and redacts uri

#Instance Methods
## initialize(source_uri) [](#method-i-initialize)

**@return** [Uri] a new instance of Uri

## method_missing(method_name, *args, &blk) [](#method-i-method_missing)

## redact_credentials_from(text) [](#method-i-redact_credentials_from)

## redacted() [](#method-i-redacted)

## respond_to_missing?(method_name, include_privatefalse) [](#method-i-respond_to_missing?)

**@return** [Boolean] 

## to_s() [](#method-i-to_s)

