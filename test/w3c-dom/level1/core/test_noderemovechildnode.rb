
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

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'w3c_helper'))

###
#     Retrieve the second employee and remove its first child.
#     After the removal, the second employee should have five or twelve 
#     children and the first child should now be the child
#     that used to be at the second position in the list.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1734834066]
##
DOMTestCase('noderemovechildnode') do

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
    preload(contentType, "staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_noderemovechildnode
    doc = nil
    elementList = nil
    employeeNode = nil
    childList = nil
    oldChild = nil
    child = nil
    childName = nil
    length = nil
    removedChild = nil
    removedName = nil
    doc = load_document("staff", true)
      elementList = doc.getElementsByTagName("employee")
      employeeNode = elementList.item(1)
      childList = employeeNode.childNodes()
      oldChild = childList.item(0)
      removedChild = employeeNode.removeChild(oldChild)
      removedName = removedChild.nodeName()
      child = childList.item(0)
      childName = child.nodeName()
      length = childList.length()
      
      if (equals(5, length))
        assert_equal("employeeId", removedName, "removedNameNoWhitespace")
            assert_equal("name", childName, "childNameNoWhitespace")
            
          else
            assert_equal("#text", removedName, "removedName")
            assert_equal("employeeId", childName, "childName")
            assert_equal(12, length, "length")
            
         end
       
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/noderemovechildnode"
  end
end

