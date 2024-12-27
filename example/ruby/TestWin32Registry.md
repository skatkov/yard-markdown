# Class: TestWin32Registry
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## setup() [](#method-i-setup)
Create a new registry key per test in an atomic way, which is deleted on
teardown.

Fills the following instance variables:

    @test_registry_key - A registry path which is not yet created,
                         but can be created without collisions even when running
                         multiple test processes.
    @test_registry_rnd - The part of the registry path with a random number.
    @createopts        - Required parameters (desired, opt) for create method in
                         the volatile environment of the registry.

## teardown() [](#method-i-teardown)

## test_accessors() [](#method-i-test_accessors)

## test_class_open() [](#method-i-test_class_open)

## test_create_no_block() [](#method-i-test_create_no_block)

## test_create_with_block() [](#method-i-test_create_with_block)

## test_each_key() [](#method-i-test_each_key)

## test_each_key_enum() [](#method-i-test_each_key_enum)

## test_each_value() [](#method-i-test_each_value)

## test_each_value_enum() [](#method-i-test_each_value_enum)

## test_keys() [](#method-i-test_keys)

## test_name() [](#method-i-test_name)

## test_open_no_block() [](#method-i-test_open_no_block)

## test_open_with_block() [](#method-i-test_open_with_block)

## test_predefined() [](#method-i-test_predefined)

## test_read() [](#method-i-test_read)

## test_utf8_encoding() [](#method-i-test_utf8_encoding)

## test_values() [](#method-i-test_values)

## test_write() [](#method-i-test_write)

