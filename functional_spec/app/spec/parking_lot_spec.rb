require 'parking_lot'

RSpec.describe ParkingLot do
  describe 'empty parking lot' do
    before do
      @parking_lot = ParkingLot.new 3
    end

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
      @parking_lot = ParkingLot.new 5
      5.times do |i|
        @parking_lot.park("numer #{i}", 'colour')
      end
    end

    it 'should not park another car' do
      expect(@parking_lot.park('number 6', 'colour')).to eq nil
    end

    it 'then 2 cars leave, should park in closest slot' do
      @parking_lot.leave 2
      @parking_lot.leave 4
      expect(@parking_lot.park('number 4', 'colour')).to eq 2
    end
  end

  describe 'parking lot with 2 entires' do
    before do
      entries = {
        'start' => 0,
        'mid' => 9
      }
      @parking_lot = ParkingLot.new(20, entries)
    end

    it 'should park closest to start' do
      expect(@parking_lot.park('car 1', 'red', 'start')).to eq 1
      expect(@parking_lot.park('car 2', 'red', 'start')).to eq 2
    end

    it 'should park closest to mid' do
      expect(@parking_lot.park('car 1', 'red', 'mid')).to eq 10
      expect(@parking_lot.park('car 2', 'red', 'mid')).to eq 9
    end

    it 'should raise exception' do
      expect { @parking_lot.park('car', 'colour', 'non-existant') }.to raise_error ArgumentError
    end
  end
end
