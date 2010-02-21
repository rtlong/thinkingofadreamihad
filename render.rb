require 'rubygems'
require "haml"
require "hamburglr"

include Hamburglr::Tumblr

template = File.read('thinking_of_a_dream_i_had.tumblr.html.haml')
haml_engine = Haml::Engine.new(template)
output = haml_engine.render
puts output
