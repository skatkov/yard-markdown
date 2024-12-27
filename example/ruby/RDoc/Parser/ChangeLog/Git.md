# Module: RDoc::Parser::ChangeLog::Git
    

The extension for Git commit log



#Instance Methods
## create_entries(entries) [](#method-i-create_entries)
Returns a list of ChangeLog entries as RDoc::Parser::ChangeLog::Git::LogEntry
list for the given `entries`.

## parse_entries() [](#method-i-parse_entries)
Parses the entries in the Git commit logs

## parse_info(info) [](#method-i-parse_info)
Parses auxiliary info.  Currently `base-url` to expand references is
effective.

