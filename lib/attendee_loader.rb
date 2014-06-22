require 'csv'
require 'pry'

class AttendeeLoader
  attr_reader :rows
  def initialize
    @rows = []
  end

  def load(filename='./test/fixtures/event_attendees.csv')
    CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def assign_rows(data)
    data.each do |row|
      @rows << row
    end
  end
end

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
