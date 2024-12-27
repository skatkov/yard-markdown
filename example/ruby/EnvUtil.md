# Module: EnvUtil
    



# Class Methods
## apply_timeout_scale(t ) [](#method-c-apply_timeout_scale)
## capture_global_values() [](#method-c-capture_global_values)
## default_warning() [](#method-c-default_warning)
## diagnostic_reports(signame , pid , now ) [](#method-c-diagnostic_reports)
## failure_description(status , now , message "", out "") [](#method-c-failure_description)
## find_executable(cmd , *args ) [](#method-c-find_executable)
## gc_stress_to_class?() [](#method-c-gc_stress_to_class?)
**@return** [Boolean] 

## invoke_ruby(args , stdin_data "", capture_stdout false, capture_stderr false, encoding: nil, timeout: 10, reprieve: 1, timeout_error: Timeout::Error, stdout_filter: nil, stderr_filter: nil, ios: nil, signal: :TERM, rubybin: EnvUtil.rubybin, precommand: nil, **opt ) [](#method-c-invoke_ruby)
## labeled_class(name , superclass Object, &block ) [](#method-c-labeled_class)
## labeled_module(name , &block ) [](#method-c-labeled_module)
## rubybin() [](#method-c-rubybin)
## suppress_warning() [](#method-c-suppress_warning)
## terminate(pid , signal :TERM, pgroup nil, reprieve 1) [](#method-c-terminate)
## timeout(sec , klass nil, message nil, &blk ) [](#method-c-timeout)
## under_gc_compact_stress(val :empty, &block ) [](#method-c-under_gc_compact_stress)
## under_gc_stress(stress true) [](#method-c-under_gc_stress)
## verbose_warning() [](#method-c-verbose_warning)
## with_default_external(enc ) [](#method-c-with_default_external)
## with_default_internal(enc ) [](#method-c-with_default_internal)
## without_gc() [](#method-c-without_gc)
# Attributes
## original_external_encoding[RW] [](#attribute-c-original_external_encoding)
Returns the value of attribute original_external_encoding.

## original_internal_encoding[RW] [](#attribute-c-original_internal_encoding)
Returns the value of attribute original_internal_encoding.

## original_verbose[RW] [](#attribute-c-original_verbose)
Returns the value of attribute original_verbose.

## original_warning[RW] [](#attribute-c-original_warning)
Returns the value of attribute original_warning.

## timeout_scale[RW] [](#attribute-c-timeout_scale)
Returns the value of attribute timeout_scale.


