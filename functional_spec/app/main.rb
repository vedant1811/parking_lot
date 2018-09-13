$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'controller'

# load the program
include Controller

# read from file or STDIN
while line = gets
  break if line.chomp.empty?
  words = line.split

  # use meta programming to convert string into Controller method calls (with arguments)
  public_send *words

  # TODO: handle incorrect commands
end
