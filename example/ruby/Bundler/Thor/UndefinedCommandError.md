# Exception: Bundler::Thor::UndefinedCommandError
**Inherits:** Bundler::Thor::Error
    
**Includes:** Bundler::Thor::UndefinedCommandError.if defined?(DidYouMean::SpellChecker) && defined?(DidYouMean::Correctable) # rubocop:disable Naming/ConstantName
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
  

Raised when a command was not found.


# Attributes
## all_commands[RW] [](#attribute-i-all_commands)
Returns the value of attribute all_commands.

## command[RW] [](#attribute-i-command)
Returns the value of attribute command.


#Instance Methods
## initialize(command, all_commands, namespace) [](#method-i-initialize)

**@return** [UndefinedCommandError] a new instance of UndefinedCommandError

