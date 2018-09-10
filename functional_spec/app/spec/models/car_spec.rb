require 'models/car'

RSpec.describe Car do
  it 'should save car' do
    expect { Car.new 'number', 'colour' }.to change { Car.all.size }.by 1
  end

  it 'should delete car' do
    car = Car.new 'number', 'colour'
    expect { car.delete! }.to change { Car.all.size }.by -1
  end

  it 'should list cars of a colour' do
    cars_count = 3
    colour = 'red'
    cars_count.times do |i|
      Car.new("num #{i}", colour)
    end
    expect(Car.registration_numbers_for_cars_with_colour(colour).size).to eq cars_count
  end
end
