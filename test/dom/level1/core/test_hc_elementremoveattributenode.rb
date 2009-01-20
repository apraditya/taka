
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
#     The "removeAttributeNode(oldAttr)" method returns the
#    node that was removed. 
#    
#    Retrieve the last child of the third employee and
#    remove its "class" Attr node.  The method should  
#    return the old attribute node.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-D589198]
##
DOMTestCase('hc_elementremoveattributenode') do

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
  def test_hc_elementremoveattributenode
    doc = nil
    elementList = nil
    testEmployee = nil
    streetAttr = nil
    removedAttr = nil
    removedValue = nil
    doc = load_document("hc_staff", true)
      elementList = doc.getElementsByTagName("acronym")
      testEmployee = elementList.item(2)
      streetAttr = testEmployee.getAttributeNode("class")
      removedAttr = testEmployee.removeAttributeNode(streetAttr)
      assert_not_nil(removedAttr, "removedAttrNotNull")
      removedValue = removedAttr.value()
      assert_equal("No", removedValue, "elementRemoveAttributeNodeAssert")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_elementremoveattributenode"
  end
end

