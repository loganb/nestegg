begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "nestegg"
    gemspec.summary = "Nested exceptions for ruby"
    gemspec.description = "Module to add a 'cause' field to exceptions and automatically chains exceptions on re-raise"
    gemspec.email = "logan@datacurrent.com"
    gemspec.homepage = "http://github.com/loganb/nestegg"
    gemspec.authors = ["John D. Hume", "Logan Bowers", "Matt Scilipoti"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
  return
end

begin
  require 'rspec/core/rake_task'
rescue LoadError
  puts 'To use rspec for testing you must install rspec gem:'
  puts '$ sudo gem install rspec'
  exit
end

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ['--options', "spec/spec.opts"]
  t.pattern = 'spec/**/*_spec.rb'
end
