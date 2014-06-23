require './lib/attendee_repository'

class EventReporter
  attr_reader :queue
  def initialize(repository=AttendeeRepository.load(Attendee))
    @repository = repository
    @queue = nil
  end

  def find(attribute, value)
    @queue = @repository.find(attribute, value)
  end

  def count
    @queue.count
  end

  def clear
    @queue.clear
  end

  def print
    @queue.print_data
  end

  def print_by
    @queue.print_by
  end

  def save_to
    @queue.save_to
  end
end
