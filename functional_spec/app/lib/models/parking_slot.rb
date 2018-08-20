require 'database/databaseable'

class ParkingSlot
  include Databaseable

  attr_reader :slot_number
  attr_accessor :car

  def self.slot_numbers_for_cars_with_colour(colour)

  end

  def self.slot_number_for_registration_number(number)

  end

  def initialize(slot_number)
    @slot_number = slot_number
  end
end
