require 'models/parking_lot'

class Dispatcher
  attr_accessor :dispatch_rule

  def which_parking_lot
    case dispatch_rule
    when 'fill_first'
      ParkingLot.all.find { |lot| lot.availale_slots > 0 }
    when 'even_distribution'
      puts ParkingLot.all.map { |lot| "#{lot.availale_slots.to_f}, #{lot.total_slots.to_f}" }
      # puts ParkingLot.all.map { |lot| [lot, lot.availale_slots.to_f / lot.total_slots.to_f ] }
      puts ParkingLot.all.map { |lot| [lot, lot.availale_slots.to_f / lot.total_slots.to_f ] }

      ParkingLot.all.map { |lot| [lot, lot.availale_slots / lot.total_slots.to_f ] }
        .max { |a, b| a.last <=> b.last }
        .first
    end
  end
end
