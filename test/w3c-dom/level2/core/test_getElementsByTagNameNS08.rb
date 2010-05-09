
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
#     Element.getElementsByTagNameNS('*','*') should return all child
#     elements.  There is some contention on whether this should match
#     unqualified elements, this test reflects the interpretation that
#     '*' should match elements in all namespaces and unqualified elements.
#     Derived from getElementsByTagNameNS01 which tests similar functionality
#     on the Document interface.
# @author Curt Arnold
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-1938918D]
##
DOMTestCase('getElementsByTagNameNS08') do

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
  def test_getElementsByTagNameNS08
    doc = nil
    docElem = nil
    newList = nil
    doc = load_document("staffNS", false)
      docElem = doc.documentElement()
      newList = docElem.getElementsByTagNameNS("*", "*")
      
      if (("image/svg+xml" == getContentType()))
        assertSize("listSize_svg", 38, newList)
      
          else
            assertSize("listSize", 36, newList)
      
         end
       
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/getElementsByTagNameNS08"
  end
end
