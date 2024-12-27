# Module: Bundler::ForcePlatform
    




#Instance Methods
## default_force_ruby_platform() [](#method-i-default_force_ruby_platform)
The `:force_ruby_platform` value used by dependencies for resolution, and by
locked specifications for materialization is `false` by default, except for
TruffleRuby. TruffleRuby generally needs to force the RUBY platform variant
unless the name is explicitly allowlisted.

