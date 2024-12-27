# Class: WIN32OLE::Event
**Inherits:** Object
    

`WIN32OLE::Event` objects controls OLE event.


# Class Methods
## message_loop() [](#method-c-message_loop)
Translates and dispatches Windows message.
**@overload** [] 


#Instance Methods
## handler() [](#method-i-handler)
returns handler object.

**@overload** [] 

## handler=(val) [](#method-i-handler=)
sets event handler object. If handler object has onXXX method according to XXX
event, then onXXX method is called when XXX event occurs.

If handler object has method_missing and there is no method according to the
event, then method_missing called and 1-st argument is event name.

If handler object has onXXX method and there is block defined by
`on_event('XXX'){}`, then block is executed but handler object method is not
called when XXX event occurs.

    class Handler
      def onStatusTextChange(text)
        puts "StatusTextChanged"
      end
      def onPropertyChange(prop)
        puts "PropertyChanged"
      end
      def method_missing(ev, *arg)
        puts "other event #{ev}"
      end
    end

    handler = Handler.new
    ie = WIN32OLE.new('InternetExplorer.Application')
    ev = WIN32OLE::Event.new(ie)
    ev.on_event("StatusTextChange") {|*args|
      puts "this block executed."
      puts "handler.onStatusTextChange method is not called."
    }
    ev.handler = handler

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Returns OLE event object. The first argument specifies WIN32OLE object. The
second argument specifies OLE event name.
    ie = WIN32OLE.new('InternetExplorer.Application')
    ev = WIN32OLE::Event.new(ie, 'DWebBrowserEvents')

**@overload** [] 

## off_event(*args) [](#method-i-off_event)
removes the callback of event.

    ie = WIN32OLE.new('InternetExplorer.Application')
    ev = WIN32OLE::Event.new(ie)
    ev.on_event('BeforeNavigate2') {|*args|
      args.last[6] = true
    }
    # ...
    ev.off_event('BeforeNavigate2')
    # ...

**@overload** [] 

## on_event(*args) [](#method-i-on_event)
Defines the callback event. If argument is omitted, this method defines the
callback of all events. If you want to modify reference argument in callback,
return hash in callback. If you want to return value to OLE server as result
of callback use `return' or :return.

    ie = WIN32OLE.new('InternetExplorer.Application')
    ev = WIN32OLE::Event.new(ie)
    ev.on_event("NavigateComplete") {|url| puts url}
    ev.on_event() {|ev, *args| puts "#{ev} fired"}

    ev.on_event("BeforeNavigate2") {|*args|
      # ...
      # set true to BeforeNavigate reference argument `Cancel'.
      # Cancel is 7-th argument of BeforeNavigate,
      # so you can use 6 as key of hash instead of 'Cancel'.
      # The argument is counted from 0.
      # The hash key of 0 means first argument.)
      {:Cancel => true}  # or {'Cancel' => true} or {6 => true}
    }

    ev.on_event(event_name) {|*args|
      {:return => 1, :xxx => yyy}
    }

**@overload** [] 

## on_event_with_outargs(*args) [](#method-i-on_event_with_outargs)
Defines the callback of event. If you want modify argument in callback, you
could use this method instead of WIN32OLE::Event#on_event.

    ie = WIN32OLE.new('InternetExplorer.Application')
    ev = WIN32OLE::Event.new(ie)
    ev.on_event_with_outargs('BeforeNavigate2') {|*args|
      args.last[6] = true
    }

**@overload** [] 

## unadvise() [](#method-i-unadvise)
disconnects OLE server. If this method called, then the WIN32OLE::Event object
does not receive the OLE server event any more. This method is trial
implementation.

    ie = WIN32OLE.new('InternetExplorer.Application')
    ev = WIN32OLE::Event.new(ie)
    ev.on_event() { something }
    # ...
    ev.unadvise

**@overload** [] 

