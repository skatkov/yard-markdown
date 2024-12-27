# Class: RDoc::Markdown
**Inherits:** Object
    

RDoc::Markdown as described by the [markdown [syntax]](syntax).

To choose Markdown as your only default format see RDoc::Options@Saved+Options
for instructions on setting up a `.rdoc_options` file to store your project
default.

## Usage

Here is a brief example of using this parse to read a markdown file by hand.

    data = File.read("README.md")
    formatter = RDoc::Markup::ToHtml.new(RDoc::Options.new, nil)
    html = RDoc::Markdown.parse(data).accept(formatter)

    # do something with html

## Extensions

The following markdown extensions are supported by the parser, but not all are
used in RDoc output by default.

### RDoc

The RDoc Markdown parser has the following built-in behaviors that cannot be
disabled.

Underscores embedded in words are never interpreted as emphasis.  (While the
markdown dingus][dingus
:   emphasizes in-word underscores, neither the

Markdown syntax nor MarkdownTest mention this behavior.)

For HTML output, RDoc always auto-links bare URLs.

### Break on Newline

The break_on_newline extension converts all newlines into hard line breaks as
in [Github Flavored [Markdown]](GFM).  This extension is disabled by default.

### CSS

The #css extension enables CSS blocks to be included in the output, but they
are not used for any built-in RDoc output format.  This extension is disabled
by default.

Example:

    <style type="text/css">
    h1 { font-size: 3em }
    </style>

### Definition Lists

The definition_lists extension allows definition lists using the [PHP Markdown
Extra [syntax]](PHPE), but only one label and definition are supported at this
time.  This extension is enabled by default.

Example:

``` cat :   A small furry mammal that seems to sleep a lot

ant :   A little insect that is known to enjoy picnics

```

Produces:

cat :   A small furry mammal that seems to sleep a lot

ant :   A little insect that is known to enjoy picnics

### Strike

Example:

``` This is ~~striked~~. ```

Produces:

This is ~~striked~~.

### Github

The #github extension enables a partial set of [Github Flavored Markdown]
[GFM].  This extension is enabled by default.

Supported github extensions include:

#### Fenced code blocks

Use ` ``` ` around a block of code instead of indenting it four spaces.

#### Syntax highlighting

Use ` ``` ruby ` as the start of a code fence to add syntax highlighting.
(Currently only `ruby` syntax is supported).

### HTML

Enables raw HTML to be included in the output.  This extension is enabled by
default.

Example:

    <table>
    ...
    </table>

### Notes

The #notes extension enables footnote support.  This extension is enabled by
default.

Example:

    Here is some text[^1] including an inline footnote ^[for short footnotes]

    ...

    [^1]: With the footnote text down at the bottom

Produces:

Here is some [text](^1) including an inline footnote ^[for short footnotes]

[^1]: With the footnote text down at the bottom

## Limitations

*   Link titles are not used
*   Footnotes are collapsed into a single paragraph

## Author

This markdown parser is a port to kpeg from [[peg-markdown]](pegmarkdown) by
John MacFarlane.

It is used under the MIT license:

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

The port to kpeg was performed by Eric Hodel and Evan Phoenix

[dingus]: http://daringfireball.net/projects/markdown/dingus [GFM]:
https://github.github.com/gfm/ [pegmarkdown]:
https://github.com/jgm/peg-markdown [PHPE]:
https://michelf.ca/projects/php-markdown/extra/#def-list [syntax]:
http://daringfireball.net/projects/markdown/syntax -- Last updated to
jgm/peg-markdown commit 8f8fc22ef0


# Class Methods
## extension(name ) [](#method-c-extension)
Creates extension methods for the `name` extension to enable and disable the
extension and to query if they are active.
## parse(markdown ) [](#method-c-parse)
Parses the `markdown` document into an RDoc::Document using the default
extensions.
## rule_info(name , rendered ) [](#method-c-rule_info)
# Attributes
## failed_rule[RW] [](#attribute-i-failed_rule)
Returns the value of attribute failed_rule.

## failing_rule_offset[RW] [](#attribute-i-failing_rule_offset)
Returns the value of attribute failing_rule_offset.

## pos[RW] [](#attribute-i-pos)
Returns the value of attribute pos.

## result[RW] [](#attribute-i-result)
Returns the value of attribute result.

## string[RW] [](#attribute-i-string)
Returns the value of attribute string.


#Instance Methods
## _Alphanumeric() [](#method-i-_Alphanumeric)
Alphanumeric = %literals.Alphanumeric

## _AlphanumericAscii() [](#method-i-_AlphanumericAscii)
AlphanumericAscii = %literals.AlphanumericAscii

## _AtxHeading() [](#method-i-_AtxHeading)
AtxHeading = AtxStart:s @Spacechar+ AtxInline+:a (@Sp /#*/ @Sp)? @Newline {
RDoc::Markup::Heading.new(s, a.join) }

