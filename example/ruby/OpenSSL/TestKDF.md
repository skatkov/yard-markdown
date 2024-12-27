# Class: OpenSSL::TestKDF
**Inherits:** OpenSSL::TestCase
    




#Instance Methods
## test_hkdf_rfc5869_test_case_1() [](#method-i-test_hkdf_rfc5869_test_case_1)

## test_hkdf_rfc5869_test_case_3() [](#method-i-test_hkdf_rfc5869_test_case_3)

## test_hkdf_rfc5869_test_case_4() [](#method-i-test_hkdf_rfc5869_test_case_4)

## test_pbkdf2_hmac_sha1_rfc6070_c_1_len_20() [](#method-i-test_pbkdf2_hmac_sha1_rfc6070_c_1_len_20)

## test_pbkdf2_hmac_sha1_rfc6070_c_2_len_20() [](#method-i-test_pbkdf2_hmac_sha1_rfc6070_c_2_len_20)

## test_pbkdf2_hmac_sha1_rfc6070_c_4096_len_16() [](#method-i-test_pbkdf2_hmac_sha1_rfc6070_c_4096_len_16)

## test_pbkdf2_hmac_sha1_rfc6070_c_4096_len_20() [](#method-i-test_pbkdf2_hmac_sha1_rfc6070_c_4096_len_20)

## test_pbkdf2_hmac_sha1_rfc6070_c_4096_len_25() [](#method-i-test_pbkdf2_hmac_sha1_rfc6070_c_4096_len_25)
takes too long!
    def test_pbkdf2_hmac_sha1_rfc6070_c_16777216_len_20
      p ="password"
      s = "salt"
      c = 16777216
      dk_len = 20
      raw = %w{ ee fe 3d 61 cd 4d a4 e4
                e9 94 5b 3d 6b a2 15 8c
                26 34 e9 84 }
      expected = [raw.join('')].pack('H*')
      value = OpenSSL::KDF.pbkdf2_hmac(p, salt: s, iterations: c, length: dk_len, hash: "sha1")
      assert_equal(expected, value)
    end

## test_pbkdf2_hmac_sha256_c_20000_len_32() [](#method-i-test_pbkdf2_hmac_sha256_c_20000_len_32)

## test_pkcs5_pbkdf2_hmac_compatibility() [](#method-i-test_pkcs5_pbkdf2_hmac_compatibility)

## test_scrypt_rfc7914_first() [](#method-i-test_scrypt_rfc7914_first)

## test_scrypt_rfc7914_second() [](#method-i-test_scrypt_rfc7914_second)

