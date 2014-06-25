require './test/test_helper'
class AttendeeTest < Minitest::Test
  def entry
      {
        id: 1,
        regdate:       'July 1, 2013',
        first_name:    'JOn',
        last_name:     'SnoW',
        email_address: 'hello@hello.com',
        homephone:     "1123456789",
        street:        '109 street',
        city:          'atlanta',
        state:         'ga',
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
    assert_equal '1123456789', attendee.homephone
    assert_equal '109 street', attendee.street
    assert_equal 'Atlanta', attendee.city
    assert_equal 'GA', attendee.state
    assert_equal '12345', attendee.zipcode
  end
end
