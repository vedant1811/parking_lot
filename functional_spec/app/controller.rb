$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'parking_lot'
require 'models/car'
require 'models/parking_slot'

##
# Each of the methods in the Controller calls methods in /app and prints the result
module Controller
  # read from file or STDIN
  def self.included(base)
    while line = gets
      break if line.chomp.empty?
      words = line.split

      # use meta programming to convert string into method calls with arguments
      public_send *words
    end
  end

  def create_parking_lot(size)
    @parking_lot = ParkingLot.new size.to_i

    puts "Created a parking lot with #{size} slots"
  end

  def park(number, colour)
    slot = @parking_lot.park number, colour

    if slot
      puts "Allocated slot number: #{slot}"
    else
      puts "Sorry, parking lot is full"
    end
  end

  def leave(slot)
    if @parking_lot.leave slot
      puts "Slot number #{slot} is free"
    else
      puts "Slot number #{slot} was empty!"
    end
  end

  def status
    # TODO: do
  end

  def registration_numbers_for_cars_with_colour(colour)
    numbers = Car.registration_numbers_for_cars_with_colour colour
    puts numbers.join ', '
  end

  def slot_numbers_for_cars_with_colour(colour)
    numbers = ParkingSlot.slot_numbers_for_cars_with_colour colour
    puts numbers.join ', '
  end

  def slot_number_for_registration_number(number)
    slot = ParkingSlot.slot_number_for_registration_number number

    if slot
      puts slot
    else
      puts "Not found"
    end
  end
end

# run the program
include Controller
