require 'csv'
require './lib/attendee'
require './lib/queue'

class AttendeeRepository
  def self.load(filename='data/event_attendees.csv', klass)
    rows = CSV.open(filename, headers: true, header_converters: :symbol)
    attendee_collection = rows.map {|row| klass.new(row)}
    new(attendee_collection)
  end

  attr_reader :attendee_collection
  def initialize(attendee_collection)
    @attendee_collection = attendee_collection
  end

  def find(attribute, value)
    attendee_collection.select { |object| object.send(attribute) == value }
    # @queue ||= TheQueue.new
    # queue_entry.each do |i|
    #   @queue << i
    # end
    # return @queue
  end
end
