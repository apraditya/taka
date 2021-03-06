
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
#     The "importNode(importedNode,deep)" method for a 
#    Document should import the given importedNode into that Document.
#    The importedNode is of type Attr. 
#    The ownerElement is set to null. Specified flag is set to true.
#    Children is imported.
#    
#    Create a new attribute whose name is "elem:attr1" in a different document.
#    Create a child Text node with value "importedText" for the attribute node above.
#    Invoke method importNode(importedNode,deep) on this document with
#    importedNode being the newly created attribute.
#    Method should return a node whose name matches "elem:attr1" and a child node
#    whose value equals "importedText".
#    The returned node should belong to this document whose systemId is "staff.dtd"
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Core-Document-importNode]
##
DOMTestCase('importNode01') do

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
    preload(contentType, "staffNS", true)
    preload(contentType, "staffNS", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_importNode01
    doc = nil
    aNewDoc = nil
    newAttr = nil
    importedChild = nil
    aNode = nil
    ownerDocument = nil
    attrOwnerElement = nil
    docType = nil
    system = nil
    specified = nil
    childList = nil
    nodeName = nil
    child = nil
    childValue = nil
    result = []
      
    expectedResult = []
      expectedResult << "elem:attr1"
      expectedResult << "importedText"
      
    doc = load_document("staffNS", true)
      aNewDoc = load_document("staffNS", true)
      newAttr = aNewDoc.createAttribute("elem:attr1")
      importedChild = aNewDoc.createTextNode("importedText")
      aNode = newAttr.appendChild(importedChild)
      aNode = doc.importNode(newAttr, false)
      ownerDocument = aNode.ownerDocument()
      docType = ownerDocument.doctype()
      system = docType.systemId()
      assert_not_nil(aNode, "aNode")
      assertURIEquals("systemId", nil, nil, nil, "staffNS.dtd", nil, nil, nil, nil, system)
attrOwnerElement = aNode.ownerElement()
      assert_nil(attrOwnerElement, "ownerElement")
      specified = aNode.specified()
      assertTrue("specified", specified)
      childList = aNode.childNodes()
      assertSize("childList", 1, childList)
      nodeName = aNode.nodeName()
      assert_equal("elem:attr1", nodeName, "nodeName")
            child = aNode.firstChild()
      childValue = child.nodeValue()
      assert_equal("importedText", childValue, "childValue")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/importNode01"
  end
end

