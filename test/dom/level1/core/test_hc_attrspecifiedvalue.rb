
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2004 World Wide Web Consortium,
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

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))

###
#     The "getSpecified()" method for an Attr node should 
#   be set to true if the attribute was explicitly given
#   a value.
#   Retrieve the attribute named "domestic" from the last 
#   child of of the first employee and examine the value 
#   returned by the "getSpecified()" method.  This test uses 
#   the "getNamedItem(name)" method from the NamedNodeMap 
#   interface.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-862529273]
##
DOMTestCase('hc_attrspecifiedvalue') do

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
    preload(contentType, "hc_staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_attrspecifiedvalue
    doc = nil
    addressList = nil
    testNode = nil
    attributes = nil
    domesticAttr = nil
    state = nil
    doc = load_document("hc_staff", false)
      addressList = doc.getElementsByTagName("acronym")
      testNode = addressList.item(0)
      attributes = testNode.attributes()
      domesticAttr = attributes.getNamedItem("title")
      state = domesticAttr.specified()
      assertTrue("acronymTitleSpecified", state)
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_attrspecifiedvalue"
  end
end

