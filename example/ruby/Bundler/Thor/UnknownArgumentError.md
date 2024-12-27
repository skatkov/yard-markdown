# Exception: Bundler::Thor::UnknownArgumentError
**Inherits:** Bundler::Thor::Error
    
**Includes:** Bundler::Thor::UnknownArgumentError.if defined?(DidYouMean::SpellChecker) && defined?(DidYouMean::Correctable) # rubocop:disable Naming/ConstantName
  Moduleif defined?(DidYouMean::SpellChecker) && defined?(DidYouMean::Correctable) # rubocop:disable Naming/ConstantName
  Module.new do
    def to_s
      super + DidYouMean.formatter.message_for(corrections)
    end

    def corrections
      @corrections ||= self.class.const_get(:SpellChecker).new(self).corrections
    end
  end
end
  



# Attributes
## switches[RW] [](#attribute-i-switches)
Returns the value of attribute switches.

## unknown[RW] [](#attribute-i-unknown)
Returns the value of attribute unknown.


#Instance Methods
## initialize(switches, unknown) [](#method-i-initialize)

**@return** [UnknownArgumentError] a new instance of UnknownArgumentError

