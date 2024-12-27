# Class: Test::Unit::Runner
**Inherits:** Object
    
**Includes:** Test::Unit::ExcludesOption, Test::Unit::GCOption, Test::Unit::GlobOption, Test::Unit::LaunchableOption::Nothing, Test::Unit::LoadPathOption, Test::Unit::Options, Test::Unit::OutputOption, Test::Unit::Parallel, Test::Unit::RepeatOption, Test::Unit::RunCount, Test::Unit::Skipping, Test::Unit::Statistics, Test::Unit::StatusLine, Test::Unit::TimeoutOption
  

:nodoc: all


# Class Methods
## after_tests(&block ) [](#method-c-after_tests)
A simple hook allowing you to run a block of code after *all* of the tests are
done. Eg:

    Test::Unit::Runner.after_tests { p $debugging_info }
## autorun() [](#method-c-autorun)
## current_repeat_count() [](#method-c-current_repeat_count)
Runner for a given `type` (eg, test vs bench).
## output() [](#method-c-output)
Returns the stream to use for output.
## output=(stream ) [](#method-c-output=)
Sets Test::Unit::Runner to write output to `stream`.  $stdout is the default
output
## plugins() [](#method-c-plugins)
Return all plugins' run methods (methods that start with "run_").
## runner() [](#method-c-runner)
Returns the Test::Unit::Runner subclass instance that will be used to run the
tests. A Test::Unit::Runner instance is the default runner.
## runner=(runner ) [](#method-c-runner=)
Tells Test::Unit::Runner to delegate to `runner`, an instance of a
Test::Unit::Runner subclass, when Test::Unit::Runner#run is called.
# Attributes
## assertion_count[RW] [](#attribute-i-assertion_count)
:nodoc:

## errors[RW] [](#attribute-i-errors)
:nodoc:

## failures[RW] [](#attribute-i-failures)
:nodoc:

## help[RW] [](#attribute-i-help)
:nodoc:

## info_signal[RW] [](#attribute-i-info_signal)
:attr:

if true, installs an "INFO" signal handler (only available to BSD and OS X
users) which prints diagnostic information about the test run.

This is auto-detected by default but may be overridden by custom runners.

## options[RW] [](#attribute-i-options)
Lazy accessor for options.

## report[RW] [](#attribute-i-report)
:nodoc:

## skips[RW] [](#attribute-i-skips)
:nodoc:

## start_time[RW] [](#attribute-i-start_time)
:nodoc:

## test_count[RW] [](#attribute-i-test_count)
:nodoc:

## verbose[RW] [](#attribute-i-verbose)
:nodoc:


#Instance Methods
## _end_method(inst) [](#method-i-_end_method)

## _prepare_run(suites, type) [](#method-i-_prepare_run)

## _print(s) [](#method-i-_print)

## _run(args[]) [](#method-i-_run)
Top level driver, controls all output and filtering.

## _run_anything(type) [](#method-i-_run_anything)

## _run_suite(suite, type) [](#method-i-_run_suite)
Run a single `suite` for a given `type`.

## _start_method(inst) [](#method-i-_start_method)

## add_status(line) [](#method-i-add_status)

## complement_test_name(f, orig_f) [](#method-i-complement_test_name)

**@raise** [ArgumentError] 

## del_jobs_status() [](#method-i-del_jobs_status)

## del_status_line(flushtrue) [](#method-i-del_status_line)

## failed(s) [](#method-i-failed)

## initialize() [](#method-i-initialize)
Writes status for failed test `meth` in `klass` which finished with exception
`e`

**@return** [Runner] a new instance of Runner

## inspect() [](#method-i-inspect)

## jobs_status(worker) [](#method-i-jobs_status)

## location(e) [](#method-i-location)
:nodoc:

## new_test(s) [](#method-i-new_test)

## non_options(files, options) [](#method-i-non_options)

## option_parser() [](#method-i-option_parser)

## output() [](#method-i-output)
Return the IO for output.

## print(*a) [](#method-i-print)
:nodoc:

## process_args(args[]) [](#method-i-process_args)

## puke(klass, meth, e) [](#method-i-puke)
Overriding of Test::Unit::Runner#puke

## puts(*a) [](#method-i-puts)
:nodoc:

## record(suite, method, assertions, time, error, source_locationnil) [](#method-i-record)
Record the result of a single test. Makes it very easy to gather information.
Eg:

    class StatisticsRecorder < Test::Unit::Runner
      def record suite, method, assertions, time, error
        # ... record the results somewhere ...
      end
    end

    Test::Unit::Runner.runner = StatisticsRecorder.new

NOTE: record might be sent more than once per test.  It will be sent once with
the results from the test itself.  If there is a failure or error in teardown,
it will be sent again with the error or failure.

## run(argv[]) [](#method-i-run)
Begins the full test run. Delegates to `runner`'s #_run method.

## run_tests() [](#method-i-run_tests)
Runs test suites matching `filter`.

## setup_options(parser, options) [](#method-i-setup_options)

## status(ioself.output) [](#method-i-status)
Writes status to `io`

## succeed() [](#method-i-succeed)

## synchronize() [](#method-i-synchronize)
:nodoc:

## terminal_width() [](#method-i-terminal_width)

## update_list(list, rec, max) [](#method-i-update_list)

## update_status(s) [](#method-i-update_status)

