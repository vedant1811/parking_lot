$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'parking_lot'
require 'models/car'
require 'models/parking_slot'

module Controller
  # read from file or STDIN
  def self.included(base)
    while line = gets
      break if line.chomp.empty?
      puts line
      words = line.split
      public_send *words
    end
  end

  def create_parking_lot(size)
    @parking_lot = ParkingLot.new size.to_i
  end

  def park(number, colour)
    @parking_lot.park number, colour
  end

  def leave(slot)
    @parking_lot.leave slot
  end

  def status
    # TODO: do
  end

  def registration_numbers_for_cars_with_colour(colour)
    Car.registration_numbers_for_cars_with_colour colour
  end

  def slot_numbers_for_cars_with_colour(colour)
    ParkingSlot.slot_numbers_for_cars_with_colour(colour)
  end

  def slot_number_for_registration_number(number)
    ParkingSlot.slot_number_for_registration_number(number)
  end
end

# run the program
include Controller
