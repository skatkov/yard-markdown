# Class: RubyVM
**Inherits:** Object
    

The RubyVM module only exists on MRI. `RubyVM` is not defined in other Ruby
implementations such as JRuby and TruffleRuby.

The RubyVM module provides some access to MRI internals. This module is for
very limited purposes, such as debugging, prototyping, and research.  Normal
users must not use it. This module is not portable between Ruby
implementations.


# Class Methods
## NSDR() [](#method-c-NSDR)
:nodoc:
## SDR() [](#method-c-SDR)
:nodoc:
## USAGE_ANALYSIS_INSN_CLEAR() [](#method-c-USAGE_ANALYSIS_INSN_CLEAR)
## USAGE_ANALYSIS_INSN_RUNNING() [](#method-c-USAGE_ANALYSIS_INSN_RUNNING)
## USAGE_ANALYSIS_INSN_START() [](#method-c-USAGE_ANALYSIS_INSN_START)
## USAGE_ANALYSIS_INSN_STOP() [](#method-c-USAGE_ANALYSIS_INSN_STOP)
## USAGE_ANALYSIS_OPERAND_CLEAR() [](#method-c-USAGE_ANALYSIS_OPERAND_CLEAR)
## USAGE_ANALYSIS_OPERAND_RUNNING() [](#method-c-USAGE_ANALYSIS_OPERAND_RUNNING)
## USAGE_ANALYSIS_OPERAND_START() [](#method-c-USAGE_ANALYSIS_OPERAND_START)
## USAGE_ANALYSIS_OPERAND_STOP() [](#method-c-USAGE_ANALYSIS_OPERAND_STOP)
## USAGE_ANALYSIS_REGISTER_CLEAR() [](#method-c-USAGE_ANALYSIS_REGISTER_CLEAR)
## USAGE_ANALYSIS_REGISTER_RUNNING() [](#method-c-USAGE_ANALYSIS_REGISTER_RUNNING)
## USAGE_ANALYSIS_REGISTER_START() [](#method-c-USAGE_ANALYSIS_REGISTER_START)
## USAGE_ANALYSIS_REGISTER_STOP() [](#method-c-USAGE_ANALYSIS_REGISTER_STOP)
## each_builtin() [](#method-c-each_builtin)
:nodoc:
## keep_script_lines() [](#method-c-keep_script_lines)
Return current `keep_script_lines` status. Now it only returns `true` of
`false`, but it can return other objects in future.

Note that this is an API for ruby internal use, debugging, and research. Do
not use this for any other purpose. The compatibility is not guaranteed.
**@overload** [] 

## keep_script_lines=(flags ) [](#method-c-keep_script_lines=)
It set `keep_script_lines` flag. If the flag is set, all loaded scripts are
recorded in a interpreter process.

Note that this is an API for ruby internal use, debugging, and research. Do
not use this for any other purpose. The compatibility is not guaranteed.
**@overload** [] 

## mtbl(obj , sym ) [](#method-c-mtbl)
:nodoc:
## mtbl2(obj , sym ) [](#method-c-mtbl2)
:nodoc:
## reset_debug_counters() [](#method-c-reset_debug_counters)
## show_debug_counters() [](#method-c-show_debug_counters)
## stat(*args ) [](#method-c-stat)
Returns a Hash containing implementation-dependent counters inside the VM.

This hash includes information about method/constant caches:

    {
      :constant_cache_invalidations=>2,
      :constant_cache_misses=>14,
      :global_cvar_state=>27
    }

If `USE_DEBUG_COUNTER` is enabled, debug counters will be included.

The contents of the hash are implementation specific and may be changed in the
future.

This method is only expected to work on C Ruby.
**@overload** [] 

**@overload** [] 

**@overload** [] 


