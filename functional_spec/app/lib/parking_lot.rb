require 'models/car'
require 'models/parking_slot'

class ParkingLot
  # @param size: total number of slots
  # @param entries: mapping of entry gate name to location. Location is the index of
  # the slot that is closest to the entry gate
  def initialize(size, entries = DEFAULT_ENTRIES)
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

  DEFAULT_ENTRIES = {
    one: 0
  }
end
