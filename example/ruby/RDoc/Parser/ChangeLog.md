# Class: RDoc::Parser::ChangeLog
**Inherits:** RDoc::Parser
    
**Includes:** RDoc::Parser::Text
  

A ChangeLog file parser.

This parser converts a ChangeLog into an RDoc::Markup::Document.  When viewed
as HTML a ChangeLog page will have an entry for each day's entries in the
sidebar table of contents.

This parser is meant to parse the MRI ChangeLog, but can be used to parse any
[GNU style Change
Log](http://www.gnu.org/prep/standards/html_node/Style-of-Change-Logs.html).



#Instance Methods
## continue_entry_body(entry_body, continuation) [](#method-i-continue_entry_body)
Attaches the `continuation` of the previous line to the `entry_body`.

Continued function listings are joined together as a single entry. Continued
descriptions are joined to make a single paragraph.

## create_document(groups) [](#method-i-create_document)
Creates an RDoc::Markup::Document given the `groups` of ChangeLog entries.

## create_entries(entries) [](#method-i-create_entries)
Returns a list of ChangeLog entries an RDoc::Markup nodes for the given
`entries`.

## create_items(items) [](#method-i-create_items)
Returns an RDoc::Markup::List containing the given `items` in the ChangeLog

## group_entries(entries) [](#method-i-group_entries)
Groups `entries` by date.

## parse_date(date) [](#method-i-parse_date)
Parse date in ISO-8601, RFC-2822, or default of Git

## parse_entries() [](#method-i-parse_entries)
Parses the entries in the ChangeLog.

Returns an Array of each ChangeLog entry in order of parsing.

A ChangeLog entry is an Array containing the ChangeLog title (date and
committer) and an Array of ChangeLog items (file and function changed with
description).

An example result would be:

    [ 'Tue Dec  4 08:33:46 2012  Eric Hodel  <drbrain@segment7.net>',
      [ 'README.EXT:  Converted to RDoc format',
        'README.EXT.ja:  ditto']]

## scan() [](#method-i-scan)
Converts the ChangeLog into an RDoc::Markup::Document