## _AtxInline() [](#method-i-_AtxInline)
AtxInline = !@Newline !(@Sp /#*/ @Sp @Newline) Inline

## _AtxStart() [](#method-i-_AtxStart)
AtxStart = < /#{1,6}/ > { text.length }

## _AutoLink() [](#method-i-_AutoLink)
AutoLink = (AutoLinkUrl | AutoLinkEmail)

## _AutoLinkEmail() [](#method-i-_AutoLinkEmail)
AutoLinkEmail = "<" "mailto:"? < /[w+./!%~$-]+/i "@" (!@Newline !">" .)+ > ">"
{ "mailto:#{text}" }

## _AutoLinkUrl() [](#method-i-_AutoLinkUrl)
AutoLinkUrl = "<" < /[A-Za-z]+/ "://" (!@Newline !">" .)+ > ">" { text }

## _BOM() [](#method-i-_BOM)
BOM = %literals.BOM

## _BlankLine() [](#method-i-_BlankLine)
BlankLine = @Sp @Newline { "n" }

## _Block() [](#method-i-_Block)
Block = @BlankLine* (BlockQuote | Verbatim | CodeFence | Table | Note |
Reference | HorizontalRule | Heading | OrderedList | BulletList |
DefinitionList | HtmlBlock | StyleBlock | Para | Plain)

## _BlockQuote() [](#method-i-_BlockQuote)
BlockQuote = BlockQuoteRaw:a { RDoc::Markup::BlockQuote.new(*a) }

## _BlockQuoteRaw() [](#method-i-_BlockQuoteRaw)
BlockQuoteRaw = @StartList:a (">" " "? Line:l { a << l } (!">" !@BlankLine
Line:c { a << c })* (@BlankLine:n { a << n })*)+ { inner_parse a.join }

## _Bullet() [](#method-i-_Bullet)
Bullet = !HorizontalRule @NonindentSpace /[+*-]/ @Spacechar+

## _BulletList() [](#method-i-_BulletList)
BulletList = &Bullet (ListTight | ListLoose):a {
RDoc::Markup::List.new(:BULLET, *a) }

## _CharEntity() [](#method-i-_CharEntity)
CharEntity = "&" < /[A-Za-z0-9]+/ > ";" { if entity = [HTML_ENTITIES](text)
then                  entity.pack 'U*'                else                 
"&#{text};"                end              }

## _Code() [](#method-i-_Code)
Code = (Ticks1 @Sp < ((!"`" Nonspacechar)+ | !Ticks1 /`+/ | !(@Sp Ticks1)
(@Spacechar | @Newline !@BlankLine))+ > @Sp Ticks1 | Ticks2 @Sp < ((!"`"
Nonspacechar)+ | !Ticks2 /`+/ | !(@Sp Ticks2) (@Spacechar | @Newline
!@BlankLine))+ > @Sp Ticks2 | Ticks3 @Sp < ((!"`" Nonspacechar)+ | !Ticks3
/`+/ | !(@Sp Ticks3) (@Spacechar | @Newline !@BlankLine))+ > @Sp Ticks3 |
Ticks4 @Sp < ((!"`" Nonspacechar)+ | !Ticks4 /`+/ | !(@Sp Ticks4) (@Spacechar
| @Newline !@BlankLine))+ > @Sp Ticks4 | Ticks5 @Sp < ((!"`" Nonspacechar)+ |
!Ticks5 /`+/ | !(@Sp Ticks5) (@Spacechar | @Newline !@BlankLine))+ > @Sp
Ticks5) { "`#{text}`" }

## _CodeFence() [](#method-i-_CodeFence)
CodeFence = &{ github? } Ticks3 (@Sp StrChunk:format)? Spnl < ((!"`"
Nonspacechar)+ | !Ticks3 /`+/ | Spacechar | @Newline)+ > Ticks3 @Sp @Newline*
{ verbatim = RDoc::Markup::Verbatim.new text               verbatim.format =
format.intern if format.instance_of?(String)               verbatim           
 }

## _DecEntity() [](#method-i-_DecEntity)
DecEntity = "&#" < /[0-9]+/ > ";" { [text.to_i].pack 'U' }

## _DefinitionList() [](#method-i-_DefinitionList)
DefinitionList = &{ definition_lists? } DefinitionListItem+:list {
RDoc::Markup::List.new :NOTE, *list.flatten }

## _DefinitionListDefinition() [](#method-i-_DefinitionListDefinition)
DefinitionListDefinition = @NonindentSpace ":" @Space Inlines:a @BlankLine+ {
paragraph a }

## _DefinitionListItem() [](#method-i-_DefinitionListItem)
DefinitionListItem = DefinitionListLabel+:label
DefinitionListDefinition+:defns { list_items = []                       
list_items <<                          RDoc::Markup::ListItem.new(label,
defns.shift)                         list_items.concat defns.map { |defn|     
                    RDoc::Markup::ListItem.new nil, defn                      
 } unless list_items.empty?                         list_items                
     }

## _DefinitionListLabel() [](#method-i-_DefinitionListLabel)
DefinitionListLabel = Inline:label @Sp @Newline { label }

## _Digit() [](#method-i-_Digit)
Digit = [0-9]

## _Doc() [](#method-i-_Doc)
Doc = BOM? Block*:a { RDoc::Markup::Document.new(*a.compact) }

## _Emph() [](#method-i-_Emph)
Emph = (EmphStar | EmphUl)

## _EmphStar() [](#method-i-_EmphStar)
EmphStar = "*" !@Whitespace @StartList:a (!"*" Inline:b { a << b } |
StrongStar:b { a << b })+ "*" { emphasis a.join }

## _EmphUl() [](#method-i-_EmphUl)
EmphUl = "_" !@Whitespace @StartList:a (!"_" Inline:b { a << b } | StrongUl:b
{ a << b })+ "_" { emphasis a.join }

## _EmptyTitle() [](#method-i-_EmptyTitle)
EmptyTitle = ""

## _Endline() [](#method-i-_Endline)
Endline = (@LineBreak | @TerminalEndline | @NormalEndline)

## _Entity() [](#method-i-_Entity)
Entity = (HexEntity | DecEntity | CharEntity):a { a }

## _Enumerator() [](#method-i-_Enumerator)
Enumerator = @NonindentSpace [0-9]+ "." @Spacechar+

## _Eof() [](#method-i-_Eof)
Eof = !.

## _EscapedChar() [](#method-i-_EscapedChar)
EscapedChar = "\" !@Newline < /[:\`|*_{}[\]()#+.!><-]/ > { text }

## _ExplicitLink() [](#method-i-_ExplicitLink)
ExplicitLink = Label:l "(" @Sp Source:s Spnl Title @Sp ")" { "{#{l}}[#{s}]" }

## _ExtendedSpecialChar() [](#method-i-_ExtendedSpecialChar)
ExtendedSpecialChar = &{ notes? } "^"

## _Heading() [](#method-i-_Heading)
Heading = (SetextHeading | AtxHeading)

## _HexEntity() [](#method-i-_HexEntity)
HexEntity = /&#x/i < /[0-9a-fA-F]+/ > ";" { [text.to_i(16)].pack 'U' }

## _HorizontalRule() [](#method-i-_HorizontalRule)
HorizontalRule = @NonindentSpace ("*" @Sp "*" @Sp "*" (@Sp "*")* | "-" @Sp "-"
@Sp "-" (@Sp "-")* | "_" @Sp "_" @Sp "_" (@Sp "_")*) @Sp @Newline @BlankLine+
{ RDoc::Markup::Rule.new 1 }

## _HtmlAnchor() [](#method-i-_HtmlAnchor)
HtmlAnchor = HtmlOpenAnchor (HtmlAnchor | !HtmlCloseAnchor .)* HtmlCloseAnchor

## _HtmlAttribute() [](#method-i-_HtmlAttribute)
HtmlAttribute = (AlphanumericAscii | "-")+ Spnl ("=" Spnl (Quoted | (!">"
Nonspacechar)+))? Spnl

## _HtmlBlock() [](#method-i-_HtmlBlock)
HtmlBlock = < (HtmlBlockInTags | HtmlComment | HtmlBlockSelfClosing |
HtmlUnclosed) > @BlankLine+ { if html? then                
RDoc::Markup::Raw.new text               end }

## _HtmlBlockAddress() [](#method-i-_HtmlBlockAddress)
HtmlBlockAddress = HtmlBlockOpenAddress (HtmlBlockAddress |
!HtmlBlockCloseAddress .)* HtmlBlockCloseAddress

## _HtmlBlockBlockquote() [](#method-i-_HtmlBlockBlockquote)
HtmlBlockBlockquote = HtmlBlockOpenBlockquote (HtmlBlockBlockquote |
!HtmlBlockCloseBlockquote .)* HtmlBlockCloseBlockquote

## _HtmlBlockCenter() [](#method-i-_HtmlBlockCenter)
HtmlBlockCenter = HtmlBlockOpenCenter (HtmlBlockCenter | !HtmlBlockCloseCenter
.)* HtmlBlockCloseCenter

## _HtmlBlockCloseAddress() [](#method-i-_HtmlBlockCloseAddress)
HtmlBlockCloseAddress = "<" Spnl "/" ("address" | "ADDRESS") Spnl ">"

## _HtmlBlockCloseBlockquote() [](#method-i-_HtmlBlockCloseBlockquote)
HtmlBlockCloseBlockquote = "<" Spnl "/" ("blockquote" | "BLOCKQUOTE") Spnl ">"

## _HtmlBlockCloseCenter() [](#method-i-_HtmlBlockCloseCenter)
HtmlBlockCloseCenter = "<" Spnl "/" ("center" | "CENTER") Spnl ">"

## _HtmlBlockCloseDd() [](#method-i-_HtmlBlockCloseDd)
HtmlBlockCloseDd = "<" Spnl "/" ("dd" | "DD") Spnl ">"

## _HtmlBlockCloseDir() [](#method-i-_HtmlBlockCloseDir)
HtmlBlockCloseDir = "<" Spnl "/" ("dir" | "DIR") Spnl ">"

## _HtmlBlockCloseDiv() [](#method-i-_HtmlBlockCloseDiv)
HtmlBlockCloseDiv = "<" Spnl "/" ("div" | "DIV") Spnl ">"

## _HtmlBlockCloseDl() [](#method-i-_HtmlBlockCloseDl)
HtmlBlockCloseDl = "<" Spnl "/" ("dl" | "DL") Spnl ">"

## _HtmlBlockCloseDt() [](#method-i-_HtmlBlockCloseDt)
HtmlBlockCloseDt = "<" Spnl "/" ("dt" | "DT") Spnl ">"

## _HtmlBlockCloseFieldset() [](#method-i-_HtmlBlockCloseFieldset)
HtmlBlockCloseFieldset = "<" Spnl "/" ("fieldset" | "FIELDSET") Spnl ">"

## _HtmlBlockCloseForm() [](#method-i-_HtmlBlockCloseForm)
HtmlBlockCloseForm = "<" Spnl "/" ("form" | "FORM") Spnl ">"

## _HtmlBlockCloseFrameset() [](#method-i-_HtmlBlockCloseFrameset)
HtmlBlockCloseFrameset = "<" Spnl "/" ("frameset" | "FRAMESET") Spnl ">"

## _HtmlBlockCloseH1() [](#method-i-_HtmlBlockCloseH1)
HtmlBlockCloseH1 = "<" Spnl "/" ("h1" | "H1") Spnl ">"

## _HtmlBlockCloseH2() [](#method-i-_HtmlBlockCloseH2)
HtmlBlockCloseH2 = "<" Spnl "/" ("h2" | "H2") Spnl ">"

## _HtmlBlockCloseH3() [](#method-i-_HtmlBlockCloseH3)
HtmlBlockCloseH3 = "<" Spnl "/" ("h3" | "H3") Spnl ">"

## _HtmlBlockCloseH4() [](#method-i-_HtmlBlockCloseH4)
HtmlBlockCloseH4 = "<" Spnl "/" ("h4" | "H4") Spnl ">"

## _HtmlBlockCloseH5() [](#method-i-_HtmlBlockCloseH5)
HtmlBlockCloseH5 = "<" Spnl "/" ("h5" | "H5") Spnl ">"

## _HtmlBlockCloseH6() [](#method-i-_HtmlBlockCloseH6)
HtmlBlockCloseH6 = "<" Spnl "/" ("h6" | "H6") Spnl ">"

## _HtmlBlockCloseHead() [](#method-i-_HtmlBlockCloseHead)
HtmlBlockCloseHead = "<" Spnl "/" ("head" | "HEAD") Spnl ">"

## _HtmlBlockCloseLi() [](#method-i-_HtmlBlockCloseLi)
HtmlBlockCloseLi = "<" Spnl "/" ("li" | "LI") Spnl ">"

## _HtmlBlockCloseMenu() [](#method-i-_HtmlBlockCloseMenu)
HtmlBlockCloseMenu = "<" Spnl "/" ("menu" | "MENU") Spnl ">"

## _HtmlBlockCloseNoframes() [](#method-i-_HtmlBlockCloseNoframes)
HtmlBlockCloseNoframes = "<" Spnl "/" ("noframes" | "NOFRAMES") Spnl ">"

## _HtmlBlockCloseNoscript() [](#method-i-_HtmlBlockCloseNoscript)
HtmlBlockCloseNoscript = "<" Spnl "/" ("noscript" | "NOSCRIPT") Spnl ">"

## _HtmlBlockCloseOl() [](#method-i-_HtmlBlockCloseOl)
HtmlBlockCloseOl = "<" Spnl "/" ("ol" | "OL") Spnl ">"

## _HtmlBlockCloseP() [](#method-i-_HtmlBlockCloseP)
HtmlBlockCloseP = "<" Spnl "/" ("p" | "P") Spnl ">"

## _HtmlBlockClosePre() [](#method-i-_HtmlBlockClosePre)
HtmlBlockClosePre = "<" Spnl "/" ("pre" | "PRE") Spnl ">"

## _HtmlBlockCloseScript() [](#method-i-_HtmlBlockCloseScript)
HtmlBlockCloseScript = "<" Spnl "/" ("script" | "SCRIPT") Spnl ">"

## _HtmlBlockCloseTable() [](#method-i-_HtmlBlockCloseTable)
HtmlBlockCloseTable = "<" Spnl "/" ("table" | "TABLE") Spnl ">"

## _HtmlBlockCloseTbody() [](#method-i-_HtmlBlockCloseTbody)
HtmlBlockCloseTbody = "<" Spnl "/" ("tbody" | "TBODY") Spnl ">"

## _HtmlBlockCloseTd() [](#method-i-_HtmlBlockCloseTd)
HtmlBlockCloseTd = "<" Spnl "/" ("td" | "TD") Spnl ">"

## _HtmlBlockCloseTfoot() [](#method-i-_HtmlBlockCloseTfoot)
HtmlBlockCloseTfoot = "<" Spnl "/" ("tfoot" | "TFOOT") Spnl ">"

## _HtmlBlockCloseTh() [](#method-i-_HtmlBlockCloseTh)
HtmlBlockCloseTh = "<" Spnl "/" ("th" | "TH") Spnl ">"

## _HtmlBlockCloseThead() [](#method-i-_HtmlBlockCloseThead)
HtmlBlockCloseThead = "<" Spnl "/" ("thead" | "THEAD") Spnl ">"

## _HtmlBlockCloseTr() [](#method-i-_HtmlBlockCloseTr)
HtmlBlockCloseTr = "<" Spnl "/" ("tr" | "TR") Spnl ">"

## _HtmlBlockCloseUl() [](#method-i-_HtmlBlockCloseUl)
HtmlBlockCloseUl = "<" Spnl "/" ("ul" | "UL") Spnl ">"

## _HtmlBlockDd() [](#method-i-_HtmlBlockDd)
HtmlBlockDd = HtmlBlockOpenDd (HtmlBlockDd | !HtmlBlockCloseDd .)*
HtmlBlockCloseDd

## _HtmlBlockDir() [](#method-i-_HtmlBlockDir)
HtmlBlockDir = HtmlBlockOpenDir (HtmlBlockDir | !HtmlBlockCloseDir .)*
HtmlBlockCloseDir

## _HtmlBlockDiv() [](#method-i-_HtmlBlockDiv)
HtmlBlockDiv = HtmlBlockOpenDiv (HtmlBlockDiv | !HtmlBlockCloseDiv .)*
HtmlBlockCloseDiv

## _HtmlBlockDl() [](#method-i-_HtmlBlockDl)
HtmlBlockDl = HtmlBlockOpenDl (HtmlBlockDl | !HtmlBlockCloseDl .)*
HtmlBlockCloseDl

## _HtmlBlockDt() [](#method-i-_HtmlBlockDt)
HtmlBlockDt = HtmlBlockOpenDt (HtmlBlockDt | !HtmlBlockCloseDt .)*
HtmlBlockCloseDt

## _HtmlBlockFieldset() [](#method-i-_HtmlBlockFieldset)
HtmlBlockFieldset = HtmlBlockOpenFieldset (HtmlBlockFieldset |
!HtmlBlockCloseFieldset .)* HtmlBlockCloseFieldset

## _HtmlBlockForm() [](#method-i-_HtmlBlockForm)
HtmlBlockForm = HtmlBlockOpenForm (HtmlBlockForm | !HtmlBlockCloseForm .)*
HtmlBlockCloseForm

## _HtmlBlockFrameset() [](#method-i-_HtmlBlockFrameset)
HtmlBlockFrameset = HtmlBlockOpenFrameset (HtmlBlockFrameset |
!HtmlBlockCloseFrameset .)* HtmlBlockCloseFrameset

## _HtmlBlockH1() [](#method-i-_HtmlBlockH1)
HtmlBlockH1 = HtmlBlockOpenH1 (HtmlBlockH1 | !HtmlBlockCloseH1 .)*
HtmlBlockCloseH1

## _HtmlBlockH2() [](#method-i-_HtmlBlockH2)
HtmlBlockH2 = HtmlBlockOpenH2 (HtmlBlockH2 | !HtmlBlockCloseH2 .)*
HtmlBlockCloseH2

## _HtmlBlockH3() [](#method-i-_HtmlBlockH3)
HtmlBlockH3 = HtmlBlockOpenH3 (HtmlBlockH3 | !HtmlBlockCloseH3 .)*
HtmlBlockCloseH3

## _HtmlBlockH4() [](#method-i-_HtmlBlockH4)
HtmlBlockH4 = HtmlBlockOpenH4 (HtmlBlockH4 | !HtmlBlockCloseH4 .)*
HtmlBlockCloseH4

## _HtmlBlockH5() [](#method-i-_HtmlBlockH5)
HtmlBlockH5 = HtmlBlockOpenH5 (HtmlBlockH5 | !HtmlBlockCloseH5 .)*
HtmlBlockCloseH5

## _HtmlBlockH6() [](#method-i-_HtmlBlockH6)
HtmlBlockH6 = HtmlBlockOpenH6 (HtmlBlockH6 | !HtmlBlockCloseH6 .)*
HtmlBlockCloseH6

## _HtmlBlockHead() [](#method-i-_HtmlBlockHead)
HtmlBlockHead = HtmlBlockOpenHead (!HtmlBlockCloseHead .)* HtmlBlockCloseHead

## _HtmlBlockInTags() [](#method-i-_HtmlBlockInTags)
HtmlBlockInTags = (HtmlAnchor | HtmlBlockAddress | HtmlBlockBlockquote |
HtmlBlockCenter | HtmlBlockDir | HtmlBlockDiv | HtmlBlockDl |
HtmlBlockFieldset | HtmlBlockForm | HtmlBlockH1 | HtmlBlockH2 | HtmlBlockH3 |
HtmlBlockH4 | HtmlBlockH5 | HtmlBlockH6 | HtmlBlockMenu | HtmlBlockNoframes |
HtmlBlockNoscript | HtmlBlockOl | HtmlBlockP | HtmlBlockPre | HtmlBlockTable |
HtmlBlockUl | HtmlBlockDd | HtmlBlockDt | HtmlBlockFrameset | HtmlBlockLi |
HtmlBlockTbody | HtmlBlockTd | HtmlBlockTfoot | HtmlBlockTh | HtmlBlockThead |
HtmlBlockTr | HtmlBlockScript | HtmlBlockHead)

## _HtmlBlockLi() [](#method-i-_HtmlBlockLi)
HtmlBlockLi = HtmlBlockOpenLi (HtmlBlockLi | !HtmlBlockCloseLi .)*
HtmlBlockCloseLi

## _HtmlBlockMenu() [](#method-i-_HtmlBlockMenu)
HtmlBlockMenu = HtmlBlockOpenMenu (HtmlBlockMenu | !HtmlBlockCloseMenu .)*
HtmlBlockCloseMenu

## _HtmlBlockNoframes() [](#method-i-_HtmlBlockNoframes)
HtmlBlockNoframes = HtmlBlockOpenNoframes (HtmlBlockNoframes |
!HtmlBlockCloseNoframes .)* HtmlBlockCloseNoframes

## _HtmlBlockNoscript() [](#method-i-_HtmlBlockNoscript)
HtmlBlockNoscript = HtmlBlockOpenNoscript (HtmlBlockNoscript |
!HtmlBlockCloseNoscript .)* HtmlBlockCloseNoscript

## _HtmlBlockOl() [](#method-i-_HtmlBlockOl)
HtmlBlockOl = HtmlBlockOpenOl (HtmlBlockOl | !HtmlBlockCloseOl .)*
HtmlBlockCloseOl

## _HtmlBlockOpenAddress() [](#method-i-_HtmlBlockOpenAddress)
HtmlBlockOpenAddress = "<" Spnl ("address" | "ADDRESS") Spnl HtmlAttribute*
">"

## _HtmlBlockOpenBlockquote() [](#method-i-_HtmlBlockOpenBlockquote)
HtmlBlockOpenBlockquote = "<" Spnl ("blockquote" | "BLOCKQUOTE") Spnl
HtmlAttribute* ">"

## _HtmlBlockOpenCenter() [](#method-i-_HtmlBlockOpenCenter)
HtmlBlockOpenCenter = "<" Spnl ("center" | "CENTER") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenDd() [](#method-i-_HtmlBlockOpenDd)
HtmlBlockOpenDd = "<" Spnl ("dd" | "DD") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenDir() [](#method-i-_HtmlBlockOpenDir)
HtmlBlockOpenDir = "<" Spnl ("dir" | "DIR") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenDiv() [](#method-i-_HtmlBlockOpenDiv)
HtmlBlockOpenDiv = "<" Spnl ("div" | "DIV") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenDl() [](#method-i-_HtmlBlockOpenDl)
HtmlBlockOpenDl = "<" Spnl ("dl" | "DL") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenDt() [](#method-i-_HtmlBlockOpenDt)
HtmlBlockOpenDt = "<" Spnl ("dt" | "DT") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenFieldset() [](#method-i-_HtmlBlockOpenFieldset)
HtmlBlockOpenFieldset = "<" Spnl ("fieldset" | "FIELDSET") Spnl HtmlAttribute*
">"

## _HtmlBlockOpenForm() [](#method-i-_HtmlBlockOpenForm)
HtmlBlockOpenForm = "<" Spnl ("form" | "FORM") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenFrameset() [](#method-i-_HtmlBlockOpenFrameset)
HtmlBlockOpenFrameset = "<" Spnl ("frameset" | "FRAMESET") Spnl HtmlAttribute*
">"

## _HtmlBlockOpenH1() [](#method-i-_HtmlBlockOpenH1)
HtmlBlockOpenH1 = "<" Spnl ("h1" | "H1") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenH2() [](#method-i-_HtmlBlockOpenH2)
HtmlBlockOpenH2 = "<" Spnl ("h2" | "H2") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenH3() [](#method-i-_HtmlBlockOpenH3)
HtmlBlockOpenH3 = "<" Spnl ("h3" | "H3") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenH4() [](#method-i-_HtmlBlockOpenH4)
HtmlBlockOpenH4 = "<" Spnl ("h4" | "H4") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenH5() [](#method-i-_HtmlBlockOpenH5)
HtmlBlockOpenH5 = "<" Spnl ("h5" | "H5") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenH6() [](#method-i-_HtmlBlockOpenH6)
HtmlBlockOpenH6 = "<" Spnl ("h6" | "H6") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenHead() [](#method-i-_HtmlBlockOpenHead)
HtmlBlockOpenHead = "<" Spnl ("head" | "HEAD") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenLi() [](#method-i-_HtmlBlockOpenLi)
HtmlBlockOpenLi = "<" Spnl ("li" | "LI") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenMenu() [](#method-i-_HtmlBlockOpenMenu)
HtmlBlockOpenMenu = "<" Spnl ("menu" | "MENU") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenNoframes() [](#method-i-_HtmlBlockOpenNoframes)
HtmlBlockOpenNoframes = "<" Spnl ("noframes" | "NOFRAMES") Spnl HtmlAttribute*
">"

## _HtmlBlockOpenNoscript() [](#method-i-_HtmlBlockOpenNoscript)
HtmlBlockOpenNoscript = "<" Spnl ("noscript" | "NOSCRIPT") Spnl HtmlAttribute*
">"

## _HtmlBlockOpenOl() [](#method-i-_HtmlBlockOpenOl)
HtmlBlockOpenOl = "<" Spnl ("ol" | "OL") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenP() [](#method-i-_HtmlBlockOpenP)
HtmlBlockOpenP = "<" Spnl ("p" | "P") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenPre() [](#method-i-_HtmlBlockOpenPre)
HtmlBlockOpenPre = "<" Spnl ("pre" | "PRE") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenScript() [](#method-i-_HtmlBlockOpenScript)
HtmlBlockOpenScript = "<" Spnl ("script" | "SCRIPT") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenTable() [](#method-i-_HtmlBlockOpenTable)
HtmlBlockOpenTable = "<" Spnl ("table" | "TABLE") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenTbody() [](#method-i-_HtmlBlockOpenTbody)
HtmlBlockOpenTbody = "<" Spnl ("tbody" | "TBODY") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenTd() [](#method-i-_HtmlBlockOpenTd)
HtmlBlockOpenTd = "<" Spnl ("td" | "TD") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenTfoot() [](#method-i-_HtmlBlockOpenTfoot)
HtmlBlockOpenTfoot = "<" Spnl ("tfoot" | "TFOOT") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenTh() [](#method-i-_HtmlBlockOpenTh)
HtmlBlockOpenTh = "<" Spnl ("th" | "TH") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenThead() [](#method-i-_HtmlBlockOpenThead)
HtmlBlockOpenThead = "<" Spnl ("thead" | "THEAD") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenTr() [](#method-i-_HtmlBlockOpenTr)
HtmlBlockOpenTr = "<" Spnl ("tr" | "TR") Spnl HtmlAttribute* ">"

## _HtmlBlockOpenUl() [](#method-i-_HtmlBlockOpenUl)
HtmlBlockOpenUl = "<" Spnl ("ul" | "UL") Spnl HtmlAttribute* ">"

## _HtmlBlockP() [](#method-i-_HtmlBlockP)
HtmlBlockP = HtmlBlockOpenP (HtmlBlockP | !HtmlBlockCloseP .)* HtmlBlockCloseP

## _HtmlBlockPre() [](#method-i-_HtmlBlockPre)
HtmlBlockPre = HtmlBlockOpenPre (HtmlBlockPre | !HtmlBlockClosePre .)*
HtmlBlockClosePre

## _HtmlBlockScript() [](#method-i-_HtmlBlockScript)
HtmlBlockScript = HtmlBlockOpenScript (!HtmlBlockCloseScript .)*
HtmlBlockCloseScript

## _HtmlBlockSelfClosing() [](#method-i-_HtmlBlockSelfClosing)
HtmlBlockSelfClosing = "<" Spnl HtmlBlockType Spnl HtmlAttribute* "/" Spnl ">"

## _HtmlBlockTable() [](#method-i-_HtmlBlockTable)
HtmlBlockTable = HtmlBlockOpenTable (HtmlBlockTable | !HtmlBlockCloseTable .)*
HtmlBlockCloseTable

## _HtmlBlockTbody() [](#method-i-_HtmlBlockTbody)
HtmlBlockTbody = HtmlBlockOpenTbody (HtmlBlockTbody | !HtmlBlockCloseTbody .)*
HtmlBlockCloseTbody

## _HtmlBlockTd() [](#method-i-_HtmlBlockTd)
HtmlBlockTd = HtmlBlockOpenTd (HtmlBlockTd | !HtmlBlockCloseTd .)*
HtmlBlockCloseTd

## _HtmlBlockTfoot() [](#method-i-_HtmlBlockTfoot)
HtmlBlockTfoot = HtmlBlockOpenTfoot (HtmlBlockTfoot | !HtmlBlockCloseTfoot .)*
HtmlBlockCloseTfoot

## _HtmlBlockTh() [](#method-i-_HtmlBlockTh)
HtmlBlockTh = HtmlBlockOpenTh (HtmlBlockTh | !HtmlBlockCloseTh .)*
HtmlBlockCloseTh

## _HtmlBlockThead() [](#method-i-_HtmlBlockThead)
HtmlBlockThead = HtmlBlockOpenThead (HtmlBlockThead | !HtmlBlockCloseThead .)*
HtmlBlockCloseThead

## _HtmlBlockTr() [](#method-i-_HtmlBlockTr)
HtmlBlockTr = HtmlBlockOpenTr (HtmlBlockTr | !HtmlBlockCloseTr .)*
HtmlBlockCloseTr

## _HtmlBlockType() [](#method-i-_HtmlBlockType)
HtmlBlockType = ("ADDRESS" | "BLOCKQUOTE" | "CENTER" | "DD" | "DIR" | "DIV" |
"DL" | "DT" | "FIELDSET" | "FORM" | "FRAMESET" | "H1" | "H2" | "H3" | "H4" |
"H5" | "H6" | "HR" | "ISINDEX" | "LI" | "MENU" | "NOFRAMES" | "NOSCRIPT" |
"OL" | "P" | "PRE" | "SCRIPT" | "TABLE" | "TBODY" | "TD" | "TFOOT" | "TH" |
"THEAD" | "TR" | "UL" | "address" | "blockquote" | "center" | "dd" | "dir" |
"div" | "dl" | "dt" | "fieldset" | "form" | "frameset" | "h1" | "h2" | "h3" |
"h4" | "h5" | "h6" | "hr" | "isindex" | "li" | "menu" | "noframes" |
"noscript" | "ol" | "p" | "pre" | "script" | "table" | "tbody" | "td" |
"tfoot" | "th" | "thead" | "tr" | "ul")

## _HtmlBlockUl() [](#method-i-_HtmlBlockUl)
HtmlBlockUl = HtmlBlockOpenUl (HtmlBlockUl | !HtmlBlockCloseUl .)*
HtmlBlockCloseUl

## _HtmlCloseAnchor() [](#method-i-_HtmlCloseAnchor)
HtmlCloseAnchor = "<" Spnl "/" ("a" | "A") Spnl ">"

## _HtmlComment() [](#method-i-_HtmlComment)
HtmlComment = "<!--" (!"-->" .)* "-->"

## _HtmlOpenAnchor() [](#method-i-_HtmlOpenAnchor)
HtmlOpenAnchor = "<" Spnl ("a" | "A") Spnl HtmlAttribute* ">"

## _HtmlTag() [](#method-i-_HtmlTag)
HtmlTag = "<" Spnl "/"? AlphanumericAscii+ Spnl HtmlAttribute* "/"? Spnl ">"

## _HtmlUnclosed() [](#method-i-_HtmlUnclosed)
HtmlUnclosed = "<" Spnl HtmlUnclosedType Spnl HtmlAttribute* Spnl ">"

## _HtmlUnclosedType() [](#method-i-_HtmlUnclosedType)
HtmlUnclosedType = ("HR" | "hr")

## _Image() [](#method-i-_Image)
Image = "!" (ExplicitLink | ReferenceLink):a { "![](#{a[/\[(.*)\])/, 1]}" }

## _InStyleTags() [](#method-i-_InStyleTags)
InStyleTags = StyleOpen (!StyleClose .)* StyleClose

## _Indent() [](#method-i-_Indent)
Indent = /t|    /

## _IndentedLine() [](#method-i-_IndentedLine)
IndentedLine = Indent Line

## _Inline() [](#method-i-_Inline)
Inline = (Str | @Endline | UlOrStarLine | @Space | Strong | Emph | Strike |
Image | Link | NoteReference | InlineNote | Code | RawHtml | Entity |
EscapedChar | Symbol)

## _InlineNote() [](#method-i-_InlineNote)
InlineNote = &{ notes? } "^[" @StartList:a (!"]" Inline:l { a << l })+ "]" {
ref = [:inline, @note_order.length]                @[footnotes](ref) =
paragraph a                 note_for ref              }

## _Inlines() [](#method-i-_Inlines)
Inlines = (!@Endline Inline:i { i } | @Endline:c !(&{ github? } Ticks3
/[^`n]*$/) &Inline { c })+:chunks @Endline? { chunks }

