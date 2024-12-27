# Class: Artifice::Net::HTTP
**Inherits:** Gem::Net::HTTP
    



# Attributes
## endpoint[RW] [](#attribute-c-endpoint)
Returns the value of attribute endpoint.


#Instance Methods
## connect() [](#method-i-connect)
We don't need to connect, so blank out this method

## request(req, bodynil, &block) [](#method-i-request)
Replace the Gem::Net::HTTP request method with a method that converts the
request into a Rack request and dispatches it to the Rack endpoint.

**@param** [Net::HTTPRequest] A Gem::Net::HTTPRequest
object, or one if its subclasses

**@param** [optional, String, #read] This should
be sent as "rack.input". If it's a String, it will
be converted to a StringIO.

**@return** [Net::HTTPResponse] 

**@yield** [Net::HTTPResponse] If a block is provided,
this method will yield the Gem::Net::HTTPResponse to
it after the body is read.

