# Class: Test::Unit::TestCase
**Inherits:** Object
  
**Extended by:** Test::Unit::Guard
    
**Includes:** GCCompactChecker, GCDisabledChecker, Test::Unit::Assertions, Test::Unit::CoreAssertions, Test::Unit::Guard, Test::Unit::LifecycleHooks, TracePointChecker::ZombieTraceHunter, ZombieHunter
  

Subclass TestCase to create your own tests. Typically you'll want a TestCase
subclass per implementation class.

See `Test::Unit::AssertionFailedError`s


# Class Methods
## add(*name , &b ) [](#method-c-add)
## add_proc_meminfo(file , fields ) [](#method-c-add_proc_meminfo)
## current() [](#method-c-current)
:nodoc:
## inherited(klass ) [](#method-c-inherited)
:nodoc:
## jruby?(platform RUBY_PLATFORM) [](#method-c-jruby?)
Is this running on jruby?
**@return** [Boolean] 

## method_added(name ) [](#method-c-method_added)
**@private** [] 

## mingw?(platform RUBY_PLATFORM) [](#method-c-mingw?)
Is this running on mingw?
**@return** [Boolean] 

## mri?(platform RUBY_DESCRIPTION) [](#method-c-mri?)
Is this running on mri?
**@return** [Boolean] 

## on_parallel_worker?() [](#method-c-on_parallel_worker?)
**@return** [Boolean] 

## reset() [](#method-c-reset)
:nodoc:
## test_methods() [](#method-c-test_methods)
:nodoc:
## test_suites() [](#method-c-test_suites)
:nodoc:
## windows?(platform RUBY_PLATFORM) [](#method-c-windows?)
Is this running on windows?
**@return** [Boolean] 

# Attributes
## test_order[RW] [](#attribute-c-test_order)

## __name__[RW] [](#attribute-i-__name__)
:nodoc:


#Instance Methods
## _assertions() [](#method-i-_assertions)
:nodoc:

## _assertions=(n) [](#method-i-_assertions=)
:nodoc:

## after_setup() [](#method-i-after_setup)
Runs before every test, after setup. This hook is meant for libraries to
extend Test::Unit. It is not meant to be used by test developers.

See #before_setup for an example.

## after_teardown() [](#method-i-after_teardown)

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

## assert_bignum(v, msgnil) [](#method-i-assert_bignum)

## assert_block(*msgs) [](#method-i-assert_block)
:call-seq:
    assert_block( failure_message = nil )

Tests the result of the given block. If the block does not return true, the
assertion will fail. The optional `failure_message` argument is the same as in
Assertions#assert.

    assert_block do
      [1, 2, 3].any? { |num| num < 1 }
    end

## assert_cpu_usage_low(msgnil, pct:0.05, wait:1.0, stop:nil) [](#method-i-assert_cpu_usage_low)

## assert_deprecated_warn(mesg/deprecated/) [](#method-i-assert_deprecated_warn)

## assert_deprecated_warning(mesg/deprecated/) [](#method-i-assert_deprecated_warning)

## assert_empty(obj, msgnil) [](#method-i-assert_empty)
Fails unless `obj` is empty.

## assert_equal(exp, act, msgnil) [](#method-i-assert_equal)
:call-seq:
    assert_equal( expected, actual, failure_message = nil )

Tests if `expected` is equal to `actual`.

An optional failure message may be provided as the final argument.

## assert_false(obj, msgnil) [](#method-i-assert_false)
Fails unless `obj` is false

## assert_file() [](#method-i-assert_file)

## assert_fixnum(v, msgnil) [](#method-i-assert_fixnum)

## assert_in_delta(exp, act, delta0.001, msgnil) [](#method-i-assert_in_delta)
For comparing Floats.  Fails unless `exp` and `act` are within `delta` of each
other.

    assert_in_delta Math::PI, (22.0 / 7.0), 0.01

## assert_in_epsilon(a, b, epsilon0.001, msgnil) [](#method-i-assert_in_epsilon)
For comparing Floats.  Fails unless `exp` and `act` have a relative error less
than `epsilon`.

## assert_in_out_err(args, test_stdin"", test_stdout[], test_stderr[], messagenil, success:nil, **opt) [](#method-i-assert_in_out_err)

## assert_includes(collection, obj, msgnil) [](#method-i-assert_includes)
Fails unless `collection` includes `obj`.

