
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

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))


###
#     HTMLCollections are live, they are automatically updated when the     
#     underlying document is changed.
#     Create a HTMLCollection object by invoking the rows attribute of the    
#     first TABLE element and examine its length, then add a new row and
#     re-examine the length.
# @author NIST
# @author Rick Rivello
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-html#ID-40057551]
##
DOMTestCase('HTMLCollection04') do

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
    preload(contentType, "collection", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_HTMLCollection04
    nodeList = nil
    testNode = nil
    rowLength1 = nil
    rowLength2 = nil
    rowsnodeList = nil
    newRow = nil
    vrowindex = nil
    doc = nil
    result = []
      
    expectedResult = []
      expectedResult << Integer(4)
      expectedResult << Integer(5)
      
    doc = load_document("collection", true)
      nodeList = doc.getElementsByTagName("table")
      assertSize("Asize", 1, nodeList)
      testNode = nodeList.item(0)
      rowsnodeList = testNode.rows()
      rowLength1 = rowsnodeList.length()
      result << Integer(rowLength1)
      newRow = testNode.insertRow(4)
      rowLength2 = rowsnodeList.length()
      result << Integer(rowLength2)
      assert_equal(expectedResult, result, "rowIndexLink")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/level1/html/HTMLCollection04"
  end
end

