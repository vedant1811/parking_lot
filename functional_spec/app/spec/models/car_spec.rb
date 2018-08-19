require 'models/car'

RSpec.describe Car do
  before do
    @car = Car.new 'number', 'colour'
  end

  it 'should save car' do
    expect { @car.save! }.to change { Car.all.size }.by 1
  end

  it 'should delete car' do
    @car.save!
    expect { @car.delete! }.to change { Car.all.size }.by -1
  end

  it 'should list cars of a colour' do
    cars_count = 3
    colour = 'red'
    cars_count.times do |i|
      Car.new("num #{i}", colour).save!
    end
    expect(Car.registration_numbers_for_cars_with_colour(colour).size).to eq cars_count
  end
end
