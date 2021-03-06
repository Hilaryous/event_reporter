class EventReporter
  attr_reader :queue
  def initialize(repository=nil, queue)
    @repository = repository
    @queue      = queue
  end

  def find(attribute, value)
    if @repository
      @queue  = TheQueue.new
      results = @repository.find(attribute, value)
      results.each { |i| @queue.current << i }
    else
      puts 'no repo loaded'
    end
  end

  def count_data
    @queue.count_data
  end

  def clear_data
    @queue.clear_data
  end

  def print_data_table
    @queue.print_data_table
  end

  def print_by(attribute)
    @queue.print_by(attribute)
  end

  def save_to(filename)
    @queue.save_to(filename)
  end
end
