# Class: CGITagHelperTest
**Inherits:** Test::Unit::TestCase
    
**Includes:** UpdateEnv
  




#Instance Methods
## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## test_cgi_tag_helper_html3() [](#method-i-test_cgi_tag_helper_html3)

## test_cgi_tag_helper_html5() [](#method-i-test_cgi_tag_helper_html5)
def test_cgi_tag_helper_html4
      ## html4
      cgi = CGI.new('html4')
      ## html4 transitional
      cgi = CGI.new('html4Tr')
      ## html4 frameset
      cgi = CGI.new('html4Fr')
    end

## update_env(environ) [](#method-i-update_env)

