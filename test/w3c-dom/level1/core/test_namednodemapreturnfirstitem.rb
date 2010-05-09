
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001 World Wide Web Consortium,
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
#     The "item(index)" method returns the indexth item in 
#    the map(test for first item). 
#    
#    Retrieve the second employee and create a NamedNodeMap 
#    listing of the attributes of the last child. Since the
#    DOM does not specify an order of these nodes the contents
#    of the FIRST node can contain either "domestic" or "street".
#    The test should return "true" if the FIRST node is either
#    of these values.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-349467F9]
##
DOMTestCase('namednodemapreturnfirstitem') do

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
    preload(contentType, "staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_namednodemapreturnfirstitem
    doc = nil
    elementList = nil
    testAddress = nil
    attributes = nil
    child = nil
    name = nil
    doc = load_document("staff", true)
      elementList = doc.getElementsByTagName("address")
      testAddress = elementList.item(1)
      attributes = testAddress.attributes()
      child = attributes.item(0)
      name = child.nodeName()
      assertTrue("namednodemapReturnFirstItemAssert", 
    (equals("domestic", name) | equals("street", name))
)
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/namednodemapreturnfirstitem"
  end
end
