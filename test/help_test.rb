gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/help'

class HelpTest < Minitest::Test

  def test_prints_general_help_statement
    assert_equal "The available commands are: [load <filename>] [queue count] [queue clear] [queue print] [queue print by <attribute>] [queue save to <filename.csv>] [find <attribute> <criteria>] \n Type help followed by the command name to learn more about each command", Help.general
  end

  def test_prints_help_queue_count
    assert_equal "Output how many records are in the current queue", Help.count
  end

  def test_prints_help_queue_clear
    assert_equal "Empty the queue",Help.clear
  end

  def test_prints_help_queue_save_to
    assert_equal "Export the current queue to the specified filename as a CSV",Help.save_to
  end

  def test_prints_help_queue_print_by
    assert_equal "Print the data table sorted by the specified attribute like zipcode",Help.print_by
  end

  def test_prints_help_find
    assert_equal "Load the queue with all records matching the criteria for the given attribute",Help.find
  end

  def test_prints_help_load
    assert_equal "Erase any loaded data and parse the specified file. If no filename is given, the default filename is event_attendees.csv",Help.load_file
  end
end
