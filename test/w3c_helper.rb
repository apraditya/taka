$VERBOSE = true
require 'test/unit'

%w(.. ../../lib ../../ext).each do |path|
  $LOAD_PATH.unshift(File.expand_path(path, __FILE__))
end

$LOAD_PATH << ENV['NOKOGIRI_DEV'] if ENV['NOKOGIRI_DEV']
$LOAD_PATH << ENV['JOHNSON_DEV'] if ENV['JOHNSON_DEV']

require 'rubygems'
require 'nokogiri'
require 'taka'
require 'johnson'

require File.expand_path('../known_issues.rb', __FILE__)
require File.expand_path('../dom_test_case.rb', __FILE__)

module DOM
  class TestCase < Test::Unit::TestCase
    BASE = File.expand_path(File.dirname(__FILE__))
    undef :default_test

    # Default this to text/xml for now....
    def content_type
      "text/xml"
    end
    alias :getContentType :content_type

    def equals(one, two)
      one == two
    end

    def assertTrue(msg, test)
      assert test, msg
    end

    def assertFalse(msg, test)
      assert !test, msg
    end

    def assertSame(msg, expected, actual)
      assert_equal expected, actual, msg
    end

    def assertSize(msg, expected, actual)
      assert_equal(expected, actual.length, msg)
    end

    def assertEqualsIgnoreCase(msg, expected, actual)
      expected.each { |string| string.downcase! }
      actual.each   { |string| string.downcase! }
      assert_equal(expected, actual, msg)
    end

    ### WTF.  FIXME
    def assertURIEquals *args
      args = args.compact
      assert_match args[1], args.last
    end

    # https://dvcs.w3.org/hg/html/rev/4d46b00c2a90#l166
    def assertEqualsAutoCase(context, msg, expected, actual)
      if (content_type == "text/html")
        if(context == "attribute")
          assert_equal expected.downcase, actual.downcase, msg
        else
          assert_equal expected.upcase, actual, msg
        end
      else
        assert_equal expected, actual, msg
      end
    end

    def equalsAutoCase(context, expected, actual)
      if (content_type == "text/html")
        if (context == "attribute")
          expected.downcase == actual;
        else
          expected.upcase == actual;
        end
      else
        expected == actual;
      end
    end

    def preload(content_type, doc_uri, will_be_modified)
      if ['text/html', 'application/xhtml+xml'].include?(content_type)
        if doc_uri =~ /^staff/ || doc_uri == 'datatype_normalization'
          raise "Not a compatible test.... #{content_type}, #{doc_uri}"
        end
      end
    end
    
    def load_document(basename, something)
      options   = 1 << 1 | 1 << 2 | 1 << 3 | 1 << 4 | 1 << 5 | 1 << 6
      extension = caller[0].split('/')[-2, 1].first == 'html' ? 'html' : 'xml'
      filename  = File.expand_path("../files/#{basename}.#{extension}", caller[0])
      Taka::DOM.send(extension.upcase, File.open(filename), filename, nil, options)
    end
    
    def factory
      self
    end
    
    def hasFeature(type, *args)
      Taka::Event::TYPES.include?(type)
    end
  end
end

def DOMTestCase(test_case_name, &block)
  klass = caller[0].split('/')[-3, 2] << test_case_name
  klass = klass.map { |token| token.capitalize }.join

  raise "Already defined!" if Object.const_defined?(klass.to_sym)

  test_klass = Class.new(DOM::TestCase, &block)
  Object.const_set(klass.to_sym, test_klass)
end

class EventMonitor
  include Taka::EventListener
  
  def initialize
    @events = {
      Taka::Event::CAPTURING_PHASE => [],
      Taka::Event::AT_TARGET => [],
      Taka::Event::BUBBLING_PHASE => []
    }
  end
  
  def handleEvent(event)
    @events[event.eventPhase] << event
  end
  
  def getBubbledEvents
    @events[Taka::Event::CAPTURING_PHASE] ||= []
  end
  
  def getAtEvents
    @events[Taka::Event::AT_TARGET] ||= []
  end
  
  def getCapturedEvents
    @events[Taka::Event::BUBBLING_PHASE] ||= []
  end
  
  def getAllEvents
    @events.values.flatten.uniq
  end
end

module JQuery
  class FakeWindow
  end

  class FakeNavigator
    def userAgent
      "hello world"
    end

    def js_property? name
      [:userAgent].include? name
    end
  end

  class TestCase < Test::Unit::TestCase
    undef :default_test
  end

  class PoorMansFirebug
    def log *args
      puts args.inspect
    end
    alias_method :debug, :log
    alias_method :info,  :log
    alias_method :warn,  :log
    alias_method :error, :log
  end
end
