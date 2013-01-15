require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run unit tests"
task :default => :test

desc "Build photile for testing"
task :build do
  system 'gem build photile.gemspec && gem install ./*.gem --pre && rm *.gem'
end

desc "Deploy gem to Rubygems repo"
task :deploy do
  version = `git describe`.chomp
  system "gem build photile.gemspec && gem push photile-#{version}.gem && rm *.gem"
end

desc "Build docs"
task :docs do
  `rdoc`
end

desc "Uninstalls the gem"
task :uninstall do
  system 'gem uninstall photile'
end

desc "Cleans generated files"
task :clean do
  `rm tmp/test*.jpeg 2>&1`
end
