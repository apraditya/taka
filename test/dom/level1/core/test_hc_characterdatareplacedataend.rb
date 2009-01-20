
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001 World Wide Web Consortium,
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
#     The "replaceData(offset,count,arg)" method replaces the 
#    characters starting at the specified offset with the
#    specified string.  Test for replacement at the 
#    end of the data.
#    
#    Retrieve the character data from the last child of the
#    first employee.  The "replaceData(offset,count,arg)"
#    method is then called with offset=30 and count=5 and
#    arg="98665".  The method should replace characters 30  
#    thru 34 of the character data with "98665".
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-72AB8359]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-E5CBA7FB]
##
DOMTestCase('hc_characterdatareplacedataend') do

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
  def test_hc_characterdatareplacedataend
    doc = nil
    elementList = nil
    nameNode = nil
    child = nil
    childData = nil
    doc = load_document("hc_staff", true)
      elementList = doc.getElementsByTagName("acronym")
      nameNode = elementList.item(0)
      child = nameNode.firstChild()
      child.replaceData(30, 5, "98665")
      childData = child.data()
      assert_equal("1230 North Ave. Dallas, Texas 98665", childData, "characterdataReplaceDataEndAssert")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_characterdatareplacedataend"
  end
end

