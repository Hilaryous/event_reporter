require 'csv'
require 'pry'
# require 'queue'

class AttendeeRepository
  def self.load(filename, klass)
    rows = CSV.open(filename, headers: true, header_converters: :symbol)
    objects = rows.map {|row|
      klass.new(row)
    }
    # objects here is an array with each element being an Attendee object which is
    # a hash with headers and values, the processing to assign Attendee with each
    # attribute is done in the Attendee class, the entire row (entry) is passed to
    # Attendee.new()
    new(objects) # creates a new instance of this class
  end

  attr_reader :objects
  def initialize(objects)
    @objects = objects
  end

  # def find(attribute, value)
  #   results = objects.select { |object| object.send(attribute) == value }
  #   Queue.new(results)
  # end
end

