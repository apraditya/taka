
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
#     The method setNamedItemNS adds a node using its namespaceURI and localName and 
#     raises a HIERARCHY_REQUEST_ERR if an attempt is made to add a node doesn't belong 
#     in this NamedNodeMap.
#   Attempt to add an entity to a NamedNodeMap of attribute nodes,
#   Since nodes of this type cannot be added to the attribute node map a HIERARCHY_REQUEST_ERR
#   should be raised.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-setNamedItemNS]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=259]
##
DOMTestCase('namednodemapsetnameditemns10') do

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
    preload(contentType, "staffNS", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_namednodemapsetnameditemns10
    doc = nil
    docType = nil
    entities = nil
    attributes = nil
    entity = nil
    notation = nil
    element = nil
    elementList = nil
    newNode = nil
    doc = load_document("staffNS", true)
      docType = doc.doctype()
      entities = docType.entities()
      assert_not_nil(entities, "entitiesNotNull")
      entity = entities.getNamedItem("ent1")
      elementList = doc.getElementsByTagNameNS("http://www.nist.gov", "address")
      element = elementList.item(0)
      attributes = element.attributes()
      
    begin
      success = false;
      begin
        newNode = attributes.setNamedItemNS(entity)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::HIERARCHY_REQUEST_ERR)
      end 
      assert(success, "throw_HIERARCHY_REQUEST_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/namednodemapsetnameditemns10"
  end
end
