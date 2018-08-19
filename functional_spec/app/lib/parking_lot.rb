require 'models/car'
require 'models/parking_slot'

class ParkingLot
  def initialize(size)
    @slots_remaining = size
  end

  # @return alloacted slot number (Integer) or nil
  def park(number, colour)
    car = Car.new(number, colour)
    all_slots = ParkingSlot.all
    slot = ParkingSlot.new all_slots.size + 1
    slot.car = car
    slot.slot_number
  end

  # @return true if slot had a car, false otherwise
  def leave(slot_number)

  end
end
