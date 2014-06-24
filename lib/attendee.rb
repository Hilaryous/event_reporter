require 'csv'

class Attendee
  attr_reader :id,
              :regdate,
              :first_name,
              :last_name,
              :email_address,
              :homephone,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(data)
    @id = data[:id]
    @regdate = data[:regdate]
    @first_name = clean_first_name(data[:first_name])
    @last_name = clean_last_name(data[:last_name])
    @email_address = data[:email_address]
    @homephone = clean_homephone(data[:homephone])
    @street = clean_street(data[:street])
    @city = clean_city(data[:city])
    @state = clean_state(data[:state])
    @zipcode = clean_zipcode(data[:zipcode])
  end

  def clean_first_name(first_name)
    first_name.capitalize
  end

  def clean_last_name(last_name)
    last_name.capitalize
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_homephone(phone_number)
    if phone_number.nil? || phone_number.length < 10
      phone_number = "0000000000"
    elsif phone_number.length == 10
      phone_number = phone_number[0..9]
    elsif phone_number.length == 11
      if phone_number[0] == "1"
         phone_number = phone_number[1..10]
      elsif phone_number[0] != "1"
         phone_number = "0000000000"
      end
    end
  end

  def clean_street(street)
    parts = street.to_s.split(' ')

    parts[1..-1].each{ |part| part.capitalize}
    parts[0..-1].join(' ')
  end

  def clean_city(city)
    city.capitalize
  end

  def clean_state(state)
    state.upcase
  end
end
