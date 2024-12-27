# Class: TestGemResolver
**Inherits:** Gem::TestCase
    




#Instance Methods
## assert_resolves_to(expected, resolver) [](#method-i-assert_resolves_to)

## make_dep(name, *req) [](#method-i-make_dep)

## set(*specs) [](#method-i-set)

## test_backoff_higher_version_to_satisfy_dep() [](#method-i-test_backoff_higher_version_to_satisfy_dep)

## test_backtracks_to_the_first_conflict() [](#method-i-test_backtracks_to_the_first_conflict)

## test_common_rack_activation_scenario() [](#method-i-test_common_rack_activation_scenario)

## test_conflict_resolution_only_effects_correct_spec() [](#method-i-test_conflict_resolution_only_effects_correct_spec)

## test_does_not_pick_musl_variants_on_non_musl_linux() [](#method-i-test_does_not_pick_musl_variants_on_non_musl_linux)

## test_keeps_resolving_after_seeing_satisfied_dep() [](#method-i-test_keeps_resolving_after_seeing_satisfied_dep)

## test_no_overlap_specifically() [](#method-i-test_no_overlap_specifically)

## test_only_returns_spec_once() [](#method-i-test_only_returns_spec_once)

## test_pick_generic_linux_variants_on_musl_linux() [](#method-i-test_pick_generic_linux_variants_on_musl_linux)

## test_picks_best_platform() [](#method-i-test_picks_best_platform)

## test_picks_highest_version() [](#method-i-test_picks_highest_version)

## test_picks_lower_version_when_needed() [](#method-i-test_picks_lower_version_when_needed)

## test_pulls_in_dependencies() [](#method-i-test_pulls_in_dependencies)

## test_raises_and_explains_when_platform_prevents_install() [](#method-i-test_raises_and_explains_when_platform_prevents_install)

## test_raises_and_reports_a_toplevel_request_properly() [](#method-i-test_raises_and_reports_a_toplevel_request_properly)

## test_raises_and_reports_an_implicit_request_properly() [](#method-i-test_raises_and_reports_an_implicit_request_properly)

## test_raises_dependency_error() [](#method-i-test_raises_dependency_error)

## test_raises_when_a_gem_is_missing() [](#method-i-test_raises_when_a_gem_is_missing)

## test_raises_when_a_gem_version_is_missing() [](#method-i-test_raises_when_a_gem_version_is_missing)

## test_raises_when_possibles_are_exhausted() [](#method-i-test_raises_when_possibles_are_exhausted)

## test_requests() [](#method-i-test_requests)

## test_requests_development() [](#method-i-test_requests_development)

## test_requests_ignore_dependencies() [](#method-i-test_requests_ignore_dependencies)

## test_resolve_bug_699() [](#method-i-test_resolve_bug_699)

## test_resolve_conflict() [](#method-i-test_resolve_conflict)

## test_resolve_conservative() [](#method-i-test_resolve_conservative)

## test_resolve_development() [](#method-i-test_resolve_development)

## test_resolve_development_shallow() [](#method-i-test_resolve_development_shallow)

## test_resolve_remote_missing_dependency() [](#method-i-test_resolve_remote_missing_dependency)

## test_resolve_rollback() [](#method-i-test_resolve_rollback)

## test_search_for_local_platform_partial_string_match() [](#method-i-test_search_for_local_platform_partial_string_match)

## test_second_level_backout() [](#method-i-test_second_level_backout)

## test_select_local_platforms() [](#method-i-test_select_local_platforms)

## test_self_compose_sets_best_set() [](#method-i-test_self_compose_sets_best_set)

## test_self_compose_sets_multiple() [](#method-i-test_self_compose_sets_multiple)

## test_self_compose_sets_nest() [](#method-i-test_self_compose_sets_nest)

## test_self_compose_sets_nil() [](#method-i-test_self_compose_sets_nil)

## test_self_compose_sets_single() [](#method-i-test_self_compose_sets_single)

## test_simple_activesupport_problem() [](#method-i-test_simple_activesupport_problem)
actionmailer 2.3.4 activemerchant 1.5.0 activesupport 2.3.5, 2.3.4
Activemerchant needs activesupport >= 2.3.2. When you require activemerchant,
it will activate the latest version that meets that requirement which is
2.3.5. Actionmailer on the other hand needs activesupport = 2.3.4. When
rubygems tries to activate activesupport 2.3.4, it will raise an error.

## test_sorts_by_source_then_version() [](#method-i-test_sorts_by_source_then_version)