## _Label() [](#method-i-_Label)
Label = "[" (!"^" &{ notes? } | &. &{ !notes? }) @StartList:a (!"]" Inline:l {
a << l })* "]" { a.join.gsub(/s+/, ' ') }

## _Line() [](#method-i-_Line)
Line = @RawLine:a { a }

## _LineBreak() [](#method-i-_LineBreak)
LineBreak = "  " @NormalEndline { RDoc::Markup::HardBreak.new }

## _Link() [](#method-i-_Link)
Link = (ExplicitLink | ReferenceLink | AutoLink)

## _ListBlock() [](#method-i-_ListBlock)
ListBlock = !@BlankLine Line:a ListBlockLine*:c { [a, *c] }

## _ListBlockLine() [](#method-i-_ListBlockLine)
ListBlockLine = !@BlankLine !(Indent? (Bullet | Enumerator)) !HorizontalRule
OptionallyIndentedLine

## _ListContinuationBlock() [](#method-i-_ListContinuationBlock)
ListContinuationBlock = @StartList:a @BlankLine* { a << "n" } (Indent
ListBlock:b { a.concat b })+ { a }

## _ListItem() [](#method-i-_ListItem)
ListItem = (Bullet | Enumerator) @StartList:a ListBlock:b { a << b }
(ListContinuationBlock:c { a.push(*c) })* { list_item_from a }

