class TheQueue
  attr_reader :current
  def initialize#(find_results)
    @current = []
  end

  def count
    @current.count
  end

  def clear_data
    @current.clear
  end

  def print_data_table

  end

  def << (attendees)
    @current << attendees
  end
end
