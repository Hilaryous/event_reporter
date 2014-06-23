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
    @street = data[:street]
    @city = data[:city]
    @state = data[:state]
    @zipcode = clean_zipcode(data[:zipcode])
  end

  # clean all the things
  def clean_first_name(first_name)
    first_name.upcase
  end

  def clean_last_name(first_name)
    last_name.upcase
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_homephone
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
end
