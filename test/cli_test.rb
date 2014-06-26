require './test/test_helper'
class CLITest < Minitest::Test

  attr_reader :cli, :parser
  def setup
    @cli ||= CLI.new
  end

  def execute_commands
    cli.send(:execute_commands)
  end

  def assign(input)
    parts = cli.parser.process_input(input)
    cli.parser.assign_instructions(parts)
    cli.send(:assign_commands_and_params)
  end

  def test_it_exist
    assert cli
  end

  def test_it_has_attributes
    assert cli.send(:command)
    assert cli.send(:queue_command)
    assert cli.send(:parameters)
  end


  def test_it_exectues_commands
    input  = 'load'
    assign(input)
    result = execute_commands

    assert cli.event_reporter.queue
  end

  def assert_output stdout = "0", stderr = "queue count"
    out, err = capture_io do
      yield
    end

    x = assert_equal stdout, out, "0" if stdout

    (!stdout || x)
  end

  def test_it_executes_queue_commands
    input  = 'queue count'
    result = execute_commands

    assert_equal nil, result
  end


  def test_it_executes_help_commands
    input  = 'help queue count'
    result = execute_commands

    assert_equal nil, result
  end


  def test_it_loads_data
    input = 'load fixtures/event_attendees.csv'
    assign(input)
    execute_commands

    assert cli.event_reporter.queue
  end

  def test_it_execute_the_save_to_command
    input = 'load fixtures/event_attendees.csv'
    assign(input)
    execute_commands

    input = 'queue save to empty'
    assign(input)
    execute_commands

    assert_match /empty/, cli.event_reporter.save_to("empty")
  end

  def test_it_executes_the_find_command
    input = 'load fixtures/event_attendees.csv'
    assign(input)
    execute_commands

    input = 'find last_name nguyen'
    assign(input)
    execute_commands
    assert_equal 1, cli.event_reporter.count_data
  end

end
