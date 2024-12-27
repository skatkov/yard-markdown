# Exception: Zlib::InProgressError
**Inherits:** Zlib::Error
    

Subclass of Zlib::Error. This error is raised when the zlib stream is
currently in progress.

For example:

    inflater = Zlib::Inflate.new
    inflater.inflate(compressed) do
      inflater.inflate(compressed) # Raises Zlib::InProgressError
    end



