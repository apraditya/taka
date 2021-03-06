
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
#  The method createDocumentType with valid values for qualifiedName, publicId and
#  systemId should create an empty DocumentType node.
#  
#  Invoke createDocument on this DOMImplementation with a different valid qualifiedNames 
#  and a valid publicId and systemId.  Check if the the DocumentType node was created 
#  with its ownerDocument attribute set to null.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Level-2-Core-DOM-createDocType]
##
DOMTestCase('domimplementationcreatedocumenttype02') do

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
    preload(contentType, "staffNS", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_domimplementationcreatedocumenttype02
    doc = nil
    domImpl = nil
    newDocType = nil
    ownerDocument = nil
    publicId = "http://www.w3.org/DOM/Test/dom2.dtd";
    systemId = "dom2.dtd";
    qualifiedName = nil
    qualifiedNames = []
      qualifiedNames << "_:_"
      qualifiedNames << "_:h0"
      qualifiedNames << "_:test"
      qualifiedNames << "_:_."
      qualifiedNames << "_:a-"
      qualifiedNames << "l_:_"
      qualifiedNames << "ns:_0"
      qualifiedNames << "ns:a0"
      qualifiedNames << "ns0:test"
      qualifiedNames << "ns:EEE."
      qualifiedNames << "ns:_-"
      qualifiedNames << "a.b:c"
      qualifiedNames << "a-b:c.j"
      qualifiedNames << "a-b:c"
      
    doc = load_document("staffNS", false)
      domImpl = doc.getImplementation()
      indexid36025560 = 0
    while (indexid36025560 < qualifiedNames.size())
      qualifiedName = qualifiedNames.get(indexid36025560)
    newDocType = domImpl.createDocumentType(qualifiedName, publicId, systemId)
      assert_not_nil(newDocType, "domimplementationcreatedocumenttype02_newDocType")
      ownerDocument = newDocType.ownerDocument()
      assert_nil(ownerDocument, "domimplementationcreatedocumenttype02_ownerDocument")
      indexid36025560 += 1
            end
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/domimplementationcreatedocumenttype02"
  end
end

