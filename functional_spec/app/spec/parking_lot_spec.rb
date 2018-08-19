require 'parking_lot'

RSpec.describe ParkingLot do
  before do
    @parking_lot = ParkingLot.new 3
    @parking_lot.park('number 1', 'colour')
  end

  context '#park' do
    it 'should park car' do
      expect(@parking_lot.park('number 2', 'colour')).to eq 2
    end

    it 'should not park 4 cars' do
      @parking_lot.park('number 2', 'colour')
      @parking_lot.park('number 3', 'colour')
      expect(@parking_lot.park('number 4', 'colour')).to eq nil
    end

    it 'should park in closest slot' do
    end
  end

  context '#leave' do
    it 'should leave car' do
      expect(@parking_lot.leave(1)).to eq true
    end
  end
end
