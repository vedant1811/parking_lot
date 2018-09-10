require 'database/databaseable'

##
# Represents a parked car in the lot. If a car leaves be sure to call #delete!
class Car
  include Databaseable

  attr_reader :registration_number, :colour

  def self.registration_numbers_for_cars_with_colour(colour)
    all.select { |car| car.colour == colour }
        .map(&:registration_number)
  end

  def initialize(registration_number, colour)
    super()
    @registration_number = registration_number
    @colour = colour
  end
end
