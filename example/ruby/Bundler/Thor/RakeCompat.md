# Module: Bundler::Thor::RakeCompat
    
**Includes:** Rake::DSL
  

Adds a compatibility layer to your Bundler::Thor classes which allows you to
use rake package tasks. For example, to use rspec rake tasks, one can do:

    require 'bundler/vendor/thor/lib/thor/rake_compat'
    require 'rspec/core/rake_task'

    class Default < Bundler::Thor
      include Bundler::Thor::RakeCompat

      RSpec::Core::RakeTask.new(:spec) do |t|
        t.spec_opts = ['--options', './.rspec']
        t.spec_files = FileList['spec/**/*_spec.rb']
      end
    end


# Class Methods
## included(base ) [](#method-c-included)
**@private** [] 

## rake_classes() [](#method-c-rake_classes)

