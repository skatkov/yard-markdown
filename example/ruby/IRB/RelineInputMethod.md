# Class: IRB::RelineInputMethod
**Inherits:** IRB::StdioInputMethod
    
**Includes:** IRB::HistorySavingAbility
  




#Instance Methods
## auto_indent(&block) [](#method-i-auto_indent)

## check_termination(&block) [](#method-i-check_termination)

## completion_info() [](#method-i-completion_info)

## display_document(matched) [](#method-i-display_document)

## dynamic_prompt(&block) [](#method-i-dynamic_prompt)

## eof?() [](#method-i-eof?)
Whether the end of this input method has been reached, returns `true` if there
is no more data to read.

See IO#eof? for more information.

**@return** [Boolean] 

## gets() [](#method-i-gets)
Reads the next line from this input method.

See IO#gets for more information.

## initialize(completor) [](#method-i-initialize)
Creates a new input method object using Reline

**@return** [RelineInputMethod] a new instance of RelineInputMethod

## inspect() [](#method-i-inspect)
For debug message

## load_history() [](#method-i-load_history)

## prompting?() [](#method-i-prompting?)

**@return** [Boolean] 

## rdoc_ri_driver() [](#method-i-rdoc_ri_driver)

## reset_history_counter() [](#method-i-reset_history_counter)

## retrieve_doc_namespace(matched) [](#method-i-retrieve_doc_namespace)

## save_history() [](#method-i-save_history)

## show_doc_dialog_proc() [](#method-i-show_doc_dialog_proc)

## support_history_saving?() [](#method-i-support_history_saving?)

**@return** [Boolean] 

