# Class: Gem::MultifactorAuthFetcher
**Inherits:** Gem::FakeFetcher
    



# Attributes
## host[RW] [](#attribute-i-host)
Returns the value of attribute host.

## webauthn_url[RW] [](#attribute-i-webauthn_url)
Returns the value of attribute webauthn_url.


#Instance Methods
## initialize(host:nil) [](#method-i-initialize)
GET /api/v1/webauthn_verification defaults to user does not have any security
devices

**@return** [MultifactorAuthFetcher] a new instance of MultifactorAuthFetcher

## respond_with_require_otp(url, success_body) [](#method-i-respond_with_require_otp)
given a url, return a response that requires multifactor authentication

## respond_with_webauthn_polling(code) [](#method-i-respond_with_webauthn_polling)
GET /api/v1/webauthn_verification/:token/status.json returns success status
with OTP code

## respond_with_webauthn_polling_failure() [](#method-i-respond_with_webauthn_polling_failure)
GET /api/v1/webauthn_verification/:token/status.json returns expired status

## respond_with_webauthn_url() [](#method-i-respond_with_webauthn_url)
GET /api/v1/webauthn_verification returns a webauthn url GET
/api/v1/webauthn_verification/:token/status.json (polling url) returns pending
status

## webauthn_url_with_port(port) [](#method-i-webauthn_url_with_port)

