require 'database/databaseable'
require 'models/car'
require 'models/parking_slot'
require 'database/closest_findable_array'

class ParkingLot
  include Databaseable

  # @param size: total number of slots
  # @param entries: mapping of entry gate name to location. Location is the index
  # **(not slot_number)** of the slot that is closest to the entry gate
  def initialize(size, entries = nil)
    super()
    @entries = entries
    @slots = ClosestFindableArray.new
    (0...size).each do |i|
      @slots << ParkingSlot.new(i + 1)
    end
  end

  def availale_slots
    @slots.select { |slot| slot.car == nil }
      .size
  end

  def total_slots
    @slots.size
  end

  # @return alloacted slot number (Integer) or nil
  def park(number, colour, entry_name = nil)
    slot = first_empty_slot(entry_name) || return

    car = Car.new(number, colour)
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
  def first_empty_slot(entry_name)
    closest_index = closest_index_from(entry_name)
    @slots.closest_find(closest_index) { |slot| slot.car == nil }
  end

  def closest_index_from(entry_name)
    # default case. Do not raise error
    return 0 unless entry_name || @entries

    raise 'No entries specified in constructor' unless @entries

    @entries.fetch(entry_name) { |key| raise ArgumentError.new("No entry named #{key}."\
      " Possible values: #{@entries.keys}") }
  end
end
