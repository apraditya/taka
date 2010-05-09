
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2001 World Wide Web Consortium, 
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University).  All 
Rights Reserved.  This program is distributed under the W3C's Software
Intellectual Property License.  This program is distributed in the 
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
PURPOSE.  

See W3C License http://www.w3.org/Consortium/Legal/ for more details.


=end
#

require File.expand_path('../../../../w3c_helper', __FILE__)

###
#       The method setAttributeNS adds a new attribute.
#       Create a new element and add a new attribute node to it using the setAttributeNS method. 
#       Check if the attribute was correctly set by invoking the getAttributeNodeNS method 
#       and checking the nodeName and nodeValue of the returned nodes.
 #     
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-ElSetAttrNS]
##
DOMTestCase('elementsetattributens01') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
=begin
      org.w3c.domts.DocumentBuilderSetting[] settings = 
          new org.w3c.domts.DocumentBuilderSetting[] {
org.w3c.domts.DocumentBuilderSetting.namespaceAware
        };
        DOMTestDocumentBuilderFactory testFactory = factory.newInstance(settings)
        setFactory(testFactory)
=end

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
  def test_elementsetattributens01
    doc = nil
    element = nil
    attribute = nil
    attrName = nil
    attrValue = nil
    doc = load_document("staff", true)
      element = doc.createElementNS("http://www.w3.org/DOM", "dom:elem")
      element.setAttributeNS("http://www.w3.org/DOM/Test/setAttributeNS", "attr", "value")
      attribute = element.getAttributeNodeNS("http://www.w3.org/DOM/Test/setAttributeNS", "attr")
      attrName = attribute.nodeName()
      attrValue = attribute.nodeValue()
      assert_equal("attr", attrName, "elementsetattributens01_attrName")
            assert_equal("value", attrValue, "elementsetattributens01_attrValue")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/elementsetattributens01"
  end
end
