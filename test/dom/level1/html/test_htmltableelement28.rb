
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
#     The insertRow() method inserts a new empty table row.
#     
#     Retrieve the second TABLE element and invoke the insertRow() method
#     with an index of 0. Currently the zero indexed row is in the THEAD
#     section of the TABLE.  The number of rows in the THEAD section before
#     insertion of the new row is one.  After the new row is inserted the number 
#     of rows in the THEAD section is two.
# @author NIST
# @author Rick Rivello
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-html#ID-39872903]
##
DOMTestCase('HTMLTableElement28') do

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
    preload(contentType, "table", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_HTMLTableElement28
    nodeList = nil
    testNode = nil
    newRow = nil
    rowsnodeList = nil
    vsection1 = nil
    vsection2 = nil
    vrows = nil
    doc = nil
    doc = load_document("table", true)
      nodeList = doc.getElementsByTagName("table")
      assertSize("Asize", 3, nodeList)
      testNode = nodeList.item(1)
      vsection1 = testNode.tHead()
      rowsnodeList = vsection1.rows()
      vrows = rowsnodeList.length()
      assert_equal(1, vrows, "rowsLink1")
            newRow = testNode.insertRow(0)
      vsection2 = testNode.tHead()
      rowsnodeList = vsection2.rows()
      vrows = rowsnodeList.length()
      assert_equal(2, vrows, "rowsLink2")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/level1/html/HTMLTableElement28"
  end
end

