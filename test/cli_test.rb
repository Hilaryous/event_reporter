gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'
require 'pry'

class CLITest < Minitest::Test
  attr_reader :cli
  def setup
    @cli ||= CLI.new
  end

  def test_it_exist
    assert cli
  end

  def test_it_starts
    assert "Event Manager Initialized!", cli.start
  end

  def test_it_has_attributes
    assert cli.command
    assert cli.queue_command
    assert cli.parameter
  end

  def test_it_processes_input
    input  = 'find zipcode 80203'
    result = cli.process_input(input)

    assert_equal ['find', 'zipcode', '80203'], result
  end

  def test_it_assigns_instructions
    input  = 'load filename'
    parts = cli.process_input(input)
    cli.assign_instructions(parts)

    assert_equal 'load', cli.command
    assert_equal 'filename', cli.parameter
  end

  def test_it_assigns_queue_instructions
    input  = 'queue count'
    parts = cli.process_input(input)
    cli.assign_instructions(parts)

    assert_equal 'count', cli.queue_command
  end

  def test_it_assigns_help_instructions
    input  = 'help queue count'
    parts = cli.process_input(input)
    cli.assign_instructions(parts)

    assert_equal 'queue count', cli.parameter
  end

  def test_it_exectues_instructions
    input  = 'help'
    parts = cli.process_input(input)
    cli.assign_instructions(parts)
    result = cli.execute_instructions
    assert_equal 'help', result
  end

  def test_it_executes_queue_commands
    input  = 'queue count'
    parts = cli.process_input(input)
    cli.assign_instructions(parts)
    result = cli.execute_instructions

    assert_equal 'counting queue', result
  end

  def test_it_executes_help_commands
    input  = 'help queue count'
    parts = cli.process_input(input)
    cli.assign_instructions(parts)
    result = cli.execute_instructions

    assert_equal 'use it this way', result

  end
end
