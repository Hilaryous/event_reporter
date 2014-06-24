require './lib/event_reporter'
require './lib/attendee_repository'
require './lib/attendee'
require './lib/help'
require './lib/queue'
require 'csv'

class CLI
  attr_reader :command,
              :parameters,
              :queue_command,
              :find_command,
              :event_reporter

  def start
    puts "Entry Reporter"
    command = '> '

    while command != 'q'
      puts "load a file:"
      puts "> "
      parts = process_input(gets.chomp)
      assign_instructions(parts)
      execute_instructions
    end
  end

  def initialize
    @command        = ""
    @queue_command  = ""
    @find_command   = ""
    @parameters     = ""
    @queue ||= TheQueue.new
    @event_reporter ||= EventReporter.new(@queue)
  end

  def self.run
    CLI.new.start
  end

  def start
    puts "Entry Reporter"
    while command != 'q'
      puts "enter input:"
      parts = process_input(gets.chomp)
      assign_instructions(parts)
      execute_instructions
    end
    puts "Quitting Event Reporter"
  end

  private

  def process_input(input)
    input.split
  end

  def assign_instructions(parts)
    @command = parts[0]
    if parts[0] == 'load'
      if parts[1]
        @parameters = parts[1]
      else
        @parameters = './data/event_attendees.csv'
      end
    elsif parts[0] == 'find'
      @find_command = parts[1]
      @parameters = parts[2]
    elsif parts[0] == 'queue'
      assign_queue_instructions(parts)
    elsif parts[0] == 'help'
      if parts[2]
        assign_queue_help_instructions(parts)
      elsif parts[1]
        assign_help_instructions(parts)
      else
        @command = parts[0]
      end
    end
  end

  def assign_queue_instructions(parts)
    case parts[1]
    when 'count'
      assign_queue_command(parts, 1)
      assign_queue_parameters(parts, 1)
    when 'clear'
      assign_queue_command(parts, 1)
      assign_queue_parameters(parts, 1)

    when 'print'
      assign_queue_command(parts, 1)
      assign_queue_parameters(parts, 1)
    end

    case parts[1..2].join(" ")
    when 'print by'
      assign_queue_command(parts, 2)
      assign_queue_parameters(parts, 2)

    when 'save to'
      assign_queue_command(parts, 2)
      assign_queue_parameters(parts, 2)
    end
  end

  def assign_queue_command(parts, n) # n is number of params to be added
    if n == 1
      @queue_command = parts[1]
    elsif n == 2
      @queue_command = parts[1..2].join(" ")
    end
  end

  def assign_queue_parameters(parts, n)
    if n == 1
      @parameters = parts[2..-1].join(" ")
    elsif n == 2
      @parameters = parts[3..-1].join(" ")
    end
  end

  def assign_help_instructions(parts)
    case parts[1]
    when 'find'
      assign_help_parameter(parts, 1)
    when 'load'
      assign_help_parameter(parts, 1)
    end
  end

  def assign_queue_help_instructions(parts)
    case parts[1..2].join(" ")
    when 'queue count'
      assign_help_parameter(parts, 2)
    when 'queue clear'
      assign_help_parameter(parts, 2)
    when 'queue print'
      assign_help_parameter(parts, 2)
    end

    case parts[1..3].join(" ")
    when 'queue print by'
      assign_help_parameter(parts, 3)
    when 'queue save to'
      assign_help_parameter(parts, 3)
    end
  end

  def assign_help_parameter(parts, n)
    case n
    when 1 then @parameters = parts[1]
    when 2 then @parameters = parts[1..2].join(" ")
    when 3 then @parameters = parts[1..3].join(" ")
    end
  end

  def execute_instructions
    case command
    when 'queue'
      execute_queue_command
    when 'load'
      repository = AttendeeRepository.load(parameters, Attendee)
      @event_reporter = EventReporter.new(repository, @queue)
    when 'find'
      event_reporter.find(find_command, parameters)
    when 'help'
      if @parameters == ''
        puts Help.general
      else
        execute_help_command
      end
    end
  end

  def execute_queue_command
    case queue_command
    when 'count'
      puts event_reporter.count_data
    when 'save to'
      event_reporter.save_to(@parameters)
    when 'print by'
      puts event_reporter.print_by
    when 'print'
      puts event_reporter.print_data_table
    when 'clear'
      event_reporter.clear
    end
  end

  def execute_help_command
    case parameters
    when 'queue count'
      puts Help.count
    when 'queue clear'
      puts Help.clear
    when 'queue print'
      puts Help.printer
    when 'queue save to'
      puts Help.save_to
    when 'queue print by'
      puts Help.print_by
    when 'find'
      puts Help.find
    when 'load'
      puts Help.load_file
    end
  end
end
