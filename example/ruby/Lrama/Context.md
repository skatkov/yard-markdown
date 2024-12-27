# Class: Lrama::Context
**Inherits:** Object
    
**Includes:** Lrama::Report::Duration
  

This is passed to a template


# Attributes
## states[RW] [](#attribute-i-states)
TODO: It might be better to pass `states` to Output directly?

## yydefact[RW] [](#attribute-i-yydefact)
TODO: It might be better to pass `states` to Output directly?

## yydefgoto[RW] [](#attribute-i-yydefgoto)
TODO: It might be better to pass `states` to Output directly?

## yylast[RW] [](#attribute-i-yylast)
TODO: It might be better to pass `states` to Output directly?

## yypact_ninf[RW] [](#attribute-i-yypact_ninf)
TODO: It might be better to pass `states` to Output directly?

## yytable_ninf[RW] [](#attribute-i-yytable_ninf)
TODO: It might be better to pass `states` to Output directly?


#Instance Methods
## initialize(states) [](#method-i-initialize)

**@return** [Context] a new instance of Context

## report_duration(method_name) [](#method-i-report_duration)

## yycheck() [](#method-i-yycheck)

## yyfinal() [](#method-i-yyfinal)
State number of final (accepted) state

## yymaxutok() [](#method-i-yymaxutok)
Last token number

## yynnts() [](#method-i-yynnts)
Number of nterms

## yynrules() [](#method-i-yynrules)
Number of rules

## yynstates() [](#method-i-yynstates)
Number of states

## yyntokens() [](#method-i-yyntokens)
Number of terms

## yypact() [](#method-i-yypact)

## yypgoto() [](#method-i-yypgoto)

## yyr1() [](#method-i-yyr1)
Mapping from rule number to symbol number of LHS. Dummy rule is appended as
the first element whose value is 0 because 0 means error in yydefact.

## yyr2() [](#method-i-yyr2)
Mapping from rule number to length of RHS. Dummy rule is appended as the first
element whose value is 0 because 0 means error in yydefact.

## yyrline() [](#method-i-yyrline)
Mapping from rule number to line number of the rule is defined. Dummy rule is
appended as the first element whose value is 0 because 0 means error in
yydefact.

## yystos() [](#method-i-yystos)

## yysymbol_kind_t() [](#method-i-yysymbol_kind_t)
enum yysymbol_kind_t

## yytable() [](#method-i-yytable)

## yytname() [](#method-i-yytname)
Mapping from symbol number to its name

## yytokentype() [](#method-i-yytokentype)
enum yytokentype

## yytranslate() [](#method-i-yytranslate)
YYTRANSLATE

yytranslate is a mapping from token id to symbol number

## yytranslate_inverted() [](#method-i-yytranslate_inverted)

