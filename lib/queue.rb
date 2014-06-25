require 'csv'
require 'pry'

class TheQueue
  attr_reader :current
  def initialize
    @current = []
  end

  def << (attendees)
    @current << attendees
  end

  def count_data
    return @current.count
  end

  def clear_data
    @current.clear
  end

  ["LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "PHONE"]

  def print_data_table(data=@current)
    puts "LAST NAME".ljust(15) +
    "FIRST NAME".ljust(15) +
    "EMAIL".ljust(40) +
    "ZIPCODE".ljust(15) +
    "CITY".ljust(20) +
    "STATE".ljust(15) +
    "ADDRESS".ljust(25) +
    "PHONE".ljust(15)

    data.each do |attendee|
      puts attendee.last_name.ljust(15) +
      attendee.first_name.ljust(15) +
      attendee.email_address.ljust(40) +
      attendee.zipcode.ljust(15) +
      attendee.city.ljust(20) +
      attendee.state.ljust(15) +
      attendee.street.ljust(25) +
      attendee.homephone.ljust(15)
    end
  end

  def print_by(attribute)
    print_data_table(current.sort_by { |i| i.send(attribute) })
  end

  def save_to(filename)
    Dir.mkdir("output") unless Dir.exists?("output")

    file_name = "output/#{filename}.csv"

    CSV.open(file_name, 'wb') do |csv|
      csv << ["id", "RegDate", "last_name", "first_name", "email", "phone_number", "address", "city", "state", "zipode", ]
      @current[1..-1].each do |attendee|
        csv << attendee.data.split
      end
    end
    return "Your file has been saved to #{file_name}"
  end
end
