# Module: CGI::Html4Fr
    
**Includes:** CGI::TagMaker
  

Mixin module for generating HTML version 4 with framesets.



#Instance Methods
## doctype() [](#method-i-doctype)
The DOCTYPE declaration for this version of HTML

## nOE_element(element, attributes{}) [](#method-i-nOE_element)
Generate code for an empty element.

    - O EMPTY

## nOE_element_def(attributes{}, &block) [](#method-i-nOE_element_def)

## nO_element(element, attributes{}) [](#method-i-nO_element)
Generate code for an element for which the end (and possibly the start) tag is
optional.

    O O or - O

## nO_element_def(attributes{}, &block) [](#method-i-nO_element_def)

## nn_element(element, attributes{}) [](#method-i-nn_element)
Generate code for an element with required start and end tags.

    - -

## nn_element_def(attributes{}, &block) [](#method-i-nn_element_def)

