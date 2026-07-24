You are working in a Ruby project that uses line, branch, and mutation coverage.

## First check

Always run SimpleCov before Mutant. Line and branch coverage are cheaper to
measure and catch many missing tests first:

```
bundle exec rake test
```

Both line and branch coverage must remain at 100%, including per-file coverage.

## Mutation coverage

After SimpleCov passes, achieve 100% mutation coverage. When iterating, prefer
`--fail-fast` so you address one surviving mutant at a time:

```
bundle exec mutant run --fail-fast
```

## When you find an alive mutation

Decide which bucket it falls into:

- **A) The code does too much** for what the tests ask for. The
  surviving mutation reveals behavior that no test requires. The
  fix is to simplify the implementation.
- **B) A test is missing.** The behavior is intentional but no test
  observes it. The fix is to add a test.

Decide between A) and B) before changing anything. If unsure, ask
the user.

## Constraints

- You may not skip mutants by configuring mutant to ignore them.
  No `expressions:` filters, no `coverage_criteria:` tweaks.
- You may not weaken the SimpleCov line, branch, or per-file minimums.
- You may not use `send` or `__send__` to invoke private methods
  in tests just to satisfy mutant.
- You may not stub or mock the system under test.

## Done

You are done when all of these commands are green and don't return any offenses:

```
bundle exec rake test
bundle exec rake markdown:validate_real_world
bundle exec yard-lint
bundle exec mutant run
```
