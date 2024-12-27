# Class: IRB::ReadlineInputMethod
**Inherits:** IRB::StdioInputMethod
    
**Includes:** IRB::HistorySavingAbility
  



# Class Methods
## initialize_readline() [](#method-c-initialize_readline)

#Instance Methods
## completion_info() [](#method-i-completion_info)

## eof?() [](#method-i-eof?)
Whether the end of this input method has been reached, returns `true` if there
is no more data to read.

See IO#eof? for more information.

**@return** [Boolean] 

## gets() [](#method-i-gets)
Reads the next line from this input method.

See IO#gets for more information.

## initialize() [](#method-i-initialize)
Creates a new input method object using Readline

**@return** [ReadlineInputMethod] a new instance of ReadlineInputMethod

## inspect() [](#method-i-inspect)
For debug message

## load_history() [](#method-i-load_history)

## prompting?() [](#method-i-prompting?)

**@return** [Boolean] 

## reset_history_counter() [](#method-i-reset_history_counter)

## save_history() [](#method-i-save_history)

## support_history_saving?() [](#method-i-support_history_saving?)

**@return** [Boolean] 

