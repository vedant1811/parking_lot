COLUMNS = ['Slot No.', 'Registration No', 'Colour'].freeze
SLOT_NO_WIDTH = 12.freeze
REGISTRATION_NO_WIDTH = 19.freeze

def print_slots(slots)
  # first create data rows (like ['1', 'KA-01-HH-1234', 'White'])
  slots.map { |slot| [slot.slot_number, slot.car&.registration_number, slot.car&.colour] }
    .insert(0, COLUMNS) # prepend the table header
    .each { |row| puts "%-#{SLOT_NO_WIDTH}s%-#{REGISTRATION_NO_WIDTH}s%s" % row } # print each line formatted
end
