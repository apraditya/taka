
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
#     The createTFoot() method creates a table footer row or returns
#     an existing one.
#     Try to create a new TFOOT element on the second TABLE element.  
#     Since a TFOOT element already exists in the TABLE element a new
#     TFOOT element is not created and information from the already
#     existing TFOOT element is returned.  
# @author NIST
# @author Rick Rivello
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-html#ID-8453710]
##
DOMTestCase('HTMLTableElement23') do

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
  def test_HTMLTableElement23
    nodeList = nil
    testNode = nil
    vsection = nil
    newFoot = nil
    valign = nil
    doc = nil
    doc = load_document("table", true)
      nodeList = doc.getElementsByTagName("table")
      assertSize("Asize", 3, nodeList)
      testNode = nodeList.item(1)
      newFoot = testNode.createTFoot()
      vsection = testNode.tFoot()
      valign = vsection.align()
      assert_equal("center", valign, "alignLink")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/level1/html/HTMLTableElement23"
  end
end

