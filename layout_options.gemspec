# -*- encoding: utf-8 -*-
require File.expand_path("../lib/layout_options/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "layout_options"
  s.version     = LayoutOptions::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Dane Harrigan']
  s.email       = ['dane.harrigan@gmail.com']
  s.homepage    = "http://github.com/daneharrigan/layout_options"
  s.summary     = 'A single place for setting all of your layouts in a controller'
  s.description = 'Need an easy way to manage multiple layouts? Done.'
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "layout_options"

  s.add_dependency 'rails', '>= 3.0.1'

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
