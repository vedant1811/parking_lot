class Car < BaseModel
  attr_reader :registration_number, :colour

  def self.registration_numbers_for_cars_with_colour(colour)

  end

  def initialize(registration_number, colour)
    @registration_number = registration_number
    @colour = colour

    @@models ||= []
    @@models << self
  end
end
