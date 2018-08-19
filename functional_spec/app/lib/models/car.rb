
##
# Represents a parked car in the lot. If a car leaves be sure to call #delete!
class Car
  attr_reader :registration_number, :colour

  def self.registration_numbers_for_cars_with_colour(colour)

  end

  def delete!

  end

  def initialize(registration_number, colour)
    @registration_number = registration_number
    @colour = colour

    @@models ||= []
    @@models << self
  end
end
