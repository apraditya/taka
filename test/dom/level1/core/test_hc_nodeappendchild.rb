
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2003 World Wide Web Consortium,
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
#     Retrieve the second "p" and append a "br" Element
#     node to the list of children.   The last node in the list
#     is then retrieved and its NodeName examined.   The
#     "getNodeName()" method should return "br".
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-184E7107]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=247]
##
DOMTestCase('hc_nodeappendchild') do

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
  def test_hc_nodeappendchild
    doc = nil
    elementList = nil
    employeeNode = nil
    childList = nil
    createdNode = nil
    lchild = nil
    childName = nil
    appendedChild = nil
    doc = load_document("hc_staff", true)
      elementList = doc.getElementsByTagName("p")
      employeeNode = elementList.item(1)
      childList = employeeNode.childNodes()
      createdNode = doc.createElement("br")
      appendedChild = employeeNode.appendChild(createdNode)
      lchild = employeeNode.lastChild()
      childName = lchild.nodeName()
      assertEqualsAutoCase("element", "nodeName", "br", childName)
        
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_nodeappendchild"
  end
end

