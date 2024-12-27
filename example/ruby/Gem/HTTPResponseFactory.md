# Class: Gem::HTTPResponseFactory
**Inherits:** Object
    

The HTTPResponseFactory allows easy creation of Gem::Net::HTTPResponse
instances in RubyGems tests:

Example:

    Gem::HTTPResponseFactory.create(
      body: "",
      code: 301,
      msg: "Moved Permanently",
      headers: { "location" => "http://example.com" }
    )


# Class Methods
## create(body: , code: , msg: , headers: {}) [](#method-c-create)