## _ListItemTight() [](#method-i-_ListItemTight)
ListItemTight = (Bullet | Enumerator) ListBlock:a (!@BlankLine
ListContinuationBlock:b { a.push(*b) })* !ListContinuationBlock {
list_item_from a }

## _ListLoose() [](#method-i-_ListLoose)
ListLoose = @StartList:a (ListItem:b @BlankLine* { a << b })+ { a }

## _ListTight() [](#method-i-_ListTight)
ListTight = ListItemTight+:a @BlankLine* !(Bullet | Enumerator) { a }

## _Newline() [](#method-i-_Newline)
Newline = %literals.Newline

## _NonblankIndentedLine() [](#method-i-_NonblankIndentedLine)
NonblankIndentedLine = !@BlankLine IndentedLine

## _NonindentSpace() [](#method-i-_NonindentSpace)
NonindentSpace = / {0,3}/

## _Nonspacechar() [](#method-i-_Nonspacechar)
Nonspacechar = !@Spacechar !@Newline .

## _NormalChar() [](#method-i-_NormalChar)
NormalChar = !(@SpecialChar | @Spacechar | @Newline) .

## _NormalEndline() [](#method-i-_NormalEndline)
NormalEndline = @Sp @Newline !@BlankLine !">" !AtxStart !(Line /={1,}|-{1,}/
@Newline) { "n" }

