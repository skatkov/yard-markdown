# Class: Psych::TestBoolean
**Inherits:** Psych::TestCase
    

Test booleans from YAML spec: http://yaml.org/type/bool.html



#Instance Methods
## test_n() [](#method-i-test_n)
YAML spec says "n" and "N" may be used as false, but Syck treats them as
literal strings

## test_y() [](#method-i-test_y)
YAML spec says "y" and "Y" may be used as true, but Syck treats them as
literal strings

