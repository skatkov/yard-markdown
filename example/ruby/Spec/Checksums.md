# Module: Spec::Checksums
    




#Instance Methods
## checksum_digest(*args) [](#method-i-checksum_digest)

## checksum_from_package(gem_file, name, version) [](#method-i-checksum_from_package)

## checksum_to_lock(*args) [](#method-i-checksum_to_lock)

## checksums_section(enabledtrue, &block) [](#method-i-checksums_section)

## checksums_section_when_enabled(target_lockfilenil, &block) [](#method-i-checksums_section_when_enabled)

## remove_checksums_from_lockfile(lockfile, *prefixes) [](#method-i-remove_checksums_from_lockfile)
if prefixes is given, removes all checksums where the line has any of the
prefixes on the line before the checksum otherwise, removes all checksums from
the lockfile

## remove_checksums_section_from_lockfile(lockfile) [](#method-i-remove_checksums_section_from_lockfile)

