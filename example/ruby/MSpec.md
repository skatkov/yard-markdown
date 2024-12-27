# Module: MSpec
    



# Class Methods
## actions(action , *args ) [](#method-c-actions)
## clear_current() [](#method-c-clear_current)
Sets the toplevel ContextState to `nil`.
## clear_expectations() [](#method-c-clear_expectations)
Resets the flag that an expectation has been encountered in an example.
## clear_modes() [](#method-c-clear_modes)
Clears all registered modes.
## current() [](#method-c-current)
Returns the toplevel ContextState.
## delete_tag(tag ) [](#method-c-delete_tag)
Deletes `tag` from the tag file if it exists. Returns `true` if the tag is
deleted, `false` otherwise. Deletes the tag file if it is empty.
## delete_tags() [](#method-c-delete_tags)
Removes the tag file associated with a spec file.
## deprecate(what , replacement ) [](#method-c-deprecate)
## describe(description , options nil, &block ) [](#method-c-describe)
## disable_feature(feature ) [](#method-c-disable_feature)
## each_file(&block ) [](#method-c-each_file)
## enable_feature(feature ) [](#method-c-enable_feature)
## exit_code() [](#method-c-exit_code)
Retrieves the stored exit code.
## expectation() [](#method-c-expectation)
Records that an expectation has been encountered in an example.
## expectation?() [](#method-c-expectation?)
Returns true if an expectation has been encountered
**@return** [Boolean] 

## feature_enabled?(feature ) [](#method-c-feature_enabled?)
**@return** [Boolean] 

## files() [](#method-c-files)
## files_array() [](#method-c-files_array)
## format(obj ) [](#method-c-format)
## guard() [](#method-c-guard)
Guards can be nested, so a stack is necessary to know when we have exited the
toplevel guard.
## guarded?() [](#method-c-guarded?)
**@return** [Boolean] 

## make_tag_dir(path ) [](#method-c-make_tag_dir)
## mode?(mode ) [](#method-c-mode?)
Returns `true` if `mode` is registered.
**@return** [Boolean] 

## process() [](#method-c-process)
## protect(location , &block ) [](#method-c-protect)
## randomize?() [](#method-c-randomize?)
**@return** [Boolean] 

## read_tags(keys ) [](#method-c-read_tags)
Returns a list of tags matching any tag string in `keys` based on the return
value of `keys.include?("tag_name")`
## register(symbol , action ) [](#method-c-register)
This method is used for registering actions that are run at particular points
in the spec cycle:
    :start        before any specs are run
    :load         before a spec file is loaded
    :enter        before a describe block is run
    :before       before a single spec is run
    :add          while a describe block is adding examples to run later
    :expectation  before a 'should', 'should_receive', etc.
    :passed       after an example block is run and passes, passed the block, run before :example action
    :example      after an example block is run, passed the block
    :exception    after an exception is rescued
    :after        after a single spec is run
    :leave        after a describe block is run
    :unload       after a spec file is run
    :finish       after all specs are run

Objects registered as actions above should respond to a method of the same
name. For example, if an object is registered as a :start action, it should
respond to a #start method call.

Additionally, there are two "action" lists for filtering specs:
    :include  return true if the spec should be run
    :exclude  return true if the spec should NOT be run
## register_current(state ) [](#method-c-register_current)
Sets the toplevel ContextState to `state`.
## register_exit(code ) [](#method-c-register_exit)
Stores the exit code used by the runner scripts.
## register_files(files ) [](#method-c-register_files)
Stores the list of files to be evaluated.
## register_mode(mode ) [](#method-c-register_mode)
Registers an operating mode. Modes recognized by MSpec:

    :pretend - actions execute but specs are not run
    :verify - specs are run despite guards and the result is
              verified to match the expectation of the guard
    :report - specs that are guarded are reported
    :unguarded - all guards are forced off
## register_shared(state ) [](#method-c-register_shared)
Stores the shared ContextState keyed by description.
## register_tags_patterns(patterns ) [](#method-c-register_tags_patterns)
Stores one or more substitution patterns for transforming a spec filename into
a tags filename, where each pattern has the form:

    [Regexp, String]

See also `tags_file`.
## retrieve(symbol ) [](#method-c-retrieve)
## retrieve_shared(desc ) [](#method-c-retrieve_shared)
Returns the shared ContextState matching description.
## setup_env() [](#method-c-setup_env)
## shuffle(ary ) [](#method-c-shuffle)
## store(symbol , value ) [](#method-c-store)
## tags_file() [](#method-c-tags_file)
Transforms a spec filename into a tags filename by applying each substitution
pattern in :tags_pattern. The default patterns are:

    [%r(/spec/), '/spec/tags/'], [/_spec.rb$/, '_tags.txt']

which will perform the following transformation:

    path/to/spec/class/method_spec.rb => path/to/spec/tags/class/method_tags.txt

See also `register_tags_patterns`.
## unguard() [](#method-c-unguard)
## unregister(symbol , action ) [](#method-c-unregister)
## write_tag(tag ) [](#method-c-write_tag)
Writes `tag` to the tag file if it does not already exist. Returns `true` if
the tag is written, `false` otherwise.
## write_tags(tags ) [](#method-c-write_tags)
Writes each tag in `tags` to the tag file. Overwrites the tag file if it
exists.
# Attributes
## exclude[RW] [](#attribute-c-exclude)
Returns the value of attribute exclude.

## file[RW] [](#attribute-c-file)
Returns the value of attribute file.

## formatter[RW] [](#attribute-c-formatter)
Returns the value of attribute formatter.

## include[RW] [](#attribute-c-include)
Returns the value of attribute include.

## randomize=[R] [](#attribute-c-randomize=)
Sets the attribute randomize

**@param** [] the value to set the attribute randomize to.

## repeat[RW] [](#attribute-c-repeat)

## skips[RW] [](#attribute-c-skips)
Returns the value of attribute skips.

## subprocesses[RW] [](#attribute-c-subprocesses)
Returns the value of attribute subprocesses.


