require 'dispatcher'

RSpec.describe Dispatcher do

  before do
    @dispatcher = Dispatcher.new
    @first = ParkingLot.new 2
    @second = ParkingLot.new 1
  end

  context 'fill first dispatch rule' do
    before do
      @dispatcher.dispatch_rule = 'fill_first'
    end

    it 'fills in first, then again first' do
      expect(@dispatcher.which_parking_lot).to eq @first
      expect(@dispatcher.which_parking_lot).to eq @first
    end
  end

  context 'even distribution dispatch rule' do
    before do
      @dispatcher.dispatch_rule = 'even_distribution'
    end

    it 'fills in first, then second' do
      expect(@dispatcher.which_parking_lot).to eq @first
      expect(@dispatcher.which_parking_lot).to eq @second
    end
  end
end