## assert_instance_of(cls, obj, msgnil) [](#method-i-assert_instance_of)
Fails unless `obj` is an instance of `cls`.

## assert_is_minus_zero(f) [](#method-i-assert_is_minus_zero)

## assert_join_threads(threads, messagenil) [](#method-i-assert_join_threads)
threads should respond to shift method. Array can be used.

## assert_kind_of(cls, obj, msgnil) [](#method-i-assert_kind_of)
Fails unless `obj` is a kind of `cls`.

## assert_linear_performance(seq, rehearsal:nil, pre:->(n) {n}) [](#method-i-assert_linear_performance)
Expect `seq` to respond to `first` and `each` methods, e.g., Array, Range,
Enumerator::ArithmeticSequence and other Enumerable-s, and each elements
should be size factors.

:yield: each elements of `seq`.

## assert_match(matcher, obj, msgnil) [](#method-i-assert_match)
Fails unless `matcher` `=~` `obj`.

## assert_nil(obj, msgnil) [](#method-i-assert_nil)
Fails unless `obj` is nil

## assert_no_match(regexp, string, msgnil) [](#method-i-assert_no_match)
:call-seq:
    assert_no_match( regexp, string, failure_message = nil )

Tests if the given Regexp does not match a given String.

An optional failure message may be provided as the final argument.

## assert_no_memory_leak(args, prepare, code, messagenil, limit:2.0, rss:false, **opt) [](#method-i-assert_no_memory_leak)

## assert_no_warning(pat, msgnil) [](#method-i-assert_no_warning)

## assert_normal_exit(testsrc, message'', child_env:nil, **opt) [](#method-i-assert_normal_exit)

## assert_not_all?(obj, mnil, &blk) [](#method-i-assert_not_all?)

**@return** [Boolean] 

## assert_not_equal(exp, act, msgnil) [](#method-i-assert_not_equal)
:call-seq:
    assert_not_equal( expected, actual, failure_message = nil )

Tests if `expected` is not equal to `actual`.

An optional failure message may be provided as the final argument.

## assert_not_nil(exp, msgnil) [](#method-i-assert_not_nil)
:call-seq:
    assert_not_nil( expression, failure_message = nil )

Tests if `expression` is not nil.

An optional failure message may be provided as the final argument.

## assert_not_respond_to(obj, meth, *priv, msgnil) [](#method-i-assert_not_respond_to)
:call-seq:
    assert_not_respond_to( object, method, failure_message = nil )

Tests if the given Object does not respond to `method`.

An optional failure message may be provided as the final argument.

    assert_not_respond_to("hello", :reverse)  #Fails
    assert_not_respond_to("hello", :does_not_exist)  #Succeeds

## assert_not_same(expected, actual, message"") [](#method-i-assert_not_same)
:call-seq:
    assert_not_same( expected, actual, failure_message = nil )

Tests if `expected` is not the same object as `actual`. This test uses
Object#equal? to test equality.

An optional failure message may be provided as the final argument.

    assert_not_same("x", "x") #Succeeds

## assert_not_send(send_ary, mnil) [](#method-i-assert_not_send)
:call-seq:
    assert_not_send( +send_array+, failure_message = nil )

Passes if the method send doesn't return a true value.

`send_array` is composed of:
*   A receiver
*   A method
*   Arguments to the method

Example:
    assert_not_send([[1, 2], :member?, 1]) # -> fail
    assert_not_send([[1, 2], :member?, 4]) # -> pass

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

## assert_nothing_thrown(msgnil) [](#method-i-assert_nothing_thrown)
:call-seq:
    assert_nothing_thrown( failure_message = nil, &block )

Fails if the given block uses a call to Kernel#throw, and returns the result
of the block otherwise.

An optional failure message may be provided as the final argument.

    assert_nothing_thrown "Something was thrown!" do
      throw :problem?
    end

## assert_operator(o1, op, o2(predicate = true; nil), msgnil) [](#method-i-assert_operator)
For testing with binary operators.

    assert_operator 5, :<=, 4

## assert_output(stdoutnil, stderrnil) [](#method-i-assert_output)
Fails if stdout or stderr do not output the expected results. Pass in nil if
you don't care about that streams output. Pass in "" if you require it to be
silent. Pass in a regexp if you want to pattern match.

NOTE: this uses #capture_io, not #capture_subprocess_io.

See also: #assert_silent

## assert_path_exists(path, msgnil) [](#method-i-assert_path_exists)

