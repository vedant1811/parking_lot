require 'parking_lot'
require 'models/car'
require 'models/parking_slot'
require 'status_presenter'

##
# Each of the methods in the Controller calls methods in /app and prints the result
module Controller
  def create_parking_lot(size)
    @parking_lot = ParkingLot.new size.to_i

    puts "Created a parking lot with #{size} slots"
  end

  def park(number, colour)
    slot = @parking_lot.park number, colour

    if slot
      puts "Allocated slot number: #{slot}"
    else
      puts "Sorry, parking lot is full"
    end
  end

  def leave(slot)
    if @parking_lot.leave slot
      puts "Slot number #{slot} is free"
    else
      puts "Slot number #{slot} was empty!"
    end
  end

  def status
    slots = ParkingSlot.filled_slots
    print_slots slots
  end

  def registration_numbers_for_cars_with_colour(colour)
    numbers = Car.registration_numbers_for_cars_with_colour colour
    puts numbers.join ', '
  end

  def slot_numbers_for_cars_with_colour(colour)
    numbers = ParkingSlot.slot_numbers_for_cars_with_colour colour
    puts numbers.join ', '
  end

  def slot_number_for_registration_number(number)
    slot = ParkingSlot.slot_number_for_registration_number number

    if slot
      puts slot
    else
      puts "Not found"
    end
  end
end
