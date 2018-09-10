require 'models/parking_slot'

RSpec.describe ParkingSlot do
  it 'should save slot' do
    expect { ParkingSlot.new 1 }.to change { ParkingSlot.all.size }.by 1
  end

  it 'should delete slot' do
    slot = ParkingSlot.new 1
    expect { slot.delete! }.to change { ParkingSlot.all.size }.by -1
  end

  context 'with cars' do
    before do
      @colour = 'red'
      @count = 5
      @count.times do |i|
        slot = ParkingSlot.new i
        slot.car = Car.new "regn:#{i}", @colour if i.even?
      end
    end

    it 'should list slot numbers for cars with colour' do
      expect(ParkingSlot.slot_numbers_for_cars_with_colour(@colour).size).to eq 3
    end

    it 'should return slot number for car' do
      expect(ParkingSlot.slot_number_for_registration_number "regn:2").to eq 2
    end

    it 'should return nil slot number for no car' do
      expect(ParkingSlot.slot_number_for_registration_number "regn:3").to eq nil
    end

    it 'should return filled slots' do
      expect(ParkingSlot.filled_slots.count).to eq 3
    end
  end
end
