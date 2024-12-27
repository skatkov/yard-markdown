# Module: Artifice
    

This module was initially borrowed from https://github.com/wycats/artifice


# Class Methods
## activate_with(endpoint ) [](#method-c-activate_with)
Activate Artifice with a particular Rack endpoint.

Calling this method will replace the Gem::Net::HTTP system with a replacement
that routes all requests to the Rack endpoint.
**@param** [#call] A valid Rack endpoint

## deactivate() [](#method-c-deactivate)
Deactivate the Artifice replacement.
## replace_net_http(value ) [](#method-c-replace_net_http)

