# -*- ruby -*-

require 'rubygems'
require 'rake'
require 'hoe'

LIB_DIR = File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
$LOAD_PATH << LIB_DIR
require 'taka'

Hoe.spec('taka') do
  developer('Aaron Patterson', 'aaronp@rubyforge.org')
  developer('Mike Dalessio', 'mike.dalessio@gmail.com')
  self.readme_file   = 'README.rdoc'
  self.history_file  = 'CHANGELOG.rdoc'
  self.extra_rdoc_files  = FileList['*.rdoc']
  self.extra_deps    = [['nokogiri', '>= 1.4.1']]
end

file 'vendor/jquery/jquery/dist/jquery.js' do
  Dir.chdir('vendor/jquery/jquery') do
    sh "make"
  end
end

namespace :test do
  desc "run jquery tests"
  task :jquery => 'vendor/jquery/jquery/dist/jquery.js' do
    require 'test/jquery/test_jquery'
  end

  desc "run dom tests"
  task(:dom) { run_dom_tests }

  namespace :dom do
    desc "run dom/level1 tests"
    task(:level1) { run_dom_tests('level1') }

    desc "run dom/level2 tests"
    task(:level2) { run_dom_tests('level2') }

    namespace :level1 do
      desc "run dom/level1/core tests"
      task(:core) { run_dom_tests('level1', 'core') }

      desc "run dom/level1/html tests"
      task(:html) { run_dom_tests('level1', 'html') }
    end

    namespace :level2 do
      desc "run dom/level2/core tests"
      task(:core) { run_dom_tests('level2', 'core') }

      desc "run dom/level2/events tests"
      task(:events) { run_dom_tests('level2', 'events') }

      desc "run dom/level2/html tests"
      task(:html) { run_dom_tests('level2', 'html') }
    end
  end

  def run_dom_tests(level = nil, component = nil)
    path = ['test/w3c-dom'] + [level, component].compact
    Dir.glob("#{path.join('/')}/**/test_*.rb").each do|file|
      require file
    end
  end
end

# vim: syntax=Ruby
