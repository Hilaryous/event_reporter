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
              :zipcode,
              :data

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
    @data = ''
  end

  def clean_first_name(first_name)
    unless first_name.nil?
      first_name.capitalize
    end
  end

  def clean_last_name(last_name)
    unless last_name.nil?
      last_name.capitalize
    end
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_homephone(phone_number)
    unless phone_number.nil?
      phone_number.delete("-(). ")
    end
  end

  def clean_street(street)
    unless street.nil?
      parts = street.to_s.split(' ')

      parts.map{ |part| part.capitalize}.join(' ')
    end
  end

  def clean_city(city)
    unless city.nil?
      parts = city.to_s.split(' ')
      parts.map { |part| part.capitalize }.join("")
    end
  end

  def clean_state(state)
    unless city.nil?
      state.upcase
    end
  end

  def data
    @data = ["#{id}","#{regdate}","#{last_name}","#{first_name}","#{email_address}","#{homephone}","#{street}","#{city}","#{state}","#{zipcode}"]
  end
end
