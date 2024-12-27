# Class: Ripper
**Inherits:** Object
    

Ripper is a Ruby script parser.

You can get information from the parser with event-based style. Information
such as abstract syntax trees or simple lexical analysis of the Ruby program.

## Usage

Ripper provides an easy interface for parsing your program into a symbolic
expression tree (or S-expression).

Understanding the output of the parser may come as a challenge, it's
recommended you use PP to format the output for legibility.

    require 'ripper'
    require 'pp'

    pp Ripper.sexp('def hello(world) "Hello, #{world}!"; end')
      #=> [:program,
           [[:def,
             [:@ident, "hello", [1, 4]],
             [:paren,
              [:params, [[:@ident, "world", [1, 10]]], nil, nil, nil, nil, nil, nil]],
             [:bodystmt,
              [[:string_literal,
                [:string_content,
                 [:@tstring_content, "Hello, ", [1, 18]],
                 [:string_embexpr, [[:var_ref, [:@ident, "world", [1, 27]]]]],
                 [:@tstring_content, "!", [1, 33]]]]],
              nil,
              nil,
              nil]]]]

You can see in the example above, the expression starts with `:program`.

From here, a method definition at `:def`, followed by the method's identifier
`:@ident`. After the method's identifier comes the parentheses `:paren` and
the method parameters under `:params`.

Next is the method body, starting at `:bodystmt` (`stmt` meaning statement),
which contains the full definition of the method.

In our case, we're simply returning a String, so next we have the
`:string_literal` expression.

Within our `:string_literal` you'll notice two `@tstring_content`, this is the
literal part for `Hello, ` and `!`. Between the two `@tstring_content`
statements is a `:string_embexpr`, where *embexpr* is an embedded expression.
Our expression consists of a local variable, or `var_ref`, with the identifier
(`@ident`) of `world`.

## Resources

*   [Ruby
    Inside](http://www.rubyinside.com/using-ripper-to-see-how-ruby-is-parsing-
    your-code-5270.html)

## Requirements

*   ruby 1.9 (support CVS HEAD only)
*   bison 1.28 or later (Other yaccs do not work)

## License

Ruby License.

*   Minero Aoki
*   aamine@loveruby.net
*   http://i.loveruby.net


# Class Methods
## lex(src , filename '-', lineno 1, **kw ) [](#method-c-lex)
Tokenizes the Ruby program and returns an array of an array, which is
formatted like `[[lineno, column], type, token, state]`. The `filename`
argument is mostly ignored. By default, this method does not handle syntax
errors in `src`, use the `raise_errors` keyword to raise a SyntaxError for an
error in `src`.

    require 'ripper'
    require 'pp'

    pp Ripper.lex("def m(a) nil end")
    #=> [[[1,  0], :on_kw,     "def", FNAME    ],
         [[1,  3], :on_sp,     " ",   FNAME    ],
         [[1,  4], :on_ident,  "m",   ENDFN    ],
         [[1,  5], :on_lparen, "(",   BEG|LABEL],
         [[1,  6], :on_ident,  "a",   ARG      ],
         [[1,  7], :on_rparen, ")",   ENDFN    ],
         [[1,  8], :on_sp,     " ",   BEG      ],
         [[1,  9], :on_kw,     "nil", END      ],
         [[1, 12], :on_sp,     " ",   END      ],
         [[1, 13], :on_kw,     "end", END      ]]
## parse(src , filename '(ripper)', lineno 1) [](#method-c-parse)
Parses the given Ruby program read from `src`. `src` must be a String or an IO
or a object with a #gets method.
## sexp(src , filename '-', lineno 1, raise_errors: false) [](#method-c-sexp)
EXPERIMENTAL
:   Parses `src` and create S-exp tree. Returns more readable tree rather than
    Ripper.sexp_raw. This method is mainly for developer use. The `filename`
    argument is mostly ignored. By default, this method does not handle syntax
    errors in `src`, returning `nil` in such cases. Use the `raise_errors`
    keyword to raise a SyntaxError for an error in `src`.

        require 'ripper'
        require 'pp'

        pp Ripper.sexp("def m(a) nil end")
          #=> [:program,
               [[:def,
                [:@ident, "m", [1, 4]],
                [:paren, [:params, [[:@ident, "a", [1, 6]]], nil, nil, nil, nil, nil, nil]],
                [:bodystmt, [[:var_ref, [:@kw, "nil", [1, 9]]]], nil, nil, nil]]]]

## sexp_raw(src , filename '-', lineno 1, raise_errors: false) [](#method-c-sexp_raw)
EXPERIMENTAL
:   Parses `src` and create S-exp tree. This method is mainly for developer
    use. The `filename` argument is mostly ignored. By default, this method
    does not handle syntax errors in `src`, returning `nil` in such cases. Use
    the `raise_errors` keyword to raise a SyntaxError for an error in `src`.

        require 'ripper'
        require 'pp'

        pp Ripper.sexp_raw("def m(a) nil end")
          #=> [:program,
               [:stmts_add,
                [:stmts_new],
                [:def,
                 [:@ident, "m", [1, 4]],
                 [:paren, [:params, [[:@ident, "a", [1, 6]]], nil, nil, nil]],
                 [:bodystmt,
                  [:stmts_add, [:stmts_new], [:var_ref, [:@kw, "nil", [1, 9]]]],
                  nil,
                  nil,
                  nil]]]]

## slice(src , pattern , n 0) [](#method-c-slice)
EXPERIMENTAL
:   Parses `src` and return a string which was matched to `pattern`. `pattern`
    should be described as Regexp.

        require 'ripper'

        p Ripper.slice('def m(a) nil end', 'ident')                   #=> "m"
        p Ripper.slice('def m(a) nil end', '[ident lparen rparen]+')  #=> "m(a)"
        p Ripper.slice("<<EOS\nstring\nEOS",
                       'heredoc_beg nl $(tstring_content*) heredoc_end', 1)
            #=> "string\n"

## token_match(src , pattern ) [](#method-c-token_match)
:nodoc:
## tokenize(src , filename '-', lineno 1, **kw ) [](#method-c-tokenize)
Tokenizes the Ruby program and returns an array of strings. The `filename` and
`lineno` arguments are mostly ignored, since the return value is just the
tokenized input. By default, this method does not handle syntax errors in
`src`, use the `raise_errors` keyword to raise a SyntaxError for an error in
`src`.

    p Ripper.tokenize("def m(a) nil end")
       # => ["def", " ", "m", "(", "a", ")", " ", "nil", " ", "end"]

