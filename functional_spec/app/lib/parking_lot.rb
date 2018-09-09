require 'models/car'
require 'models/parking_slot'

class ParkingLot
  def initialize(size)
    (0...size).each do |i|
      ParkingSlot.new(i + 1)
        .save!
    end
  end

  # @return alloacted slot number (Integer) or nil
  def park(number, colour)
    slot = first_empty_slot || return

    car = Car.new(number, colour)
    car.save!
    slot.car = car
    slot.slot_number
  end

  # @return true if slot had a car, false otherwise
  def leave(slot_number)
    slot_number = Integer(slot_number)
    slot = ParkingSlot.all[slot_number - 1]
    return false unless slot&.car

    car = slot.car
    slot.car = nil
    car.delete!

    true
  end

private
  def first_empty_slot
    all_slots = ParkingSlot.all
    all_slots.find { |slot| slot.car == nil }
  end
end
