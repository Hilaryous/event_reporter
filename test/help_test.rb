gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/help'

class HelpTest < Minitest::Test

  def test_prints_general_help_statement
    assert_match /The available commands are:/, Help.general
  end

  def test_prints_help_queue_count
    assert_match /Output/, Help.count
  end

  def test_prints_help_queue_clear
    assert_match /Empty/, Help.clear
  end

  def test_prints_help_queue_save_to
    assert_match /Export/, Help.save_to
  end

  def test_prints_help_queue_print_by
    assert_match /Print/, Help.print_by
  end

  def test_prints_help_find
    assert_match /Load/, Help.find
  end

  def test_prints_help_load
    assert_match /Erase/, Help.load_file
  end
end
