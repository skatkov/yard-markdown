# Class: Gem::TestCase::SpecFetcherSetup
**Inherits:** Object
    

The SpecFetcherSetup allows easy setup of a remote source in RubyGems tests:

    spec_fetcher do |f|
      f.gem  'a', 1
      f.spec 'a', 2
      f.gem  'b', 1' 'a' => '~> 1.0'
    end

The above declaration creates two gems, a-1 and b-1, with a dependency from b
to a.  The declaration creates an additional spec a-2, but no gem for it (so
it cannot be installed).

After the gems are created they are removed from Gem.dir.


# Class Methods
## declare(test , repository ) [](#method-c-declare)
Executes a SpecFetcher setup block.  Yields an instance then creates the gems
and specifications defined in the instance.
**@yield** [setup] 


#Instance Methods
## created_specs() [](#method-i-created_specs)
Returns a Hash of created Specification full names and the corresponding
Specification.

## download(name, version, dependenciesnil, &block) [](#method-i-download)
Creates a gem with `name`, `version` and `deps`.  The created gem is
downloaded in to the cache directory but is not installed

The specification will be yielded before gem creation for customization, but
only the block or the dependencies may be set, not both.

## execute() [](#method-i-execute)
Creates any defined gems or specifications

## execute_operations() [](#method-i-execute_operations)
:nodoc:

## gem(name, version, dependenciesnil, &block) [](#method-i-gem)
Creates a gem with `name`, `version` and `deps`.  The created gem can be
downloaded and installed.

The specification will be yielded before gem creation for customization, but
only the block or the dependencies may be set, not both.

## initialize(test, repository) [](#method-i-initialize)
:nodoc:

**@return** [SpecFetcherSetup] a new instance of SpecFetcherSetup

## legacy_platform() [](#method-i-legacy_platform)
Creates a legacy platform spec with the name 'pl' and version 1

## setup_fetcher() [](#method-i-setup_fetcher)
:nodoc:

## spec(name, version, dependenciesnil, &block) [](#method-i-spec)
Creates a spec with `name`, `version` and `deps`.  The created gem can be
downloaded and installed.

The specification will be yielded before creation for customization, but only
the block or the dependencies may be set, not both.

## write_spec(spec) [](#method-i-write_spec)
:nodoc:

