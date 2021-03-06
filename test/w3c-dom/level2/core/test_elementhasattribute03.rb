
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2001-2003 World Wide Web Consortium, 
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
#       The method hasAttribute returns true when an attribute with a given name is specified 
#       on this element or has a default value, false otherwise.
#       Create an element Node and an attribute Node.  Invoke hasAttribute method
#       to verify that there is no attribute. Append the attribute node to the element node.
#       Invoke the hasAttribute method on the element and verify if it returns true.
 #     
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-NodeHasAttrs]
##
DOMTestCase('elementhasattribute03') do

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
    preload(contentType, "staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_elementhasattribute03
    doc = nil
    element = nil
    state = nil
    attribute = nil
    newAttribute = nil
    doc = load_document("staff", false)
      element = doc.createElement("address")
      attribute = doc.createAttribute("domestic")
      state = element.hasAttribute("domestic")
      assertFalse("elementhasattribute03_False", state)
newAttribute = element.setAttributeNode(attribute)
      state = element.hasAttribute("domestic")
      assertTrue("elementhasattribute03_True", state)
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/elementhasattribute03"
  end
end

