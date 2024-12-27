# Module: Gem::Deprecate
    



# Class Methods
## next_rubygems_major_version() [](#method-c-next_rubygems_major_version)
:nodoc:
## rubygems_deprecate(name , replacement :none) [](#method-c-rubygems_deprecate)
Simple deprecation method that deprecates `name` by wrapping it up in a dummy
method. It warns on each call to the dummy method telling the user of `repl`
(unless `repl` is :none) and the Rubygems version that it is planned to go
away.
## rubygems_deprecate_command(version Gem::Deprecate.next_rubygems_major_version) [](#method-c-rubygems_deprecate_command)
Deprecation method to deprecate Rubygems commands
## skip() [](#method-c-skip)
:nodoc:
## skip=(v ) [](#method-c-skip=)
:nodoc:
## skip_during() [](#method-c-skip_during)
Temporarily turn off warnings. Intended for tests only.

#Instance Methods
## deprecate(name, repl, year, month) [](#method-i-deprecate)
Simple deprecation method that deprecates `name` by wrapping it up in a dummy
method. It warns on each call to the dummy method telling the user of `repl`
(unless `repl` is :none) and the year/month that it is planned to go away.

