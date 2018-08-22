require 'database/databaseable'

class ParkingSlot
  include Databaseable

  attr_reader :slot_number
  attr_accessor :car

  def self.slot_numbers_for_cars_with_colour(colour)
    all.select { |slot| slot.car&.colour == colour }
        .map(&:slot_number)
  end

  def self.slot_number_for_registration_number(number)
    all.find { |slot| slot.car&.registration_number == number }
        &.slot_number
  end

  def self.filled_slots
    
  end

  def initialize(slot_number)
    @slot_number = slot_number
  end
end
