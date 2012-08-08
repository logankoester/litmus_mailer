# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "litmus_mailer"
  gem.homepage = "http://github.com/logankoester/litmus_mailer"
  gem.license = "MIT"
  gem.summary = %Q{Litmus Mailer adds an ActionMailer observer to update your Litmus tests each time an email is delivered from development.}
  gem.description = gem.summary
  gem.email = "logan@logankoester.com"
  gem.authors = ["Logan Koester"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'yard'
YARD::Rake::YardocTask.new
