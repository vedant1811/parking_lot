$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'controller'

# load the program
include Controller

# read from file or STDIN
while line = gets
  break if line.chomp.empty?
  words = line.split

  # use meta programming to convert string into method calls (with arguments) for Controller
  public_send *words
end