## assert_pattern_list(pattern_list, actual, messagenil) [](#method-i-assert_pattern_list)
pattern_list is an array which contains regexp, string and :*. :* means any
sequence.

pattern_list is anchored. Use [:*, regexp/string, :*] for non-anchored match.

## assert_predicate(o1, op, msgnil) [](#method-i-assert_predicate)
For testing with predicates.

    assert_predicate str, :empty?

This is really meant for specs and is front-ended by assert_operator:

    str.must_be :empty?

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

## assert_raises(*exp, &b) [](#method-i-assert_raises)

**@raise** [NoMethodError] 

## assert_respond_to(obj, meth, *priv, msgnil) [](#method-i-assert_respond_to)
:call-seq:
    assert_respond_to( object, method, failure_message = nil )

Tests if the given Object responds to `method`.

An optional failure message may be provided as the final argument.

    assert_respond_to("hello", :reverse)  #Succeeds
    assert_respond_to("hello", :does_not_exist)  #Fails

## assert_ruby_status(args, test_stdin"", messagenil, **opt) [](#method-i-assert_ruby_status)

## assert_same(exp, act, msgnil) [](#method-i-assert_same)
Fails unless `exp` and `act` are #equal?

## assert_send(send_ary, mnil) [](#method-i-assert_send)
:call-seq:
    assert_send( +send_array+, failure_message = nil )

Passes if the method send returns a true value.

`send_array` is composed of:
*   A receiver
*   A method
*   Arguments to the method

Example:
    assert_send(["Hello world", :include?, "Hello"])    # -> pass
    assert_send(["Hello world", :include?, "Goodbye"])  # -> fail

## assert_separately(args, filenil, linenil, src, ignore_stderr:nil, **opt) [](#method-i-assert_separately)

## assert_silent() [](#method-i-assert_silent)
Fails if the block outputs anything to stderr or stdout.

See also: #assert_output

## assert_syntax_error(code, error, *args, **opt) [](#method-i-assert_syntax_error)

## assert_throw(tag, msgnil) [](#method-i-assert_throw)
:call-seq:
    assert_throw( tag, failure_message = nil, &block )

Fails unless the given block throws `tag`, returns the caught value otherwise.

An optional failure message may be provided as the final argument.

    tag = Object.new
    assert_throw(tag, "#{tag} was not thrown!") do
      throw tag
    end

## assert_throws(sym, msgnil) [](#method-i-assert_throws)
Fails unless the block throws `sym`

## assert_true(obj, msgnil) [](#method-i-assert_true)
Fails unless `obj` is true

## assert_valid_syntax(code, *args, **opt) [](#method-i-assert_valid_syntax)

## assert_warn(*args) [](#method-i-assert_warn)

## assert_warning(pat, msgnil) [](#method-i-assert_warning)

## before_setup() [](#method-i-before_setup)

## before_teardown() [](#method-i-before_teardown)
Runs after every test, before teardown. This hook is meant for libraries to
extend Test::Unit. It is not meant to be used by test developers.

See #before_setup for an example.

## build_message(head, templatenil, *arguments) [](#method-i-build_message)
:nodoc:

## capture_io() [](#method-i-capture_io)

**@raise** [NoMethodError] 

## capture_output() [](#method-i-capture_output)
Captures $stdout and $stderr into strings:

    out, err = capture_output do
      puts "Some info"
      warn "You did a bad thing"
    end

    assert_match %r%info%, out
    assert_match %r%bad%, err

## clean(s) [](#method-i-clean)

## diff(exp, act) [](#method-i-diff)

## flunk(msgnil) [](#method-i-flunk)
Fails with `msg`

## initialize(name) [](#method-i-initialize)
:nodoc:

**@return** [TestCase] a new instance of TestCase

## io() [](#method-i-io)
Return the output IO object

## io?() [](#method-i-io?)
Have we hooked up the IO yet?

**@return** [Boolean] 

## jruby?(platformRUBY_PLATFORM) [](#method-i-jruby?)
Is this running on jruby?

**@return** [Boolean] 

## memprofile_test_all_result_result() [](#method-i-memprofile_test_all_result_result)

## message(msgnil, endingnil, &default) [](#method-i-message)
Returns a proc that will output `msg` along with the default message.

## mingw?(platformRUBY_PLATFORM) [](#method-i-mingw?)
Is this running on mingw?

**@return** [Boolean] 

## mri?(platformRUBY_DESCRIPTION) [](#method-i-mri?)
Is this running on mri?

