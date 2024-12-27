# Module: Test::Unit::LifecycleHooks
    

Provides before/after hooks for setup and teardown. These are meant for
library writers, NOT for regular test authors. See #before_setup for an
example.



#Instance Methods
## after_setup() [](#method-i-after_setup)
Runs before every test, after setup. This hook is meant for libraries to
extend Test::Unit. It is not meant to be used by test developers.

See #before_setup for an example.

## after_teardown() [](#method-i-after_teardown)
Runs after every test, after teardown. This hook is meant for libraries to
extend Test::Unit. It is not meant to be used by test developers.

See #before_setup for an example.

## before_setup() [](#method-i-before_setup)
Runs before every test, before setup. This hook is meant for libraries to
extend Test::Unit. It is not meant to be used by test developers.

As a simplistic example:

    module MyTestUnitPlugin
      def before_setup
        super
        # ... stuff to do before setup is run
      end

      def after_setup
        # ... stuff to do after setup is run
        super
      end

      def before_teardown
        super
        # ... stuff to do before teardown is run
      end

      def after_teardown
        # ... stuff to do after teardown is run
        super
      end
    end

    class Test::Unit::Runner::TestCase
      include MyTestUnitPlugin
    end

## before_teardown() [](#method-i-before_teardown)
Runs after every test, before teardown. This hook is meant for libraries to
extend Test::Unit. It is not meant to be used by test developers.

See #before_setup for an example.

