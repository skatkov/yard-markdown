# Class: TestGemVersion
**Inherits:** Gem::TestCase
    




#Instance Methods
## assert_approximate_equal(expected, version) [](#method-i-assert_approximate_equal)
Assert that `expected` is the "approximate" recommendation for `version`.

## assert_approximate_satisfies_itself(version) [](#method-i-assert_approximate_satisfies_itself)
Assert that the "approximate" recommendation for `version` satisfies
`version`.

## assert_bumped_version_equal(expected, unbumped) [](#method-i-assert_bumped_version_equal)
Assert that bumping the `unbumped` version yields the `expected`.

## assert_less_than(left, right) [](#method-i-assert_less_than)

## assert_prerelease(version) [](#method-i-assert_prerelease)
Asserts that `version` is a prerelease.

## assert_release_equal(release, version) [](#method-i-assert_release_equal)
Assert that `release` is the correct non-prerelease `version`.

## assert_version_eql(first, second) [](#method-i-assert_version_eql)
Assert that two versions are eql?. Checks both directions.

## assert_version_equal(expected, actual) [](#method-i-assert_version_equal)
Assert that two versions are equal. Handles strings or Gem::Version instances.

## refute_prerelease(version) [](#method-i-refute_prerelease)
Refute the assumption that `version` is a prerelease.

## refute_version_eql(first, second) [](#method-i-refute_version_eql)
Refute the assumption that two versions are eql?. Checks both directions.

## refute_version_equal(unexpected, actual) [](#method-i-refute_version_equal)
Refute the assumption that the two versions are equal?.

## test_approximate_recommendation() [](#method-i-test_approximate_recommendation)

## test_bump() [](#method-i-test_bump)

## test_bump_alpha() [](#method-i-test_bump_alpha)

## test_bump_alphanumeric() [](#method-i-test_bump_alphanumeric)

## test_bump_one_level() [](#method-i-test_bump_one_level)

## test_bump_trailing_zeros() [](#method-i-test_bump_trailing_zeros)

## test_canonical_segments() [](#method-i-test_canonical_segments)

## test_class_correct() [](#method-i-test_class_correct)

## test_class_create() [](#method-i-test_class_create)
A Gem::Version is already a Gem::Version and therefore not transformed by
Gem::Version.create

## test_class_new_subclass() [](#method-i-test_class_new_subclass)

## test_empty_version() [](#method-i-test_empty_version)

## test_eql_eh() [](#method-i-test_eql_eh)

## test_equals2() [](#method-i-test_equals2)

## test_frozen_version() [](#method-i-test_frozen_version)

## test_hash() [](#method-i-test_hash)
REVISIT: consider removing as too impl-bound

## test_initialize() [](#method-i-test_initialize)

## test_initialize_invalid() [](#method-i-test_initialize_invalid)

## test_prerelease() [](#method-i-test_prerelease)

## test_release() [](#method-i-test_release)

## test_segments() [](#method-i-test_segments)
modifying the segments of a version should not affect the segments of the
cached version object

## test_semver() [](#method-i-test_semver)

## test_spaceship() [](#method-i-test_spaceship)

## test_to_s() [](#method-i-test_to_s)

