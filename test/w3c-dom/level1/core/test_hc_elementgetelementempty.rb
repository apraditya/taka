
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2003 World Wide Web Consortium,
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University). All
Rights Reserved. This program is distributed under the W3C's Software
Intellectual Property License. This program is distributed in the
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
See W3C License http://www.w3.org/Consortium/Legal/ for more details.

=end
#

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'w3c_helper'))

###
#     The "getAttribute(name)" method returns an empty 
#    string if no value was assigned to an attribute and 
#    no default value was given in the DTD file.
#    
#    Retrieve the last child of the last employee, then
#    invoke "getAttribute(name)" method, where "strong" is an
#    attribute without a specified or DTD default value. 
#    The "getAttribute(name)" method should return the empty
#    string.  This method makes use of the
#    "createAttribute(newAttr)" method from the Document
#    interface.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-666EE0F9]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=243]
##
DOMTestCase('hc_elementgetelementempty') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "hc_staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_elementgetelementempty
    doc = nil
    newAttribute = nil
    elementList = nil
    testEmployee = nil
    domesticAttr = nil
    attrValue = nil
    doc = load_document("hc_staff", true)
      newAttribute = doc.createAttribute("lang")
      elementList = doc.getElementsByTagName("acronym")
      testEmployee = elementList.item(3)
      domesticAttr = testEmployee.setAttributeNode(newAttribute)
      attrValue = testEmployee.getAttribute("lang")
      assert_equal("", attrValue, "elementGetElementEmptyAssert")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_elementgetelementempty"
  end
end

