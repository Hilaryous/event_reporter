require 'csv'
require 'pry'
require './lib/attendee'
# require 'queue'

class AttendeeRepository
  def self.load(filename, klass)
    rows = CSV.open(filename, headers: true, header_converters: :symbol)
    attendee_collection = rows.map {|row|
      klass.new(row)
    }
    new(attendee_collection)
  end

  attr_reader :attendee_collection
  def initialize(attendee_collection)
    @attendee_collection = attendee_collection
  end

  # def find(attribute, value)
  #   results = objects.select { |object| object.send(attribute) == value }
  #   Queue.new(results) # array of Attendee objects that match
  # end
end
