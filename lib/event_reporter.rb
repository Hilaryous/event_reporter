require './lib/attendee_repository'

class EventReporter
  attr_reader :queue
  def initialize(repository=nil, queue)
    @repository = repository
    @queue = queue
  end

  def find(attribute, value)
    if @repository
      results = @repository.find(attribute, value)
      results.each { |i| @queue.current << i }
    else
      puts 'no repo loaded'
    end
  end

  def count_data
    @queue.count_data
  end

  def clear
    @queue.clear_data
  end

  def print_data_table
    @queue.print_data_table
  end

  def print_by
    @queue.print_by
  end

  def save_to(filename)
    @queue.save_to(filename)
  end
end