**@return** [Boolean] 

## mu_pp(obj) [](#method-i-mu_pp)
:nodoc:

## mu_pp_for_diff(obj) [](#method-i-mu_pp_for_diff)
This returns a diff-able human-readable version of `obj`. This differs from
the regular mu_pp because it expands escaped newlines and makes hex-values
generic (like object_ids). This uses mu_pp to do the first pass and then
cleans it up.

## new_test_token() [](#method-i-new_test_token)

## on_parallel_worker?() [](#method-i-on_parallel_worker?)

**@return** [Boolean] 

## orig_run() [](#method-i-orig_run)

## pass(msgnil) [](#method-i-pass)
used for counting assertions

## passed?() [](#method-i-passed?)
Returns true if the test passed.

**@return** [Boolean] 

## pend(msgnil, btcaller, &_) [](#method-i-pend)
Skips the current test. Gets listed at the end of the run but doesn't cause a
failure exit code.

**@raise** [Test::Unit::PendedError] 

## prepare_syntax_check(code, fnamenil, mesgnil, verbose:nil) [](#method-i-prepare_syntax_check)

## refute(test, msgnil) [](#method-i-refute)
Fails if `test` is a true value

## refute_empty(obj, msgnil) [](#method-i-refute_empty)
Fails if `obj` is empty.

## refute_equal(exp, act, msgnil) [](#method-i-refute_equal)
Fails if `exp == act`.

For floats use refute_in_delta.

## refute_in_delta(exp, act, delta0.001, msgnil) [](#method-i-refute_in_delta)
For comparing Floats.  Fails if `exp` is within `delta` of `act`.

    refute_in_delta Math::PI, (22.0 / 7.0)

## refute_in_epsilon(a, b, epsilon0.001, msgnil) [](#method-i-refute_in_epsilon)
For comparing Floats.  Fails if `exp` and `act` have a relative error less
than `epsilon`.

## refute_includes(collection, obj, msgnil) [](#method-i-refute_includes)
Fails if `collection` includes `obj`.

## refute_instance_of(cls, obj, msgnil) [](#method-i-refute_instance_of)
Fails if `obj` is an instance of `cls`.

## refute_kind_of(cls, obj, msgnil) [](#method-i-refute_kind_of)
Fails if `obj` is a kind of `cls`.

## refute_match(matcher, obj, msgnil) [](#method-i-refute_match)
Fails if `matcher` `=~` `obj`.

## refute_nil(obj, msgnil) [](#method-i-refute_nil)
Fails if `obj` is nil.

## refute_operator(o1, op, o2(predicate = true; nil), msgnil) [](#method-i-refute_operator)
Fails if `o1` is not `op` `o2`. Eg:

    refute_operator 1, :>, 2 #=> pass
    refute_operator 1, :<, 2 #=> fail

## refute_path_exists(path, msgnil) [](#method-i-refute_path_exists)

## refute_predicate(o1, op, msgnil) [](#method-i-refute_predicate)
For testing with predicates.

    refute_predicate str, :empty?

This is really meant for specs and is front-ended by refute_operator:

    str.wont_be :empty?

## refute_respond_to(obj, meth, msgnil) [](#method-i-refute_respond_to)
Fails if `obj` responds to the message `meth`.

## refute_same(exp, act, msgnil) [](#method-i-refute_same)
Fails if `exp` is the same (by object identity) as `act`.

## run(runner) [](#method-i-run)
Runs the tests reporting the status to `runner`

## run_test(name) [](#method-i-run_test)

## separated_runner(token, outnil) [](#method-i-separated_runner)

## setup() [](#method-i-setup)
Runs before every test. Use this to set up before each test run.

## skip(msgnil, btcaller) [](#method-i-skip)

**@raise** [NoMethodError] 

## skipped?() [](#method-i-skipped?)
Was this testcase skipped? Meant for #teardown.

**@return** [Boolean] 

## synchronize() [](#method-i-synchronize)
Takes a block and wraps it with the runner's shared mutex.

## syntax_check(code, fname, line) [](#method-i-syntax_check)

## teardown() [](#method-i-teardown)
Runs after every test. Use this to clean up after each test run.

## tracepoint_capture_stat_get() [](#method-i-tracepoint_capture_stat_get)

## windows?(platformRUBY_PLATFORM) [](#method-i-windows?)
Is this running on windows?

**@return** [Boolean] 

