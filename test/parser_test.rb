require './test/test_helper'
class ParserTest < Minitest::Test

  attr_reader :parser
  def setup
    @parser ||= Parser.new
  end

  def process_and_assign(input)
    parts = parser.process_input(input)
    parser.assign_commands(parts)
  end

  def test_it_processes_input
    input  = 'find zipcode 80203'
    result = parser.process_input(input)

    assert_equal ['find', 'zipcode', '80203'], result
  end

  def test_it_assigns_commands
    input  = 'load fixtures/event_attendees.csv'
    result = process_and_assign(input)

    assert_equal 'load', parser.command
    assert_equal './test/fixtures/event_attendees.csv', parser.parameters
  end

  def test_it_assigns_queue_commands
    input  = 'queue count'
    result = process_and_assign(input)

    assert_equal 'count', parser.queue_command
  end

  def test_it_assigns_help_commands
    input  = 'help queue count'
    result = process_and_assign(input)

    assert_equal 'queue count', parser.parameters
  end

  def test_assign_queue_command_assigns_parameters
    input  = 'queue print by parameters'
    result = process_and_assign(input)

    assert_equal 'queue', parser.command
    assert_equal 'print by', parser.queue_command
    assert_equal 'parameters', parser.parameters
  end
end
