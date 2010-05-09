require File.expand_path('../../test_helper', __FILE__)

require 'webmock/test_unit'

JQUERY_PATH = File.expand_path('../../../vendor/jquery/', __FILE__)

# class JQueryTest < Test::Unit::TestCase
#   include WebMock
# 
#   attr_reader :window
# 
#   def setup
#     @window = Taka::Window.new
#     window.location.instance_variable_set(:@uri, URI.parse('http://example.org/test/'))
#     stub_request(:any, /./).to_return do |request|
#       # puts "loading #{request.uri.path} ..."
#       { :body => File.open("#{JQUERY_PATH}#{request.uri.path}") { |f| f.read } }
#     end
#   end
# 
#   test "load loads an html document" do
#     window.load("http://example.org/test/index.html")
#     result = window.evaluate <<-js
#       jQuery('#qunit-tests ol li').toArray()
#     js
#     result.each do |tag|
#       p tag.className
#     end
#   end
# end


include WebMock
stub_request(:any, /./).to_return do |request| 
  # puts "loading #{request.uri.path}"
  { :body => File.open("#{JQUERY_PATH}#{request.uri.path}") { |f| f.read } }
end

class JQueryTest < Test::Unit::TestCase
  window = Taka::Window.new
  window.location.instance_variable_set(:@uri, URI.parse('http://example.org/test/'))

  window.load("http://example.org/test/index.html")

  # puts window.document.getElementById("qunit-tests")
  result = window.evaluate("jQuery('#qunit-tests > li').toArray()")
  count  = 0

  result.each do |tag|
    _module = tag.firstChild.innerHTML =~ /^([^<]*)/ && $1.strip
    tag.getElementsByTagName('li').each do |assertion|
      test("#{count += 1} #{_module}: #{assertion.textContent}") do
        flunk("#{_module}: #{assertion.textContent}") if assertion.className == 'fail'
      end
    end
  end
end