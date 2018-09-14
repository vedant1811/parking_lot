require 'dispatcher'

RSpec.describe Dispatcher do

  before do
    @dispatcher = Dispatcher.new
    @first = ParkingLot.new 2
    @second = ParkingLot.new 1
  end

  context 'fill first dispatch rule' do
    it 'fills in first, then again first' do
      expect(@dispatcher.which_parking_lot).to eq @first
      expect(@dispatcher.which_parking_lot).to eq @first
    end
  end
end
