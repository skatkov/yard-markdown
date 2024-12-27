# Class: Psych::TestDeprecated
**Inherits:** Psych::TestCase
    




#Instance Methods
## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## test_coder_scalar() [](#method-i-test_coder_scalar)

## test_recursive_quick_emit_encode_with() [](#method-i-test_recursive_quick_emit_encode_with)
An object that defines both to_yaml and encode_with should only call
encode_with.

## test_yaml_initialize_and_init_with() [](#method-i-test_yaml_initialize_and_init_with)
An object that implements both yaml_initialize and init_with should not
receive the yaml_initialize call.

