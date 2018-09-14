require 'models/parking_lot'

class Dispatcher
  def which_parking_lot
    ParkingLot.all.find { |lot| lot.availale_slots > 0 }
  end
end
