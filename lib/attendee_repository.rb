require 'csv'
require 'pry'
require './lib/attendee'
require 'pry'

class AttendeeRepository
  def self.load(filename, klass)
    rows = CSV.open(filename='test/fixtures/event_attendees.csv', headers: true, header_converters: :symbol)
    attendee_collection = rows.map {|row|
      klass.new(row)
    }
    new(attendee_collection)
  end

  attr_reader :attendee_collection
  def initialize(attendee_collection)
    @attendee_collection = attendee_collection
  end

  def find(attribute, value)
    queue_entry = attendee_collection.select { |object| object.send(attribute) == value }
    @queue || @queue = TheQueue.new
    queue_entry.each do |i|
      @queue << i
    end
  end
end
