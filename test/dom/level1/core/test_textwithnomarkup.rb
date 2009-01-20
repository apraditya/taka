
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2004 World Wide Web Consortium,
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
#     If there is not any markup inside an Element or Attr node
#     content, then the text is contained in a single object   
#     implementing the Text interface that is the only child
#     of the element.
#     
#     Retrieve the textual data from the second child of the 
#     third employee.   That Text node contains a block of 
#     multiple text lines without markup, so they should be
#     treated as a single Text node.   The "getNodeValue()"    
#     method should contain the combination of the two lines.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1312295772]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-F68D080]
##
DOMTestCase('textwithnomarkup') do

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
    preload(contentType, "staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_textwithnomarkup
    doc = nil
    elementList = nil
    nameNode = nil
    nodeV = nil
    value = nil
    doc = load_document("staff", false)
      elementList = doc.getElementsByTagName("name")
      nameNode = elementList.item(2)
      nodeV = nameNode.firstChild()
      value = nodeV.nodeValue()
      assert_equal("Roger\n Jones", value, "textNodeValue")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/textwithnomarkup"
  end
end

