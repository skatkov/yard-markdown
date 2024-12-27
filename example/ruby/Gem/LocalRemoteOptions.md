# Module: Gem::LocalRemoteOptions
    

Mixin methods for local and remote Gem::Command options.



#Instance Methods
## accept_uri_http() [](#method-i-accept_uri_http)
Allows Gem::OptionParser to handle HTTP URIs.

## add_bulk_threshold_option() [](#method-i-add_bulk_threshold_option)
Add the --bulk-threshold option

## add_clear_sources_option() [](#method-i-add_clear_sources_option)
Add the --clear-sources option

## add_local_remote_options() [](#method-i-add_local_remote_options)
Add local/remote options to the command line parser.

## add_proxy_option() [](#method-i-add_proxy_option)
Add the --http-proxy option

## add_source_option() [](#method-i-add_source_option)
Add the --source option

## add_update_sources_option() [](#method-i-add_update_sources_option)
Add the --update-sources option

## both?() [](#method-i-both?)
Is fetching of local and remote information enabled?

**@return** [Boolean] 

## local?() [](#method-i-local?)
Is local fetching enabled?

**@return** [Boolean] 

## remote?() [](#method-i-remote?)
Is remote fetching enabled?

**@return** [Boolean] 

