# Module: OpenSSL::PKey
    

## Asymmetric Public Key Algorithms

Asymmetric public key algorithms solve the problem of establishing and sharing
secret keys to en-/decrypt messages. The key in such an algorithm consists of
two parts: a public key that may be distributed to others and a private key
that needs to remain secret.

Messages encrypted with a public key can only be decrypted by recipients that
are in possession of the associated private key. Since public key algorithms
are considerably slower than symmetric key algorithms (cf. OpenSSL::Cipher)
they are often used to establish a symmetric key shared between two parties
that are in possession of each other's public key.

Asymmetric algorithms offer a lot of nice features that are used in a lot of
different areas. A very common application is the creation and validation of
digital signatures. To sign a document, the signatory generally uses a message
digest algorithm (cf. OpenSSL::Digest) to compute a digest of the document
that is then encrypted (i.e. signed) using the private key. Anyone in
possession of the public key may then verify the signature by computing the
message digest of the original document on their own, decrypting the signature
using the signatory's public key and comparing the result to the message
digest they previously computed. The signature is valid if and only if the
decrypted signature is equal to this message digest.

The PKey module offers support for three popular public/private key
algorithms:
*   RSA (OpenSSL::PKey::RSA)
*   DSA (OpenSSL::PKey::DSA)
*   Elliptic Curve Cryptography (OpenSSL::PKey::EC)
Each of these implementations is in fact a sub-class of the abstract PKey
class which offers the interface for supporting digital signatures in the form
of PKey#sign and PKey#verify.

## Diffie-Hellman Key Exchange

Finally PKey also features OpenSSL::PKey::DH, an implementation of the
Diffie-Hellman key exchange protocol based on discrete logarithms in finite
fields, the same basis that DSA is built on. The Diffie-Hellman protocol can
be used to exchange (symmetric) keys over insecure channels without needing
any prior joint knowledge between the participating parties. As the security
of DH demands relatively long "public keys" (i.e. the part that is overtly
transmitted between participants) DH tends to be quite slow. If security or
speed is your primary concern, OpenSSL::PKey::EC offers another implementation
of the Diffie-Hellman protocol.



