# Module: RubyVM::YJIT
    

This module allows for introspection of YJIT, CRuby's just-in-time compiler.
Everything in the module is highly implementation specific and the API might
be less stable compared to the standard library.

This module may not exist if YJIT does not support the particular platform for
which CRuby is built.


# Class Methods
## code_gc() [](#method-c-code_gc)
Discard existing compiled code to reclaim memory and allow for recompilations
in the future.
## disasm(iseq ) [](#method-c-disasm)
Produce disassembly for an iseq. This requires a `--enable-yjit=dev` build.
## dump_exit_locations(filename ) [](#method-c-dump_exit_locations)
Marshal dumps exit locations to the given filename.

Usage:

If `--yjit-exit-locations` is passed, a file named "yjit_exit_locations.dump"
will automatically be generated.

If you want to collect traces manually, call `dump_exit_locations` directly.

Note that calling this in a script will generate stats after the dump is
created, so the stats data may include exits from the dump itself.

In a script call:

    at_exit do
      RubyVM::YJIT.dump_exit_locations("my_file.dump")
    end

Then run the file with the following options:

    ruby --yjit --yjit-trace-exits test.rb

Once the code is done running, use Stackprof to read the dump file. See
Stackprof documentation for options.
## enable(stats: false, log: false) [](#method-c-enable)
Enable YJIT compilation. `stats` option decides whether to enable YJIT stats
or not. `compilation_log` decides whether to enable YJIT compilation logging
or not.

*   `stats`:
        * `false`: Don't enable stats.
        * `true`: Enable stats. Print stats at exit.
        * `:quiet`: Enable stats. Do not print stats at exit.

*   `log`:
        * `false`: Don't enable the log.
        * `true`: Enable the log. Print log at exit.
        * `:quiet`: Enable the log. Do not print log at exit.
## enabled?() [](#method-c-enabled?)
Check if YJIT is enabled.
**@return** [Boolean] 

## exit_locations() [](#method-c-exit_locations)
If --yjit-trace-exits is enabled parse the hashes from
Primitive.rb_yjit_get_exit_locations into a format readable by Stackprof. This
will allow us to find the exact location of a side exit in YJIT based on the
instruction that is exiting.
## insns_compiled(iseq ) [](#method-c-insns_compiled)
Produce a list of instructions compiled by YJIT for an iseq
## log() [](#method-c-log)
Return an array of log entries. Return `nil` when option is not passed or
unavailable.
## log_enabled?() [](#method-c-log_enabled?)
Check if `--yjit-log` is used.
**@return** [Boolean] 

## reset_stats!() [](#method-c-reset_stats!)
Discard statistics collected for `--yjit-stats`.
## runtime_stats(key nil) [](#method-c-runtime_stats)
Return a hash for statistics generated for the `--yjit-stats` command line
option. Return `nil` when option is not passed or unavailable. If a symbol
argument is provided, return only the value for the named stat. If any other
type is provided, raises TypeError.
**@raise** [TypeError] 

## simulate_oom!() [](#method-c-simulate_oom!)
:nodoc:
## stats_enabled?() [](#method-c-stats_enabled?)
Check if `--yjit-stats` is used.
**@return** [Boolean] 

## stats_string() [](#method-c-stats_string)
Format and print out counters as a String. This returns a non-empty content
only when `--yjit-stats` is enabled.
## trace_exit_locations_enabled?() [](#method-c-trace_exit_locations_enabled?)
Check if rb_yjit_trace_exit_locations_enabled_p is enabled.
**@return** [Boolean] 


