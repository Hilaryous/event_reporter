require 'csv'
require 'pry'
require './lib/attendee'
# require 'queue'

class AttendeeRepository
  def self.load(filename, klass)
    rows = CSV.open(filename, headers: true, header_converters: :symbol)
    objects = rows.map {|row|
      klass.new(row)
    }
    new(objects)
  end

  attr_reader :objects
  def initialize(objects)
    @objects = objects
  end

  # def find(attribute, value)
  #   results = objects.select { |object| object.send(attribute) == value }
  #   Queue.new(results) # array of Attendee objects that match
  # end
end
