$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'controller'

# load the program
include Controller

# read from file or STDIN
while line = gets
  break if line.chomp.empty?
  words = line.split

  begin
    # use meta programming to convert string into Controller method calls (with arguments)
    public_send *words
  rescue NoMethodError => e
    puts "no command such as: #{e.name}"
    help
    puts "Or enter a blank line to exit"
  end
end
