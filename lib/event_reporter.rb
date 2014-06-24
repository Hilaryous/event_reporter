require './lib/attendee_repository'

class EventReporter
  attr_reader :queue
  def initialize(repository, queue)
    @repository = repository
    @queue = queue
  end

  def find(attribute, value)
    results = @repository.find(attribute, value)
    results.each { |i| @queue.current << i }
  end

  def count
    @queue.count_data
  end

  def clear
    @queue.clear_data
  end

  def print
    @queue.print_data
  end

  def print_by
    @queue.print_by
  end

  def save_to(filename)
    @queue.save_to(filename)
  end
end
