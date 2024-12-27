# Module: IRB
    

history.rb -
    	by Keiju ISHITSUKA(keiju@ruby-lang.org)


# Class Methods
## CurrentContext() [](#method-c-CurrentContext)
The current Context in this session
## Inspector(inspect , init nil) [](#method-c-Inspector)
Convenience method to create a new Inspector, using the given `inspect` proc,
and optional `init` proc and passes them to Inspector.new

    irb(main):001:0> ins = IRB::Inspector(proc{ |v| "omg! #{v}" })
    irb(main):001:0> IRB.CurrentContext.inspect_mode = ins # => omg! #<IRB::Inspector:0x007f46f7ba7d28>
    irb(main):001:0> "what?" #=> omg! what?
## JobManager() [](#method-c-JobManager)
The current JobManager in the session
## conf() [](#method-c-conf)
Displays current configuration.

Modifying the configuration is achieved by sending a message to IRB.conf.

See IRB@Configuration for more information.
## init_config(ap_path ) [](#method-c-init_config)
## init_error() [](#method-c-init_error)
## initialized?() [](#method-c-initialized?)
**@return** [Boolean] 

## inspect() [](#method-c-inspect)
## irb(file nil, *main ) [](#method-c-irb)
Creates a new IRB session, see Irb.new.

The optional `file` argument is given to Context.new, along with the workspace
created with the remaining arguments, see WorkSpace.new
## irb_abort(irb , exception Abort) [](#method-c-irb_abort)
Aborts then interrupts irb.

Will raise an Abort exception, or the given `exception`.
## irb_exit() [](#method-c-irb_exit)
Quits irb
## irbrc_files() [](#method-c-irbrc_files)
## load_modules() [](#method-c-load_modules)
loading modules
## parse_opts(argv: ::ARGV) [](#method-c-parse_opts)
option analyzing
## print_usage() [](#method-c-print_usage)
Outputs the irb help message, see IRB@Command-Line+Options.
## raise_validation_error(msg ) [](#method-c-raise_validation_error)
**@raise** [TypeError] 

## rc_file(ext ) [](#method-c-rc_file)
## run_config() [](#method-c-run_config)
Run the config file
## set_measure_callback(type nil, arg nil, &block ) [](#method-c-set_measure_callback)
## setup(ap_path , argv: ::ARGV) [](#method-c-setup)
initialize config
## start(ap_path nil) [](#method-c-start)
Initializes IRB and creates a new Irb.irb object at the `TOPLEVEL_BINDING`
## unset_measure_callback(type nil) [](#method-c-unset_measure_callback)
## validate_config() [](#method-c-validate_config)
## version() [](#method-c-version)
Returns the current version of IRB, including release version and last updated
date.

