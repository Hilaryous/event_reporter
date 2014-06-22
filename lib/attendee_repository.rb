require 'csv'
require 'pry'

class AttendeeRepository
  def load(filename='./test/fixtures/event_attendees.csv')
    CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def assign_rows(data)
    data.each do |row|
      @rows << row
    end
  end
end


just load the data and
#   def assign_attributes(rows)
#     entry.each do |entry|
#       id = entry[:id]
#
#     end
#   end
# end
#
# al = AttendeeLoader.new
# data = al.load
# al.rows(data)
