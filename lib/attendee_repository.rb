require 'csv'
require './lib/attendee'
require './lib/queue'

class AttendeeRepository
  def self.load_csv(filename='./lib/data/event_attendees.csv', klass)
    rows = CSV.open(filename, headers: true, header_converters: :symbol)
    attendee_collection = rows.map {|row| klass.new(row)}
    new(attendee_collection)
  end

  attr_reader :attendee_collection
  def initialize(attendee_collection)
    @attendee_collection = attendee_collection
  end

  # what should this return
  # creates a new array with attendee objects that match criteria
  # create a new queue object if one doesn't exists
  # add each attendee object to TheQueue.current (array)
  # we want EventReporter to have access to an instance of
  # TheQueue that has the proper entries loaded.

  def find(attribute, value)
    attendee_collection.select { |object| object.send(attribute) == value }
    # @queue ||= TheQueue.new
    # queue_entry.each do |i|
    #   @queue << i
    # end
    # return @queue
  end
end
