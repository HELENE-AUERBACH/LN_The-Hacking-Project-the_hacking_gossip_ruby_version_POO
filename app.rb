# lignes très pratiques qui appellent les gems du Gemfile. Cela évite juste les "require" partout
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'router'

Router.new.perform

require'pry'
binding.pry
