# Class: Psych::YAMLDBMTest
**Inherits:** Psych::TestCase
    




#Instance Methods
## make_tmp_filename(prefix) [](#method-i-make_tmp_filename)

## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## test_delete() [](#method-i-test_delete)

## test_delete_if() [](#method-i-test_delete_if)

## test_fetch() [](#method-i-test_fetch)

## test_has_value?() [](#method-i-test_has_value?)

**@return** [Boolean] 

## test_invert() [](#method-i-test_invert)

## test_key() [](#method-i-test_key)
Note: YAML::DBM#index makes warning from internal of ::DBM#index. It says
'DBM#index is deprecated; use DBM#key', but DBM#key behaves not same as
DBM#index.

def test_index
    @yamldbm['a'] = 'b'
    @yamldbm['c'] = 'd'
    assert_equal 'a', @yamldbm.index('b')
    assert_equal 'c', @yamldbm.index('d')
    assert_nil @yamldbm.index('f')

end

## test_reject() [](#method-i-test_reject)

## test_replace() [](#method-i-test_replace)

## test_selsct() [](#method-i-test_selsct)

## test_selsct_with_block() [](#method-i-test_selsct_with_block)

## test_shift() [](#method-i-test_shift)

## test_store() [](#method-i-test_store)

## test_store_using_carret() [](#method-i-test_store_using_carret)

## test_to_a() [](#method-i-test_to_a)

## test_to_hash() [](#method-i-test_to_hash)

## test_update() [](#method-i-test_update)

## test_values() [](#method-i-test_values)

## test_values_at() [](#method-i-test_values_at)

