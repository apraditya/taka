Dir["#{File.expand_path('..', __FILE__)}/test_*.rb"].each do |file|
  require file
end