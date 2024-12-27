# Class: Resolv::DNS::Resource::LOC
**Inherits:** Resolv::DNS::Resource
    

Location resource


# Class Methods
## decode_rdata(msg ) [](#method-c-decode_rdata)
:nodoc:
# Attributes
## altitude[RW] [](#attribute-i-altitude)
The altitude of the LOC above a reference sphere whose surface sits 100km
below the WGS84 spheroid in centimeters as an unsigned 32bit integer

## hprecision[RW] [](#attribute-i-hprecision)
The horizontal precision using ssize type values in meters using scientific
notation as 2 integers of XeY for precision use value/2 e.g. 2m = +/-1m

## latitude[RW] [](#attribute-i-latitude)
The latitude for this LOC where 2**31 is the equator in thousandths of an arc
second as an unsigned 32bit integer

## longitude[RW] [](#attribute-i-longitude)
The longitude for this LOC where 2**31 is the prime meridian in thousandths of
an arc second as an unsigned 32bit integer

## ssize[RW] [](#attribute-i-ssize)
The spherical size of this LOC in meters using scientific notation as 2
integers of XeY

## version[RW] [](#attribute-i-version)
Returns the version value for this LOC record which should always be 00

## vprecision[RW] [](#attribute-i-vprecision)
The vertical precision using ssize type values in meters using scientific
notation as 2 integers of XeY for precision use value/2 e.g. 2m = +/-1m


#Instance Methods
## encode_rdata(msg) [](#method-i-encode_rdata)
:nodoc:

## initialize(version, ssize, hprecision, vprecision, latitude, longitude, altitude) [](#method-i-initialize)

**@return** [LOC] a new instance of LOC

