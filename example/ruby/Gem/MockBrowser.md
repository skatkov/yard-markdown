# Class: Gem::MockBrowser
**Inherits:** Object
    

A Gem::MockBrowser is used in tests to mock a browser in that it can send HTTP
requests to the defined URI.

Example:

    # Sends a get request to http://localhost:5678
    Gem::MockBrowser.get Gem::URI("http://localhost:5678")

See RubyGems' tests for more examples of MockBrowser.


# Class Methods
## get(uri ) [](#method-c-get)
## options(uri ) [](#method-c-options)
## post(uri , content_type: "application/x-www-form-urlencoded") [](#method-c-post)

