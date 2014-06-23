# require 'pry'
require './lib/event_reporter'
require './lib/attendee_repository'
require './lib/attendee'


class CLI

  # Removed @help_command and just used @parameters to store that same data.
  # Seemed to fit logically because things like queue and find when passed to
  # help are treated as parameters and not commands.
  attr_reader :command,
              :parameters,
              :queue_command,
              :find_command,
              :event_reporter

  def initialize
    @event_reporter = nil
    @command        = ""
    @queue_command  = ""
    @find_command   = ""
    @parameters     = ""
  end

  def process_input(input)
    input.split
  end

  def assign_instructions(parts)
    @command = parts[0]
    if parts[0] == 'load'
      @parameters = parts[1]
    elsif parts[0] == 'find'
      @find_command = parts[1]
      @parameters = parts[2]
    elsif parts[0] == 'queue'
      assign_queue_instructions(parts)
    elsif parts[0] == 'help'
      if parts[1]
        assign_help_instructions(parts)
      end
    end
  end

  def assign_queue_instructions(parts)
    case parts[1]
      when 'count'
        assign_queue_command(parts, 1)
      when 'clear'
        assign_queue_command(parts, 1)
      when 'print'
        assign_queue_command(parts, 1)
    end

    case parts[1..2].join(" ")
      when 'print by'
        assign_queue_command(parts, 2)
      when 'save to'
        assign_queue_command(parts, 2)
    end
  end

  def assign_queue_command(parts, n) # n is number of params to be added
    if n == 1
      @queue_command = parts[1]
      @parameters = parts[2..-1].join(" ")
    elsif n == 2
      @queue_command = parts[1..2].join(" ")
      @parameters = parts[3..-1].join(" ")
    end
  end

  def assign_help_instructions(parts)
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

    case parts[1]
      when 'find'
        assign_help_parameter(parts, 1)
      when 'load'
        assign_help_parameter(parts, 1)
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
        @event_reporter = EventReporter.new(repository)
        puts "Loaded #{parameters}"
        # At this point the current cli instance will have @event_reporter loaded
        # with the specified file, and all possible actions will be called as
        # event_reporter.find, event_reporter.queue_print_by, etc.
        #
        # This will also reinitialize @event_reporter with the new specified file
        # when load is called multiple times within a single CLI instance.
      when 'find'
        event_reporter.find(find_command, parameters)
      when 'help'
        if @parameters == ''
          'help'
        else
          execute_help_command
        end
    end
  end

  def execute_queue_command
    case queue_command
      when 'count'
        'counting queue'
      when 'save to'
        'saving queue'
      when 'print by'
        'printing'
      when 'print'
        'print'
      when 'clear'
        'clear'
    end
  end

  def execute_help_command
    case parameters
      when 'queue count'
        "use it this way"
      when 'queue clear'
        'use it this way'
      when 'queue print'
        'use it this way'
      when 'queue save to'
        'use it this way'
      when 'queue print by'
        'use it this way'
      when 'find'
        'use it this way'
      when 'load'
        'use it this way'
    end
  end


  # just load a file once
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

  def run
    CLI.new.start
  end
end
