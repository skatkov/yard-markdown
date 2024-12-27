# Class: TestIterator::ITER_TEST4
**Inherits:** TestIterator::ITER_TEST3
    
**Includes:** Test::Unit::Assertions
  




#Instance Methods
## _assertions() [](#method-i-_assertions)
:nodoc:

## _assertions=(n) [](#method-i-_assertions=)
:nodoc:

## assert(test, msgnil) [](#method-i-assert)
Fails unless `test` is a true value.

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

## assert_empty(obj, msgnil) [](#method-i-assert_empty)
Fails unless `obj` is empty.

## assert_equal(exp, act, msgnil) [](#method-i-assert_equal)
:call-seq:
    assert_equal( expected, actual, failure_message = nil )

Tests if `expected` is equal to `actual`.

An optional failure message may be provided as the final argument.

## assert_false(obj, msgnil) [](#method-i-assert_false)
Fails unless `obj` is false

## assert_fixnum(v, msgnil) [](#method-i-assert_fixnum)

## assert_in_delta(exp, act, delta0.001, msgnil) [](#method-i-assert_in_delta)
For comparing Floats.  Fails unless `exp` and `act` are within `delta` of each
other.

    assert_in_delta Math::PI, (22.0 / 7.0), 0.01

## assert_in_epsilon(a, b, epsilon0.001, msgnil) [](#method-i-assert_in_epsilon)
For comparing Floats.  Fails unless `exp` and `act` have a relative error less
than `epsilon`.

## assert_includes(collection, obj, msgnil) [](#method-i-assert_includes)
Fails unless `collection` includes `obj`.

## assert_instance_of(cls, obj, msgnil) [](#method-i-assert_instance_of)
Fails unless `obj` is an instance of `cls`.

## assert_is_minus_zero(f) [](#method-i-assert_is_minus_zero)

## assert_kind_of(cls, obj, msgnil) [](#method-i-assert_kind_of)
Fails unless `obj` is a kind of `cls`.

## assert_match(matcher, obj, msgnil) [](#method-i-assert_match)
Fails unless `matcher` `=~` `obj`.

## assert_nil(obj, msgnil) [](#method-i-assert_nil)
Fails unless `obj` is nil

## assert_no_match(regexp, string, msgnil) [](#method-i-assert_no_match)
:call-seq:
    assert_no_match( regexp, string, failure_message = nil )

Tests if the given Regexp does not match a given String.

An optional failure message may be provided as the final argument.

## assert_no_warning(pat, msgnil) [](#method-i-assert_no_warning)

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

## assert_predicate(o1, op, msgnil) [](#method-i-assert_predicate)
For testing with predicates.

    assert_predicate str, :empty?

This is really meant for specs and is front-ended by assert_operator:

    str.must_be :empty?

## assert_raises(*exp, &b) [](#method-i-assert_raises)

**@raise** [NoMethodError] 

## assert_respond_to(obj, meth, msgnil) [](#method-i-assert_respond_to)
Fails unless `obj` responds to `meth`.

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

## assert_silent() [](#method-i-assert_silent)
Fails if the block outputs anything to stderr or stdout.

See also: #assert_output

## assert_syntax_error(code, error, *args, **opt) [](#method-i-assert_syntax_error)

## assert_throws(sym, msgnil) [](#method-i-assert_throws)
Fails unless the block throws `sym`

## assert_true(obj, msgnil) [](#method-i-assert_true)
Fails unless `obj` is true

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

## diff(exp, act) [](#method-i-diff)
Returns a diff between `exp` and `act`. If there is no known diff command or
if it doesn't make sense to diff the output (single line, short output), then
it simply returns a basic comparison between the two.

## flunk(msgnil) [](#method-i-flunk)
Fails with `msg`

## foo(x) [](#method-i-foo)

## message(msgnil, endingnil, &default) [](#method-i-message)
Returns a proc that will output `msg` along with the default message.

## mu_pp_for_diff(obj) [](#method-i-mu_pp_for_diff)
This returns a diff-able human-readable version of `obj`. This differs from
the regular mu_pp because it expands escaped newlines and makes hex-values
generic (like object_ids). This uses mu_pp to do the first pass and then
cleans it up.

## pass(msgnil) [](#method-i-pass)
used for counting assertions

## pend(msgnil, btcaller, &_) [](#method-i-pend)
Skips the current test. Gets listed at the end of the run but doesn't cause a
failure exit code.

**@raise** [Test::Unit::PendedError] 

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

## skip(msgnil, btcaller) [](#method-i-skip)

**@raise** [NoMethodError] 

## skipped?() [](#method-i-skipped?)
Was this testcase skipped? Meant for #teardown.

**@return** [Boolean] 

## synchronize() [](#method-i-synchronize)
Takes a block and wraps it with the runner's shared mutex.

