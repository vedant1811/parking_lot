require 'parking_lot'

RSpec.describe ParkingLot do
  before do
    @parking_lot = ParkingLot.new 3
  end

  describe 'empty parking lot' do
    it 'should park car' do
      expect(@parking_lot.park('number 1', 'colour')).to eq 1
      expect(Car.all.size).to eq 1
    end

    it 'should leave car' do
      @parking_lot.park('number 1', 'colour')
      expect(@parking_lot.leave 1).to eq true
      expect(Car.all.size).to eq 0
    end

    it 'should not leave car' do
      expect(@parking_lot.leave 1).to eq false
    end
  end

  describe 'full parking lot with 5 cars,' do
    before do
      5.times do |i|
        @parking_lot.park("numer #{i}", 'colour')
      end
    end

    it 'should not park another car' do
      expect(@parking_lot.park('number 4', 'colour')).to eq nil
    end

    it 'then 2 cars leave, should park in closest slot' do
      @parking_lot.leave 2
      @parking_lot.leave 4
      expect(@parking_lot.park('number 4', 'colour')).to eq 2
    end
  end
end
