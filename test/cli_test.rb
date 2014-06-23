gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'
# require 'pry'

class CLITest < Minitest::Test

  attr_reader :cli
  def setup
    @cli ||= CLI.new
  end

  def process_and_execute(input)
    parts = cli.process_input(input)
    cli.assign_instructions(parts)
    cli.execute_instructions
  end

  def process_and_assign(input)
    parts = cli.process_input(input)
    cli.assign_instructions(parts)
  end

  def test_it_exist
    assert cli
  end

  def test_it_has_attributes
    assert cli.command
    assert cli.queue_command
    assert cli.parameters
  end

  def test_it_processes_input
    input  = 'find zipcode 80203'
    result = cli.process_input(input)

    assert_equal ['find', 'zipcode', '80203'], result
  end

  def test_it_assigns_instructions
    input  = 'load filename'
    result = process_and_assign(input)

    assert_equal 'load', cli.command
    assert_equal 'filename', cli.parameters
  end

  def test_it_assigns_queue_instructions
    input  = 'queue count'
    result = process_and_assign(input)

    assert_equal 'count', cli.queue_command
  end

  def test_it_assigns_help_instructions
    input  = 'help queue count'
    result = process_and_assign(input)

    assert_equal 'queue count', cli.parameters
  end

  def test_it_exectues_instructions
    input  = 'help'
    result = process_and_execute(input)

    assert_equal 'help', result
  end

  def test_it_executes_queue_commands
    input  = 'queue count'
    result = process_and_execute(input)

    assert_equal 'counting queue', result
  end

  def test_it_executes_help_commands
    input  = 'help queue count'
    result = process_and_execute(input)

    assert_equal 'use it this way', result
  end

  def test_assign_queue_command_assigns_parameters
    input = 'queue print by parameters'
    result = process_and_assign(input)

    assert_equal 'queue', cli.command
    assert_equal 'print by', cli.queue_command
    assert_equal 'parameters', cli.parameters
  end

  def test_it_loads_data
    input = 'load ./test/fixtures/event_attendees.csv'
    result = process_and_execute(input)

    assert cli.event_reporter
  end

  def test_it_executes_the_find_command
    input = 'load ./test/fixtures/event_attendees.csv'
    result = process_and_execute(input)

    input = 'find last_name smith'
    result = process_and_execute(input)
    puts "result: #{result}"
    assert_equal 'attribute last_name', result
  end

end
