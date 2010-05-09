require File.expand_path('../../test_helper', __FILE__)

class LocationTest < Test::Unit::TestCase
  class Window
    attr_reader :url
    def load(url)
      @url = url
    end
  end

  attr_reader :google, :location, :window

  def setup
    @google = 'http://www.google.com:80/search?q=devmo#test'
    @window = Window.new
    @location = Taka::Location.new(window, Taka::Window::History.new)
    location.href = google
  end

  test "Location#hash: returns the the part of the URL that follows the # symbol, including the # symbol" do
    assert_equal '#test', location.hash
  end

  test "Location#host: returns the host name and port number" do
    assert_equal 'www.google.com:80', location.host
  end

  test "Location#hostname: returns the host name (without the port number or square brackets)" do
    assert_equal 'www.google.com', location.hostname
  end

  test "Location#href: returns the entire URL" do
    assert_equal 'http://www.google.com:80/search?q=devmo#test', location.href
  end

  test "Location#pathname: returns the path (relative to the host)" do
    assert_equal '/search', location.pathname
  end

  test "Location#port: returns the port number of the URL" do
    assert_equal '80', location.port
  end

  test "Location#protocol: returns the protocol of the URL" do
    assert_equal 'http:', location.protocol
  end

  test "Location#search: returns the part of the URL that follows the ? symbol, including the ? symbol" do
    assert_equal '?q=devmo', location.search
  end

  test "Location#assign(url): Load the document at the provided URL" do
    github = 'http://github.com:80'
    location.assign(github)

    assert_equal github, window.url
    assert_equal github, location.href

    assert_equal google, location.history.first
    assert_equal github, location.history.last
  end

  test "Location#reload(forceget): Reload the document from the current URL." do
    # forceget is a boolean, which, when it is true, causes the page to always be reloaded from the server.
    # If it is false or not specified, the browser may reload the page from its cache
  end

  test "Location#replace(url): Replace the current document with the one at the provided URL" do
    github = 'http://github.com:80'
    location.replace(github)

    assert_equal github, window.url
    assert_equal github, location.href

    assert_equal google, location.history.first
    assert_equal google, location.history.last
  end

  test "Location#toString: Returns the string representation of the Location object's URL" do
    assert_equal google, location.toString
  end
  
  test "modifying the url's hash (fragment) loads the resulting url to the window" do
    location.hash = '#foo'
    assert_equal 'foo', URI.parse(window.url).fragment
  end
  
  test "modifying the url's host loads the resulting url to the window" do
    location.host = 'github.com:3030'
    assert_equal 'github.com', URI.parse(window.url).host
    assert_equal 3030, URI.parse(window.url).port
  end
  
  test "modifying the url's hostname loads the resulting url to the window" do
    location.hostname = 'github.com'
    assert_equal 'github.com', URI.parse(window.url).host
  end
  
  test "modifying the url's href loads the resulting url to the window" do
    url = 'http://github.com:8080/home?foo=bar#baz'
    location.href = url
    assert_equal url, window.url
  end
  
  test "modifying the url's pathname loads the resulting url to the window" do
    location.pathname = 'home'
    assert_equal '/home', URI.parse(window.url).path
  end

  test "modifying the url's port loads the resulting url to the window" do
    location.port = '8080'
    assert_equal 8080, URI.parse(window.url).port
  end

  test "modifying the url's protocol loads the resulting url to the window" do
    location.protocol = 'https'
    assert_equal 'https', URI.parse(window.url).scheme
  end
end

