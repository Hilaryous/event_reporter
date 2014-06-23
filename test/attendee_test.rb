gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/attendee'

class AttendeeTest < Minitest::Test
  def entry
      {
        id: 1,
        regdate:       'July 1, 2013',
        first_name:    'Jon',
        last_name:     'Snow',
        email_address: 'hello@hello.com',
        homephone:     "123456789",
        street:        '109 street',
        city:          'atlanta',
        state:         'georgia',
        zipcode:       '12345'
      }
  end

  def test_attributes
    attendee = Attendee.new(entry)
    assert_equal 1, attendee.id
    assert_equal 'July 1, 2013', attendee.regdate
    assert_equal 'Jon', attendee.first_name
    assert_equal 'Snow', attendee.last_name
    assert_equal 'hello@hello.com', attendee.email_address
    assert_equal '123456789', attendee.homephone
    assert_equal '109 street', attendee.street
    assert_equal 'atlanta', attendee.city
    assert_equal 'georgia', attendee.state
    assert_equal '12345', attendee.zipcode
  end
end
