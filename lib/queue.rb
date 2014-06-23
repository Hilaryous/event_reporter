class TheQueue
  attr_reader :queue
  def initialize#(find_results)
    @queue = []
  end

  def count
    @queue.count
  end

  def << (attendees)
    @queue << attendees
  end
end
