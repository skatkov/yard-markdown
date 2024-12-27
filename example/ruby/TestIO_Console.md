# Class: TestIO_Console
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## set_winsize_setup() [](#method-i-set_winsize_setup)
FreeBSD seems to hang on TTOU when running parallel tests tested on FreeBSD
11.x.

Solaris gets stuck too, even in non-parallel mode. It occurs only in chkbuild.
 It does not occur when running `make test-all` in SSH terminal.

I suspect that it occurs only when having no TTY. (Parallel mode runs tests in
child processes, so I guess they has no TTY.) But it does not occur in `make
test-all > /dev/null`, so there should be an additional factor, I guess.

## set_winsize_teardown() [](#method-i-set_winsize_teardown)

## test_bad_keyword() [](#method-i-test_bad_keyword)

## test_failed_path() [](#method-i-test_failed_path)

