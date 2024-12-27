# Exception: Gem::RemoteError
**Inherits:** Gem::Exception
    

Signals that a remote operation cannot be conducted, probably due to not being
connected (or just not finding host). -- TODO: create a method that tests
connection to the preferred gems server. All code dealing with remote
operations will want this.  Failure in that method should raise this error.



