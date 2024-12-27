# Module: OptionParser::Arguable
    

Extends command line arguments array (ARGV) to parse itself.


# Class Methods
## extend_object(obj ) [](#method-c-extend_object)
Initializes instance variable.

#Instance Methods
## getopts(*args, symbolize_names:false, **keywords) [](#method-i-getopts)
Substitution of getopts is possible as follows. Also see OptionParser#getopts.

    def getopts(*args)
      ($OPT = ARGV.getopts(*args)).each do |opt, val|
        eval "$OPT_#{opt.gsub(/[^A-Za-z0-9_]/, '_')} = val"
      end
    rescue OptionParser::ParseError
    end

## initialize(*args) [](#method-i-initialize)
:nodoc:

## options() [](#method-i-options)
Actual OptionParser object, automatically created if nonexistent.

If called with a block, yields the OptionParser object and returns the result
of the block. If an OptionParser::ParseError exception occurs in the block, it
is rescued, a error message printed to STDERR and `nil` returned.

## options=(opt) [](#method-i-options=)
Sets OptionParser object, when `opt` is `false` or `nil`, methods
OptionParser::Arguable#options and OptionParser::Arguable#options= are
undefined. Thus, there is no ways to access the OptionParser object via the
receiver object.

## order!(**keywords, &blk) [](#method-i-order!)
Parses `self` destructively in order and returns `self` containing the rest
arguments left unparsed.

## parse!(**keywords) [](#method-i-parse!)
Parses `self` destructively and returns `self` containing the rest arguments
left unparsed.

## permute!(**keywords) [](#method-i-permute!)
Parses `self` destructively in permutation mode and returns `self` containing
the rest arguments left unparsed.

