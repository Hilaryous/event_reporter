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
    unless @current.empty?
      puts "LAST NAME".ljust(15) +
      "FIRST NAME".ljust(10) +
      "EMAIL".ljust(45) +
      "ZIPCODE".ljust(10) +
      "CITY".ljust(20) +
      "STATE".ljust(15) +
      "ADDRESS".ljust(45) +
      "PHONE".ljust(15)

      data.each do |attendee|
        puts attendee.last_name.to_s.ljust(15) +
        attendee.first_name.to_s.ljust(10) +
        attendee.email_address.to_s.ljust(45) +
        attendee.zipcode.to_s.ljust(10) +
        attendee.city.to_s.ljust(20) +
        attendee.state.to_s.ljust(15) +
        attendee.street.to_s.ljust(45) +
        attendee.homephone.to_s.ljust(15)
      end
    end
  end

  def print_by(attribute)
    print_data_table(current.sort_by { |i| i.send(attribute) })
  end

  def save_to(filename, data=@current)
    Dir.mkdir("output") unless Dir.exists?("output")

    file_name = "output/#{filename}"

    if filename.include? 'csv'
      CSV.open(file_name, 'wb') do |csv|
        csv << ["id", "RegDate", "last_name", "first_name", "email", "phone_number", "address", "city", "state", "zipode", ]
        if data
          data.each {|attendee| csv << attendee.data}
        end
      end
    elsif filename.include? 'txt'
      File.open(file_name, 'w') do |file|
        file.puts "LAST NAME".ljust(15) +
        "FIRST NAME".ljust(10) +
        "EMAIL".ljust(45) +
        "ZIPCODE".ljust(10) +
        "CITY".ljust(20) +
        "STATE".ljust(15) +
        "ADDRESS".ljust(45) +
        "PHONE".ljust(15)

        data.each do |attendee|
          file.puts attendee.last_name.to_s.ljust(15) +
          attendee.first_name.to_s.ljust(10) +
          attendee.email_address.to_s.ljust(45) +
          attendee.zipcode.to_s.ljust(10) +
          attendee.city.to_s.ljust(20) +
          attendee.state.to_s.ljust(15) +
          attendee.street.to_s.ljust(45) +
          attendee.homephone.to_s.ljust(15)
        end
      end
    end
    puts "Your file has been saved to #{file_name}"
  end
end
