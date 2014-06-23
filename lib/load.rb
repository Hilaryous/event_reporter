require 'csv'

class AttendeeLoader
  attr_reader :filename
  def initialize(filename)
    @filename = filename
  end

  def load(filename='event_attendees.csv')
    CSV.open(filename, headers: true, header_converters: :symbol)
  end
end
