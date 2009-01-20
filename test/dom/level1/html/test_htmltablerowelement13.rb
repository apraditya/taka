
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
#     The deleteCell() method deletes a cell from the current row.   
#     
#     Retrieve the fourth TR element and examine the value of
#     the cells length attribute which should be set to six.  
#     Check the value of the first TD element.  Invoke the
#     deleteCell() method which will delete a cell from the current row.
#     Check the value of the cell at the zero index and also check
#     the number of cells which should now be five. 
# @author NIST
# @author Rick Rivello
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-html#ID-11738598]
##
DOMTestCase('HTMLTableRowElement13') do

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
    preload(contentType, "tablerow", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_HTMLTableRowElement13
    nodeList = nil
    cellsnodeList = nil
    testNode = nil
    trNode = nil
    cellNode = nil
    value = nil
    vcells = nil
    doc = nil
    doc = load_document("tablerow", true)
      nodeList = doc.getElementsByTagName("tr")
      assertSize("Asize", 5, nodeList)
      testNode = nodeList.item(3)
      cellsnodeList = testNode.cells()
      vcells = cellsnodeList.length()
      assert_equal(6, vcells, "cellsLink1")
            trNode = cellsnodeList.item(0)
      cellNode = trNode.firstChild()
      value = cellNode.nodeValue()
      assert_equal("EMP0001", value, "value1Link")
            testNode.deleteCell(0)
      testNode = nodeList.item(3)
      cellsnodeList = testNode.cells()
      vcells = cellsnodeList.length()
      assert_equal(5, vcells, "cellsLink2")
            trNode = cellsnodeList.item(0)
      cellNode = trNode.firstChild()
      value = cellNode.nodeValue()
      assert_equal("Margaret Martin", value, "value2Link")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/level1/html/HTMLTableRowElement13"
  end
end

