
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
#     The "removeChild(oldChild)" method removes the child node
#     indicated by "oldChild" from the list of children and
#     returns it. 
#     
#     Remove the first employee by invoking the
#     "removeChild(oldChild)" method an checking the
#     node returned by the "getParentNode()" method.   It
#     should be set to null.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1734834066]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=249]
##
DOMTestCase('hc_noderemovechild') do

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
  def test_hc_noderemovechild
    doc = nil
    rootNode = nil
    childList = nil
    childToRemove = nil
    removedChild = nil
    parentNode = nil
    doc = load_document("hc_staff", true)
      rootNode = doc.documentElement()
      childList = rootNode.childNodes()
      childToRemove = childList.item(1)
      removedChild = rootNode.removeChild(childToRemove)
      parentNode = removedChild.parentNode()
      assert_nil(parentNode, "parentNodeNull")
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_noderemovechild"
  end
end

