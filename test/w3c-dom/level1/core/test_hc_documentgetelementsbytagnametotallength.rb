
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
#    Retrieve the entire DOM document and invoke its 
#    "getElementsByTagName(tagName)" method with tagName
#    equal to "*".  The method should return a NodeList 
#    that contains all the elements of the document. 
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-A6C9094]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=251]
##
DOMTestCase('hc_documentgetelementsbytagnametotallength') do

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
    preload(contentType, "hc_staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_documentgetelementsbytagnametotallength
    doc = nil
    nameList = nil
    expectedNames = []
      expectedNames << "html"
      expectedNames << "head"
      expectedNames << "meta"
      expectedNames << "title"
      expectedNames << "script"
      expectedNames << "script"
      expectedNames << "script"
      expectedNames << "body"
      expectedNames << "p"
      expectedNames << "em"
      expectedNames << "strong"
      expectedNames << "code"
      expectedNames << "sup"
      expectedNames << "var"
      expectedNames << "acronym"
      expectedNames << "p"
      expectedNames << "em"
      expectedNames << "strong"
      expectedNames << "code"
      expectedNames << "sup"
      expectedNames << "var"
      expectedNames << "acronym"
      expectedNames << "p"
      expectedNames << "em"
      expectedNames << "strong"
      expectedNames << "code"
      expectedNames << "sup"
      expectedNames << "var"
      expectedNames << "acronym"
      expectedNames << "p"
      expectedNames << "em"
      expectedNames << "strong"
      expectedNames << "code"
      expectedNames << "sup"
      expectedNames << "var"
      expectedNames << "acronym"
      expectedNames << "p"
      expectedNames << "em"
      expectedNames << "strong"
      expectedNames << "code"
      expectedNames << "sup"
      expectedNames << "var"
      expectedNames << "acronym"
      
    svgExpectedNames = []
      svgExpectedNames << "svg"
      svgExpectedNames << "rect"
      svgExpectedNames << "script"
      svgExpectedNames << "head"
      svgExpectedNames << "meta"
      svgExpectedNames << "title"
      svgExpectedNames << "body"
      svgExpectedNames << "p"
      svgExpectedNames << "em"
      svgExpectedNames << "strong"
      svgExpectedNames << "code"
      svgExpectedNames << "sup"
      svgExpectedNames << "var"
      svgExpectedNames << "acronym"
      svgExpectedNames << "p"
      svgExpectedNames << "em"
      svgExpectedNames << "strong"
      svgExpectedNames << "code"
      svgExpectedNames << "sup"
      svgExpectedNames << "var"
      svgExpectedNames << "acronym"
      svgExpectedNames << "p"
      svgExpectedNames << "em"
      svgExpectedNames << "strong"
      svgExpectedNames << "code"
      svgExpectedNames << "sup"
      svgExpectedNames << "var"
      svgExpectedNames << "acronym"
      svgExpectedNames << "p"
      svgExpectedNames << "em"
      svgExpectedNames << "strong"
      svgExpectedNames << "code"
      svgExpectedNames << "sup"
      svgExpectedNames << "var"
      svgExpectedNames << "acronym"
      svgExpectedNames << "p"
      svgExpectedNames << "em"
      svgExpectedNames << "strong"
      svgExpectedNames << "code"
      svgExpectedNames << "sup"
      svgExpectedNames << "var"
      svgExpectedNames << "acronym"
      
    actualNames = []
      
    thisElement = nil
    thisTag = nil
    doc = load_document("hc_staff", false)
      nameList = doc.getElementsByTagName("*")
      indexid2945398 = 0
    while (indexid2945398 < nameList.length)
      thisElement = nameList.item(indexid2945398)
    thisTag = thisElement.tagName()
      actualNames << thisTag
      indexid2945398 += 1
            end
      
      if (("image/svg+xml" == getContentType()))
        assertEqualsAutoCase("element", "svgTagNames", svgExpectedNames, actualNames)
        
          else
            assertEqualsAutoCase("element", "tagNames", expectedNames, actualNames)
        
         end
       
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_documentgetelementsbytagnametotallength"
  end
end