## _Note() [](#method-i-_Note)
Note = &{ notes? } @NonindentSpace RawNoteReference:ref ":" @Sp @StartList:a
RawNoteBlock:i { a.concat i } (&Indent RawNoteBlock:i { a.concat i })* {
@[footnotes](ref) = paragraph a                    nil                 }

## _NoteReference() [](#method-i-_NoteReference)
NoteReference = &{ notes? } RawNoteReference:ref { note_for ref }

## _Notes() [](#method-i-_Notes)
Notes = (Note | SkipBlock)*

## _OptionallyIndentedLine() [](#method-i-_OptionallyIndentedLine)
OptionallyIndentedLine = Indent? Line

## _OrderedList() [](#method-i-_OrderedList)
OrderedList = &Enumerator (ListTight | ListLoose):a {
RDoc::Markup::List.new(:NUMBER, *a) }

## _Para() [](#method-i-_Para)
Para = @NonindentSpace Inlines:a @BlankLine+ { paragraph a }

## _Plain() [](#method-i-_Plain)
Plain = Inlines:a { paragraph a }

## _Quoted() [](#method-i-_Quoted)
Quoted = (""" (!""" .)* """ | "'" (!"'" .)* "'")

## _RawHtml() [](#method-i-_RawHtml)
RawHtml = < (HtmlComment | HtmlBlockScript | HtmlTag) > { if html? then text
else '' end }

## _RawLine() [](#method-i-_RawLine)
RawLine = (< /[^r\n]*/ @Newline > | < .+ > @Eof) { text }

## _RawNoteBlock() [](#method-i-_RawNoteBlock)
RawNoteBlock = @StartList:a (!@BlankLine !RawNoteReference
OptionallyIndentedLine:l { a << l })+ < @BlankLine* > { a << text } { a }

## _RawNoteReference() [](#method-i-_RawNoteReference)
RawNoteReference = "[^" < (!@Newline !"]" .)+ > "]" { text }

## _RefSrc() [](#method-i-_RefSrc)
RefSrc = < Nonspacechar+ > { text }

## _RefTitle() [](#method-i-_RefTitle)
RefTitle = (RefTitleSingle | RefTitleDouble | RefTitleParens | EmptyTitle)

## _RefTitleDouble() [](#method-i-_RefTitleDouble)
RefTitleDouble = Spnl """ < (!(""" @Sp @Newline | @Newline) .)* > """ { text }

## _RefTitleParens() [](#method-i-_RefTitleParens)
RefTitleParens = Spnl "(" < (!(")" @Sp @Newline | @Newline) .)* > ")" { text }

## _RefTitleSingle() [](#method-i-_RefTitleSingle)
RefTitleSingle = Spnl "'" < (!("'" @Sp @Newline | @Newline) .)* > "'" { text }

## _Reference() [](#method-i-_Reference)
Reference = @NonindentSpace !"[]" Label:label ":" Spnl RefSrc:link RefTitle
@BlankLine+ { # TODO use title               reference label, link            
  nil             }

## _ReferenceLink() [](#method-i-_ReferenceLink)
ReferenceLink = (ReferenceLinkDouble | ReferenceLinkSingle)

## _ReferenceLinkDouble() [](#method-i-_ReferenceLinkDouble)
ReferenceLinkDouble = Label:content < Spnl > !"[]" Label:label { link_to
content, label, text }

## _ReferenceLinkSingle() [](#method-i-_ReferenceLinkSingle)
ReferenceLinkSingle = Label:content < (Spnl "[]")? > { link_to content,
content, text }

## _References() [](#method-i-_References)
References = (Reference | SkipBlock)*

## _SetextBottom1() [](#method-i-_SetextBottom1)
SetextBottom1 = /={1,}/ @Newline

## _SetextBottom2() [](#method-i-_SetextBottom2)
SetextBottom2 = /-{1,}/ @Newline

## _SetextHeading() [](#method-i-_SetextHeading)
SetextHeading = (SetextHeading1 | SetextHeading2)

## _SetextHeading1() [](#method-i-_SetextHeading1)
SetextHeading1 = &(@RawLine SetextBottom1) @StartList:a (!@Endline Inline:b {
a << b })+ @Sp @Newline SetextBottom1 { RDoc::Markup::Heading.new(1, a.join) }

## _SetextHeading2() [](#method-i-_SetextHeading2)
SetextHeading2 = &(@RawLine SetextBottom2) @StartList:a (!@Endline Inline:b {
a << b })+ @Sp @Newline SetextBottom2 { RDoc::Markup::Heading.new(2, a.join) }

## _SkipBlock() [](#method-i-_SkipBlock)
SkipBlock = (HtmlBlock | (!"#" !SetextBottom1 !SetextBottom2 !@BlankLine
@RawLine)+ @BlankLine* | @BlankLine+ | @RawLine)

## _Source() [](#method-i-_Source)
Source = ("<" < SourceContents > ">" | < SourceContents >) { text }

## _SourceContents() [](#method-i-_SourceContents)
SourceContents = ((!"(" !")" !">" Nonspacechar)+ | "(" SourceContents ")")*

## _Sp() [](#method-i-_Sp)
Sp = @Spacechar*

## _Space() [](#method-i-_Space)
Space = @Spacechar+ { " " }

## _Spacechar() [](#method-i-_Spacechar)
Spacechar = %literals.Spacechar

## _SpecialChar() [](#method-i-_SpecialChar)
SpecialChar = (/[~*[_`&\](\)()<!#\'"]/ | @ExtendedSpecialChar)

## _Spnl() [](#method-i-_Spnl)
Spnl = @Sp (@Newline @Sp)?

## _StarLine() [](#method-i-_StarLine)
StarLine = (< /*{4,}/ > { text } | < @Spacechar /*+/ &@Spacechar > { text })

## _StartList() [](#method-i-_StartList)
StartList = &. { [] }

## _Str() [](#method-i-_Str)
Str = @StartList:a < @NormalChar+ > { a = text } (StrChunk:c { a << c })* { a
}

## _StrChunk() [](#method-i-_StrChunk)
StrChunk = < (@NormalChar | /_+/ &Alphanumeric)+ > { text }

## _Strike() [](#method-i-_Strike)
Strike = &{ strike? } "~~" !@Whitespace @StartList:a (!"~~" Inline:b { a << b
})+ "~~" { strike a.join }

## _Strong() [](#method-i-_Strong)
Strong = (StrongStar | StrongUl)

## _StrongStar() [](#method-i-_StrongStar)
StrongStar = "**" !@Whitespace @StartList:a (!"**" Inline:b { a << b })+ "**"
{ strong a.join }

## _StrongUl() [](#method-i-_StrongUl)
StrongUl = "__" !@Whitespace @StartList:a (!"__" Inline:b { a << b })+ "__" {
strong a.join }

## _StyleBlock() [](#method-i-_StyleBlock)
StyleBlock = < InStyleTags > @BlankLine* { if css? then                    
RDoc::Markup::Raw.new text                   end }

## _StyleClose() [](#method-i-_StyleClose)
StyleClose = "<" Spnl "/" ("style" | "STYLE") Spnl ">"

## _StyleOpen() [](#method-i-_StyleOpen)
StyleOpen = "<" Spnl ("style" | "STYLE") Spnl HtmlAttribute* ">"

## _Symbol() [](#method-i-_Symbol)
Symbol = < @SpecialChar > { text }

## _Table() [](#method-i-_Table)
Table = &{ github? } TableHead:header TableLine:line TableRow+:body { table =
RDoc::Markup::Table.new(header, line, body) }

## _TableAlign() [](#method-i-_TableAlign)
TableAlign = < /:?-+:?/ > @Sp {                 text.start_with?(":") ?       
         (text.end_with?(":") ? :center : :left) :                
(text.end_with?(":") ? :right : nil)               }

## _TableAlign2() [](#method-i-_TableAlign2)
TableAlign2 = "|" @Sp TableAlign

## _TableHead() [](#method-i-_TableHead)
TableHead = TableItem2+:items "|"? @Newline { items }

## _TableItem() [](#method-i-_TableItem)
TableItem = < /(?:\.|[^|n])+/ > { text.strip.gsub(/\(.)/, '1')  }

## _TableItem2() [](#method-i-_TableItem2)
TableItem2 = "|" TableItem

## _TableLine() [](#method-i-_TableLine)
TableLine = ((TableAlign:align1 TableAlign2*:aligns {[align1, *aligns] }):line
| TableAlign2+:line) "|"? @Newline { line }

## _TableRow() [](#method-i-_TableRow)
TableRow = ((TableItem:item1 TableItem2*:items { [item1, *items] }):row |
TableItem2+:row) "|"? @Newline { row }

## _TerminalEndline() [](#method-i-_TerminalEndline)
TerminalEndline = @Sp @Newline @Eof

## _Ticks1() [](#method-i-_Ticks1)
Ticks1 = "`" !"`"

## _Ticks2() [](#method-i-_Ticks2)
Ticks2 = "``" !"`"

## _Ticks3() [](#method-i-_Ticks3)
Ticks3 = "```" !"`"

## _Ticks4() [](#method-i-_Ticks4)
Ticks4 = "````" !"`"

## _Ticks5() [](#method-i-_Ticks5)
Ticks5 = "`````" !"`"

## _Title() [](#method-i-_Title)
Title = (TitleSingle | TitleDouble | ""):a { a }

## _TitleDouble() [](#method-i-_TitleDouble)
TitleDouble = """ (!(""" @Sp (")" | @Newline)) .)* """

## _TitleSingle() [](#method-i-_TitleSingle)
TitleSingle = "'" (!("'" @Sp (")" | @Newline)) .)* "'"

## _UlLine() [](#method-i-_UlLine)
UlLine = (< /_{4,}/ > { text } | < @Spacechar /_+/ &@Spacechar > { text })

## _UlOrStarLine() [](#method-i-_UlOrStarLine)
UlOrStarLine = (UlLine | StarLine):a { a }

## _Verbatim() [](#method-i-_Verbatim)
Verbatim = VerbatimChunk+:a { RDoc::Markup::Verbatim.new(*a.flatten) }

## _VerbatimChunk() [](#method-i-_VerbatimChunk)
VerbatimChunk = @BlankLine*:a NonblankIndentedLine+:b { a.concat b }

## _Whitespace() [](#method-i-_Whitespace)
Whitespace = (@Spacechar | @Newline)

## _root() [](#method-i-_root)
root = Doc

## apply(rule) [](#method-i-apply)

## apply_with_args(rule, *args) [](#method-i-apply_with_args)

## break_on_newline() [](#method-i-break_on_newline)
Converts all newlines into hard breaks

## css() [](#method-i-css)
Allow style blocks

## current_character(targetpos) [](#method-i-current_character)

## current_column(targetpos) [](#method-i-current_column)

## current_line(targetpos) [](#method-i-current_line)

## current_pos_info(targetpos) [](#method-i-current_pos_info)

## definition_lists() [](#method-i-definition_lists)
Allow PHP Markdown Extras style definition lists

## emphasis(text) [](#method-i-emphasis)
Wraps `text` in emphasis for rdoc inline formatting

## extension(name, enable) [](#method-i-extension)
:category: Extensions

Enables or disables the extension with `name`

## extension?(name) [](#method-i-extension?)
:category: Extensions

Is the extension `name` enabled?

**@return** [Boolean] 

## external_invoke(other, rule, *args) [](#method-i-external_invoke)

## failure_caret() [](#method-i-failure_caret)

## failure_character() [](#method-i-failure_character)

## failure_info() [](#method-i-failure_info)

## failure_oneline() [](#method-i-failure_oneline)

## get_byte() [](#method-i-get_byte)

## get_line(no) [](#method-i-get_line)

## get_text(start) [](#method-i-get_text)

## github() [](#method-i-github)
Allow Github Flavored Markdown

## grow_lr(rule, args, start_pos, m) [](#method-i-grow_lr)

## html() [](#method-i-html)
Allow HTML

## initialize(extensionsDEFAULT_EXTENSIONS, debugfalse) [](#method-i-initialize)
Creates a new markdown parser that enables the given `extensions`.

**@return** [Markdown] a new instance of Markdown

## inner_parse(text) [](#method-i-inner_parse)
Parses `text` in a clone of this parser.  This is used for handling nested
lists the same way as markdown_parser.

## lines() [](#method-i-lines)

## link_to(content, labelcontent, textnil) [](#method-i-link_to)
Finds a link reference for `label` and creates a new link to it with `content`
as the link text.  If `label` was not encountered in the reference-gathering
parser pass the label and content are reconstructed with the linking `text`
(usually whitespace).

**@raise** [ParseError] 

## list_item_from(unparsed) [](#method-i-list_item_from)
Creates an RDoc::Markup::ListItem by parsing the `unparsed` content from the
first parsing pass.

## match_string(str) [](#method-i-match_string)

## note(label) [](#method-i-note)
Stores `label` as a note and fills in previously unknown note references.

## note_for(ref) [](#method-i-note_for)
Creates a new link for the footnote `reference` and adds the reference to the
note order list for proper display at the end of the document.

## notes() [](#method-i-notes)
Enables the notes extension

## orig_initialize() [](#method-i-orig_initialize)
This is distinct from setup_parser so that a standalone parser can redefine
#initialize and still have access to the proper parser setup code. TODO remove
when kpeg 0.10 is released

**@return** [Markdown] a new instance of Markdown

## paragraph(parts) [](#method-i-paragraph)
Creates an RDoc::Markup::Paragraph from `parts` and including
extension-specific behavior

## parse(markdown) [](#method-i-parse)
Parses `markdown` into an RDoc::Document

## peg_parse() [](#method-i-peg_parse)
The internal kpeg parse method

## position_line_offsets() [](#method-i-position_line_offsets)

## raise_error() [](#method-i-raise_error)

**@raise** [ParseError] 

## reference(label, link) [](#method-i-reference)
Stores `label` as a reference to `link` and fills in previously unknown link
references.

## scan(reg) [](#method-i-scan)

## set_failed_rule(name) [](#method-i-set_failed_rule)

## set_string(string, pos) [](#method-i-set_string)
Sets the string and current parsing position for the parser.

## setup_foreign_grammar() [](#method-i-setup_foreign_grammar)
:stopdoc:

## setup_parser(str, debugfalse) [](#method-i-setup_parser)
Prepares for parsing `str`.  If you define a custom initialize you must call
this method before #parse

## show_error(ioSTDOUT) [](#method-i-show_error)

## show_pos() [](#method-i-show_pos)

## strike(text) [](#method-i-strike)
Wraps `text` in strike markup for rdoc inline formatting

## strong(text) [](#method-i-strong)
Wraps `text` in strong markup for rdoc inline formatting

