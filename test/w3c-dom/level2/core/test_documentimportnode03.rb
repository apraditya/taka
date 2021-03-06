
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2001-2004 World Wide Web Consortium, 
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
#  The importNode method imports a node from another document to this document. 
#  The returned node has no parent; (parentNode is null). The source node is not 
#  altered or removed from the original document but a new copy of the source node
#  is created.
#  
#  Using the method importNode with deep=false, import the default Attribute attribute, 
#  "defaultAttr" of the second element node whose namespaceURI="http://www.nist.gov" and 
#  localName="defaultAttr", into the same document.
#  Check the parentNode, nodeName, nodeType and nodeValue of the imported node to 
 #  verify if it has been imported correctly.  
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Core-Document-importNode]
##
DOMTestCase('documentimportnode03') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
=begin
      org.w3c.domts.DocumentBuilderSetting[] settings = 
          new org.w3c.domts.DocumentBuilderSetting[] {
org.w3c.domts.DocumentBuilderSetting.namespaceAware,
org.w3c.domts.DocumentBuilderSetting.validating
        };
        DOMTestDocumentBuilderFactory testFactory = factory.newInstance(settings)
        setFactory(testFactory)
=end

    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "staffNS", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_documentimportnode03
    doc = nil
    element = nil
    attr = nil
    childList = nil
    importedAttr = nil
    nodeName = nil
    nodeType = nil
    nodeValue = nil
    doc = load_document("staffNS", true)
      childList = doc.getElementsByTagNameNS("http://www.nist.gov", "employee")
      element = childList.item(1)
      attr = element.getAttributeNode("defaultAttr")
      importedAttr = doc.importNode(attr, false)
      nodeName = importedAttr.nodeName()
      nodeValue = importedAttr.nodeValue()
      nodeType = importedAttr.nodeType()
      assert_equal("defaultAttr", nodeName, "documentimportnode03_nodeName")
            assert_equal(2, nodeType, "documentimportnode03_nodeType")
            assert_equal("defaultVal", nodeValue, "documentimportnode03_nodeValue")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/documentimportnode03"
  end
end

