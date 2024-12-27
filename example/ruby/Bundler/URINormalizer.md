# Module: Bundler::URINormalizer
    



# Class Methods
## normalize_suffix(uri , trailing_slash: true) [](#method-c-normalize_suffix)
Normalizes uri to a consistent version, either with or without trailing slash.

TODO: Currently gem sources are locked with a trailing slash, while git
sources are locked without a trailing slash. This should be normalized but the
inconsistency is there for now to avoid changing all lockfiles including GIT
sources. We could normalize this on the next major.

