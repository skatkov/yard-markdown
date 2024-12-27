# Class: TestSecureRandom
**Inherits:** Test::Unit::TestCase
    

This testcase does NOT aim to test cryptographically strongness and
randomness.



#Instance Methods
## check_forking_random_bytes(target_pid, target) [](#method-i-check_forking_random_bytes)

## forking_random_bytes() [](#method-i-forking_random_bytes)
[ENV]("CI") && RUBY_PLATFORM =~ /darwin/ && `sw_vers -productVersion`.to_i >
13 # for Apple Silicon

## setup() [](#method-i-setup)

## test_alphanumeric_with_chars() [](#method-i-test_alphanumeric_with_chars)

## test_repeated_gen_random() [](#method-i-test_repeated_gen_random)

## test_s_random_bytes_is_fork_safe() [](#method-i-test_s_random_bytes_is_fork_safe)
This test took 2 minutes on my machine. And 65536 times loop could not be
enough for forcing PID recycle. TODO: We should run this test only on GitHub
Actions.

## test_with_openssl() [](#method-i-test_with_openssl)

