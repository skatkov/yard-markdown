# Class: Bundler::EnvironmentPreserver
**Inherits:** Object
    



# Class Methods
## from_env() [](#method-c-from_env)

#Instance Methods
## backup() [](#method-i-backup)

**@return** [Hash] 

## initialize(env, keys) [](#method-i-initialize)

**@param** [Hash] 

**@param** [Array<String>] 

**@return** [EnvironmentPreserver] a new instance of EnvironmentPreserver

## replace_with_backup() [](#method-i-replace_with_backup)
Replaces `ENV` with the bundler environment variables backed up

## restore() [](#method-i-restore)

**@return** [Hash] 

