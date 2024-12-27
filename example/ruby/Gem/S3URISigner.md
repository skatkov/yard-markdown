# Class: Gem::S3URISigner
**Inherits:** Object
    

S3URISigner implements AWS SigV4 for S3 Source to avoid a dependency on the
aws-sdk-* gems More on AWS SigV4:
https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests
.html


# Attributes
## uri[RW] [](#attribute-i-uri)
Returns the value of attribute uri.


#Instance Methods
## initialize(uri) [](#method-i-initialize)

**@return** [S3URISigner] a new instance of S3URISigner

## sign(expiration86_400) [](#method-i-sign)
Signs S3 URI using query-params according to the reference:
https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html

