gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'

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

  def test_it_has_commands
    assert cli.commands
  end

  def test_it_has_sub_commands
    assert cli.sub_commands
  end

  def test_it_has_parameters
    assert cli.parameters
  end

  def test_it_processes_input
    input  = 'find zipcode 80203'
    result = cli.process_input(input)

    assert_equal ['find', 'zipcode', '80203'], result
  end

  def test_it_assigns_instruction
    input  = 'load filename'
    parts = cli.process_input(input)
    cli.assign_instructions(parts)

    assert_equal 'load', cli.command
    assert_equal 'filename', cli.command
  end

end
