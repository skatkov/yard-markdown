# Class: OpenSSL::TestCase
**Inherits:** Test::Unit::TestCase
  
**Extended by:** OpenSSL::TestUtils
    
**Includes:** OpenSSL::TestUtils, Test::Unit::CoreAssertions
  




#Instance Methods
## assert(test, *msgs) [](#method-i-assert)
:call-seq:
    assert(test, [failure_message])

Tests if `test` is true.

`msg` may be a String or a Proc. If `msg` is a String, it will be used as the
failure message. Otherwise, the result of calling `msg` will be used as the
message if the assertion fails.

If no `msg` is given, a default message will be used.

    assert(false, "This was expected to be true")

## assert_all?(obj, mnil, &blk) [](#method-i-assert_all?)

**@return** [Boolean] 

## assert_all_assertions(msgnil) [](#method-i-assert_all_assertions)

## assert_all_assertions_foreach(msgnil, *keys, &block) [](#method-i-assert_all_assertions_foreach)

## assert_deprecated_warn(mesg/deprecated/) [](#method-i-assert_deprecated_warn)

## assert_deprecated_warning(mesg/deprecated/) [](#method-i-assert_deprecated_warning)

## assert_file() [](#method-i-assert_file)

## assert_in_out_err(args, test_stdin"", test_stdout[], test_stderr[], messagenil, success:nil, **opt) [](#method-i-assert_in_out_err)

## assert_join_threads(threads, messagenil) [](#method-i-assert_join_threads)
threads should respond to shift method. Array can be used.

## assert_linear_performance(seq, rehearsal:nil, pre:->(n) {n}) [](#method-i-assert_linear_performance)
Expect `seq` to respond to `first` and `each` methods, e.g., Array, Range,
Enumerator::ArithmeticSequence and other Enumerable-s, and each elements
should be size factors.

:yield: each elements of `seq`.

## assert_no_memory_leak(args, prepare, code, messagenil, limit:2.0, rss:false, **opt) [](#method-i-assert_no_memory_leak)

## assert_normal_exit(testsrc, message'', child_env:nil, **opt) [](#method-i-assert_normal_exit)

## assert_not_respond_to(obj, meth, *priv, msgnil) [](#method-i-assert_not_respond_to)
:call-seq:
    assert_not_respond_to( object, method, failure_message = nil )

Tests if the given Object does not respond to `method`.

An optional failure message may be provided as the final argument.

    assert_not_respond_to("hello", :reverse)  #Fails
    assert_not_respond_to("hello", :does_not_exist)  #Succeeds

## assert_nothing_raised(*args) [](#method-i-assert_nothing_raised)
:call-seq:
    assert_nothing_raised( *args, &block )

If any exceptions are given as arguments, the assertion will fail if one of
those exceptions are raised. Otherwise, the test fails if any exceptions are
raised.

The final argument may be a failure message.

    assert_nothing_raised RuntimeError do
      raise Exception #Assertion passes, Exception is not a RuntimeError
    end

    assert_nothing_raised do
      raise Exception #Assertion fails
    end

## assert_pattern_list(pattern_list, actual, messagenil) [](#method-i-assert_pattern_list)
pattern_list is an array which contains regexp, string and :*. :* means any
sequence.

pattern_list is anchored. Use [:*, regexp/string, :*] for non-anchored match.

## assert_ractor(src, args:[], require:nil, require_relative:nil, file:nil, line:nil, ignore_stderr:nil, **opt) [](#method-i-assert_ractor)
Run Ractor-related test without influencing the main test suite

## assert_raise(*exp, &b) [](#method-i-assert_raise)
:call-seq:
    assert_raise( *args, &block )

Tests if the given block raises an exception. Acceptable exception types may
be given as optional arguments. If the last argument is a String, it will be
used as the error message.

    assert_raise do #Fails, no Exceptions are raised
    end

    assert_raise NameError do
      puts x  #Raises NameError, so assertion succeeds
    end

## assert_raise_with_message(exception, expected, msgnil, &block) [](#method-i-assert_raise_with_message)
:call-seq:
    assert_raise_with_message(exception, expected, msg = nil, &block)

Tests if the given block raises an exception with the expected message.

    assert_raise_with_message(RuntimeError, "foo") do
      nil #Fails, no Exceptions are raised
    end

    assert_raise_with_message(RuntimeError, "foo") do
      raise ArgumentError, "foo" #Fails, different Exception is raised
    end

    assert_raise_with_message(RuntimeError, "foo") do
      raise "bar" #Fails, RuntimeError is raised but the message differs
    end

    assert_raise_with_message(RuntimeError, "foo") do
      raise "foo" #Raises RuntimeError with the message, so assertion succeeds
    end

## assert_respond_to(obj, meth, *priv, msgnil) [](#method-i-assert_respond_to)
:call-seq:
    assert_respond_to( object, method, failure_message = nil )

Tests if the given Object responds to `method`.

An optional failure message may be provided as the final argument.

    assert_respond_to("hello", :reverse)  #Succeeds
    assert_respond_to("hello", :does_not_exist)  #Fails

## assert_ruby_status(args, test_stdin"", messagenil, **opt) [](#method-i-assert_ruby_status)

## assert_separately(args, filenil, linenil, src, ignore_stderr:nil, **opt) [](#method-i-assert_separately)

## assert_throw(tag, msgnil) [](#method-i-assert_throw)
:call-seq:
    assert_throw( tag, failure_message = nil, &block )

Fails unless the given block throws `tag`, returns the caught value otherwise.

An optional failure message may be provided as the final argument.

    tag = Object.new
    assert_throw(tag, "#{tag} was not thrown!") do
      throw tag
    end

## assert_valid_syntax(code, *args, **opt) [](#method-i-assert_valid_syntax)

## assert_warn(*args) [](#method-i-assert_warn)

## assert_warning(pat, msgnil) [](#method-i-assert_warning)

## diff(exp, act) [](#method-i-diff)

## mu_pp(obj) [](#method-i-mu_pp)
:nodoc:

## new_test_token() [](#method-i-new_test_token)

## omit_on_fips() [](#method-i-omit_on_fips)
Omit the tests in FIPS.

For example, the password based encryption used in the PEM format uses MD5 for
deriving the encryption key from the password, and MD5 is not FIPS-approved.

See
https://github.com/openssl/openssl/discussions/21830#discussioncomment-6865636
for details.

## omit_on_non_fips() [](#method-i-omit_on_non_fips)

## prepare_syntax_check(code, fnamenil, mesgnil, verbose:nil) [](#method-i-prepare_syntax_check)

## separated_runner(token, outnil) [](#method-i-separated_runner)

## setup() [](#method-i-setup)

## syntax_check(code, fname, line) [](#method-i-syntax_check)

## teardown() [](#method-i-teardown)

