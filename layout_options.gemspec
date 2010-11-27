# -*- encoding: utf-8 -*-
require File.expand_path("../lib/layout_options/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "layout_options"
  s.version     = LayoutOptions::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Dane Harrigan']
  s.email       = ['dane.harrigan@gmail.com']
  s.homepage    = "http://rubygems.org/gems/layout_options"
  s.summary     = 'A single place for setting all of your layouts in a controller'
  s.description = 'The layout_options gem provides a single place to set all of your ' <<
  'layouts in your controller. This gem really shines when multiple layouts are needed ' <<
  'when using inherited_resources.'

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "layout_options"

  s.add_dependency 'actionpack','~> 3.0.1'

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"
  s.add_development_dependency "rspec", "~> 2.1.0"
  s.add_development_dependency "rspec-rails", "~> 2.1.0"
  s.add_development_dependency 'ruby-debug19', '~> 0.11.6'

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
