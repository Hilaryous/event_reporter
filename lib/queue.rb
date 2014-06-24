class TheQueue
  attr_reader :current
  def initialize
    @current = []
  end

  def << (attendees)
    @current << attendees
  end

  def count_data
    @current.count
  end

  def clear_data
    @current.clear
  end

  def print_data_table
    "Hi"
  end

  def print_by
    "Hello"
  end

  def save_to(filename,text="Hi")
    Dir.mkdir("output") unless Dir.exists?("output")

    filename = "output/#{filename}.csv"

    File.open(filename, 'w'){|f| f.write(text)}
  end
end
