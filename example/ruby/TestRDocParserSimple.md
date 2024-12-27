# Class: TestRDocParserSimple
**Inherits:** RDoc::TestCase
    




#Instance Methods
## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## test_initialize_metadata() [](#method-i-test_initialize_metadata)

## test_remove_coding_comment() [](#method-i-test_remove_coding_comment)

## test_remove_private_comments() [](#method-i-test_remove_private_comments)
RDoc stops processing comments if it finds a comment line CONTAINING '`#--`'.
This can be used to separate external from internal comments, or to stop a
comment being associated with a method, class, or module. Commenting CAN be
turned back on with a line that STARTS '`#++`'.

I've seen guys that comment their code like this:
    # This method....
    #-----------------
    def method

# > either we do it only in ruby code, or we require the leading #
     (to avoid conflict with rules).

    TODO: require the leading #, to provide the feature in simple text files.
    Note: in ruby & C code, we require '#--' & '#++' or '*--' & '*++',
    to allow rules:

    # this is a comment
    #---
    # private text
    #+++
    # this is a rule:
    # ---

## test_remove_private_comments_rule() [](#method-i-test_remove_private_comments_rule)

## test_remove_private_comments_star() [](#method-i-test_remove_private_comments_star)

## test_scan() [](#method-i-test_scan)

## util_parser(content) [](#method-i-util_parser)

