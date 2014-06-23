gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'

class CLITest < Minitest::Test

  attr_reader :cli
  def setup
    @cli ||= CLI.new
  end

  def process_and_execute(input)
    parts = cli.send(:process_input, input)
    cli.send(:assign_instructions, parts)
    cli.send(:execute_instructions)
  end

  def process_and_assign(input)
    parts = cli.send(:process_input, input)
    cli.send(:assign_instructions, parts)
  end

  def test_it_exist
    assert cli
  end

  def test_it_has_attributes
    assert cli.send(:command)
    assert cli.send(:queue_command)
    assert cli.send(:parameters)
  end

  def test_it_processes_input
    input  = 'find zipcode 80203'
    result = cli.send(:process_input, input)

    assert_equal ['find', 'zipcode', '80203'], result
  end

  def test_it_assigns_instructions
    input  = 'load filename'
    result = process_and_assign(input)

    assert_equal 'load', cli.send(:command)
    assert_equal 'filename', cli.send(:parameters)
  end

  def test_it_assigns_queue_instructions
    input  = 'queue count'
    result = process_and_assign(input)

    assert_equal 'count', cli.send(:queue_command)
  end

  def test_it_assigns_help_instructions
    input  = 'help queue count'
    result = process_and_assign(input)

    assert_equal 'queue count', cli.send(:parameters)
  end

  def test_it_exectues_instructions
    input  = 'help'
    result = process_and_execute(input)

    assert_equal 'help', result
  end

  def test_it_executes_queue_commands
    input  = 'queue count'
    result = process_and_execute(input)

    assert_equal 'count', result
  end

  def test_it_executes_help_commands
    input  = 'help queue count'
    result = process_and_execute(input)

    assert_match /Output/, result
  end

  def test_assign_queue_command_assigns_parameters
    input = 'queue print by parameters'
    result = process_and_assign(input)

    assert_equal 'queue', cli.send(:command)
    assert_equal 'print by', cli.send(:queue_command)
    assert_equal 'parameters', cli.send(:parameters)
  end

  def test_it_loads_data
    input = 'load ./test/fixtures/event_attendees.csv'
    result = process_and_execute(input)

    assert cli.send(:event_reporter)
  end

  def test_it_executes_the_find_command
    input = 'load ./test/fixtures/event_attendees.csv'
    result = process_and_execute(input)

    input = 'find last_name smith'
    result = process_and_execute(input)
    puts "result: #{result}"
    assert_equal 'attribute: last_name', result
  end

end
