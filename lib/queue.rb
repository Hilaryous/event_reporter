require 'csv'

class TheQueue
  attr_reader :current
  def initialize#(find_results)
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

  def save_to(filename)
    Dir.mkdir("output") unless Dir.exists?("output")

    file_name = "output/#{filename}.csv"

    CSV.open(file_name, 'wb') do |csv|
      csv << ["id", "RegDate", "last_name", "first_name", "email", "zipode", "city", "state", "address", "phone_number"]
      csv << @current.each {|attendee| attendee}
    end
    puts "Your file has been saved to #{file_name}"
  end
end
