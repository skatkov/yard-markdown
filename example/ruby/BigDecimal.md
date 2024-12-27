# Class: BigDecimal
**Inherits:** Object
    



# Class Methods
## json_create(object ) [](#method-c-json_create)
See #as_json.

#Instance Methods
## as_json() [](#method-i-as_json)
Methods `BigDecimal#as_json` and `BigDecimal.json_create` may be used to
serialize and deserialize a BigDecimal object; see
[Marshal](rdoc-ref:Marshal).

Method `BigDecimal#as_json` serializes `self`, returning a 2-element hash
representing `self`:

    require 'json/add/bigdecimal'
    x = BigDecimal(2).as_json             # => {"json_class"=>"BigDecimal", "b"=>"27:0.2e1"}
    y = BigDecimal(2.0, 4).as_json        # => {"json_class"=>"BigDecimal", "b"=>"36:0.2e1"}
    z = BigDecimal(Complex(2, 0)).as_json # => {"json_class"=>"BigDecimal", "b"=>"27:0.2e1"}

Method `JSON.create` deserializes such a hash, returning a BigDecimal object:

    BigDecimal.json_create(x) # => 0.2e1
    BigDecimal.json_create(y) # => 0.2e1
    BigDecimal.json_create(z) # => 0.2e1

## to_json(*args) [](#method-i-to_json)
Returns a JSON string representing `self`:

    require 'json/add/bigdecimal'
    puts BigDecimal(2).to_json
    puts BigDecimal(2.0, 4).to_json
    puts BigDecimal(Complex(2, 0)).to_json

Output:

    {"json_class":"BigDecimal","b":"27:0.2e1"}
    {"json_class":"BigDecimal","b":"36:0.2e1"}
    {"json_class":"BigDecimal","b":"27:0.2e1"}

