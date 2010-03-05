require 'rubygems'
require 'haml'
require 'sass'
require 'hamburglr'
include Hamburglr::Tumblr

module Sass::Script::Functions
  def hostname(type)
    case type.value
    when "dev"
      Sass::Script::String.new(DEV_HOST)
    when "static"
      Sass::Script::String.new(STATIC_HOST)
    end
  end
end

STDOUT.sync = true

SAMPLE_DATA = false
DEV_HOST = 'http://home.rtlong.com/assets/thinkingofadreamihad'
STATIC_HOST = 'http://assets.rtlong.com/thinkingofadreamihad'

puts "\nLoading templates..."
haml_files = Dir['*html.haml']
haml_files.each do |filename|
  name = File.basename(filename, ".haml")
  print "[#{filename}]  "
  template = File.read(filename)
  print 'Loading... '
  haml_engine = Haml::Engine.new(template)
  print 'Rendering... '
  output = haml_engine.render
  print 'Saving... '
  File.open(name, 'w') {|f| f.write output }
  
  print "\n"
end

Dir.chdir "css/sass" do
  puts "\nLoading styelsheets..."
  sass_files = Dir['*.sass']
  sass_files.each do |filename|
    name = File.basename(filename, ".sass")
    print "[#{filename}]  "
    if /^_/.match(name) then
      print "Skipped!"
    else
      print "Loading... "
      template = File.read(filename)
      sass_engine = Sass::Engine.new(template, {:style => :nested, :cache => false, :property_syntax => :old})
      print "Rendering... "
      output = sass_engine.render
      print "Saving... "
      File.open(File.join('..',"#{name}.css"), 'w') {|f| f.write output }
    end
    print "\n"
  end
end
puts "\nDone!"

