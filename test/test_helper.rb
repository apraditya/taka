%w(.. ../../lib).each do |path|
  $LOAD_PATH.unshift(File.expand_path(path, __FILE__))
end

require 'test/unit'
require 'rubygems'
require 'nokogiri'
require 'taka'
require 'test_declarative'

# so we can use procs as event listeners
Proc.send(:alias_method, :handleEvent, :call)