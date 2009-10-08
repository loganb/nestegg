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
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
  return
end

begin
  require 'spec/rake/spectask'
rescue LoadError
  puts 'To use rspec for testing you must install rspec gem:'
  puts '$ sudo gem install rspec'
  exit
end

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_files = FileList['spec/**/*_spec.rb']
end
