# Class: TestGemRequirement
**Inherits:** Gem::TestCase
    



# Class Methods
## exploit(arg ) [](#method-c-exploit)
**@raise** [Exploit] 


#Instance Methods
## assert_requirement_equal(expected, actual) [](#method-i-assert_requirement_equal)
Assert that two requirements are equal. Handles Gem::Requirements, strings,
arrays, numbers, and versions.

## assert_requirement_hash_equal(expected, actual) [](#method-i-assert_requirement_hash_equal)
Assert that two requirement hashes are equal. Handles Gem::Requirements,
strings, arrays, numbers, and versions.

## assert_satisfied_by(version, requirement) [](#method-i-assert_satisfied_by)
Assert that `version` satisfies `requirement`.

## refute_requirement_equal(unexpected, actual) [](#method-i-refute_requirement_equal)
Refute the assumption that two requirements are equal.

## refute_requirement_hash_equal(unexpected, actual) [](#method-i-refute_requirement_hash_equal)
Refute the assumption that two requirements hashes are equal.

## refute_satisfied_by(version, requirement) [](#method-i-refute_satisfied_by)
Refute the assumption that `version` satisfies `requirement`.

## test_bad() [](#method-i-test_bad)

## test_basic_non_none() [](#method-i-test_basic_non_none)

## test_concat() [](#method-i-test_concat)

## test_create() [](#method-i-test_create)

## test_empty_requirements_is_none() [](#method-i-test_empty_requirements_is_none)

## test_equals2() [](#method-i-test_equals2)

## test_explicit_default_is_none() [](#method-i-test_explicit_default_is_none)

## test_for_lockfile() [](#method-i-test_for_lockfile)

## test_hash_returns_equal_hashes_for_equivalent_requirements() [](#method-i-test_hash_returns_equal_hashes_for_equivalent_requirements)

## test_hash_with_multiple_versions() [](#method-i-test_hash_with_multiple_versions)

## test_illformed_requirements() [](#method-i-test_illformed_requirements)

## test_initialize() [](#method-i-test_initialize)

## test_initialize_copy() [](#method-i-test_initialize_copy)

## test_marshal_load_attack() [](#method-i-test_marshal_load_attack)

## test_parse() [](#method-i-test_parse)

## test_parse_bad() [](#method-i-test_parse_bad)

## test_parse_deduplication() [](#method-i-test_parse_deduplication)

## test_prerelease_eh() [](#method-i-test_prerelease_eh)

## test_satisfied_by_boxed() [](#method-i-test_satisfied_by_boxed)

## test_satisfied_by_eh_bang_equal() [](#method-i-test_satisfied_by_eh_bang_equal)

## test_satisfied_by_eh_blank() [](#method-i-test_satisfied_by_eh_blank)

## test_satisfied_by_eh_boxed() [](#method-i-test_satisfied_by_eh_boxed)

## test_satisfied_by_eh_equal() [](#method-i-test_satisfied_by_eh_equal)

## test_satisfied_by_eh_good() [](#method-i-test_satisfied_by_eh_good)

## test_satisfied_by_eh_gt() [](#method-i-test_satisfied_by_eh_gt)

## test_satisfied_by_eh_gte() [](#method-i-test_satisfied_by_eh_gte)

## test_satisfied_by_eh_list() [](#method-i-test_satisfied_by_eh_list)

## test_satisfied_by_eh_lt() [](#method-i-test_satisfied_by_eh_lt)

## test_satisfied_by_eh_lte() [](#method-i-test_satisfied_by_eh_lte)

## test_satisfied_by_eh_multiple() [](#method-i-test_satisfied_by_eh_multiple)

## test_satisfied_by_eh_non_versions() [](#method-i-test_satisfied_by_eh_non_versions)

## test_satisfied_by_eh_tilde_gt() [](#method-i-test_satisfied_by_eh_tilde_gt)

## test_satisfied_by_eh_tilde_gt_v0() [](#method-i-test_satisfied_by_eh_tilde_gt_v0)

## test_satisfied_by_explicitly_bounded() [](#method-i-test_satisfied_by_explicitly_bounded)

## test_specific() [](#method-i-test_specific)

