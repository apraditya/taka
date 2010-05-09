require File.expand_path('../../test_helper', __FILE__)

require 'webmock/test_unit'

class WindowTest < Test::Unit::TestCase
  include WebMock

  attr_reader :window

  def setup
    @window = Taka::Window.new
    window.location.instance_variable_set(:@uri, URI.parse('http://example.org'))
  end
  
  def jquery
    File.open(File.expand_path('../jquery-1.4.2.js', __FILE__), 'r') { |f| f.read }
  end
  
  def stub_get(path, body)
    stub_request(:any, "http://example.org/#{path}").to_return(:body => body)
  end

  test "load loads an html document" do
    window.load('<html></html>')
    assert_match /html/, window.document.to_s
  end

  test "load loads a file" do
    window.load(File.expand_path('../../../README.rdoc', __FILE__))
    assert_match /Taka/, window.document.to_s
  end

  test "loads linked scripts" do
    stub_get('foo.js', 'document.title = "foo"')
    window.load('<html><head><title></title><script src="/foo.js"></script></head></html>')
    assert_equal 'foo', window.document.title
  end

  test "can load and use jquery" do
    stub_get('jquery.js', jquery)
    window.load <<-html
      <html>
        <head>
          <script src="/jquery.js"></script>
          <script>$(document).ready(function() { log($("body").length) })</script>
        </head>
        <body></body>
      </html>
    html
    assert_equal 1, window.console.log.last.last
  end

  test "jquery selectors" do
    stub_get('jquery.js', jquery)
    window.load <<-html
      <html>
        <head><script src="/jquery.js"></script></head>
        <body><div id="foo"><ol><li class="bar"></li></ol></div></body>
      </html>
    html
    assert_equal 1, window.evaluate('$("div").length')
    assert_equal 1, window.evaluate('$("#foo").length')
    assert_equal 1, window.evaluate('$("#foo ol li").length')
    assert_equal 1, window.evaluate('$(".bar").length')
    # assert_equal 1, window.evaluate('$("html body #foo ol:nth-child(0) li.bar").length') # TODO!
  end
  
  test "jquery dom generation" do
    stub_get('jquery.js', jquery)
    window.load('<html><head><script src="/jquery.js"></script></head><body></body></html>')
    html = window.evaluate('jQuery("<div/><hr/><code/><b/>").toArray()').join('')
    assert_equal '<div></div><hr><code></code><b></b>', html
  end

  test "executes scripts" do
    window.load('<html><head><title></title><script>document.title = "foo"</script></head></html>')
    assert_equal 'foo', window.document.title
  end

  test "uri? returns true if the given argument is a (file or http) url, otherwise false" do
    assert window.send(:uri?, 'http://google.com')
    assert window.send(:uri?, 'file://tmp/foo.txt')

    assert !window.send(:uri?, '/tmp/foo.txt')
    assert !window.send(:uri?, '<html></html>')
  end

  test "file? returns true if the given argument is an absolute filename, otherwise false" do
    assert window.send(:file?, '/tmp/foo.txt')

    assert !window.send(:file?, 'file://tmp/foo.txt')
    assert !window.send(:file?, 'http://google.com')
    assert !window.send(:file?, '<html></html>')
  end
end