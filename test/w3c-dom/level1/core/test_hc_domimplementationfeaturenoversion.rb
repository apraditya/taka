
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
#    Load a document and invoke its 
#    "getImplementation()" method.  This should create a
#    DOMImplementation object whose "hasFeature(feature,
#    version)" method is invoked with version equal to "".
#    If the version is not specified, supporting any version
#    feature will cause the method to return "true".
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-5CED94D7]
# see[http://www.w3.org/2000/11/DOM-Level-2-errata#core-14]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=245]
##
DOMTestCase('hc_domimplementationfeaturenoversion') do

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
  def test_hc_domimplementationfeaturenoversion
    doc = nil
    domImpl = nil
    state = nil
    doc = load_document("hc_staff", false)
      domImpl = doc.getImplementation()
      
      if (("text/html" == getContentType()))
        state = domImpl.hasFeature("HTML", "")

          else
            state = domImpl.hasFeature("XML", "")

         end
       assertTrue("hasFeatureBlank", state)
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_domimplementationfeaturenoversion"
  end
end

