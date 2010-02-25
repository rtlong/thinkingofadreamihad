require 'rubygems'
require 'haml'
require 'sass'
require 'hamburglr'
include Hamburglr::Tumblr

STDOUT.sync = true

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
      sass_engine = Sass::Engine.new(template)
      print "Rendering... "
      output = sass_engine.render
      print "Saving... "
      File.open(File.join('..',"#{name}.css"), 'w') {|f| f.write output }
    end
    print "\n"
  end
end
puts "\nDone!"

