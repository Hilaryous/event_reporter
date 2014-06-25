require 'pry'
class CLI
  attr_reader :command,
              :parameters,
              :queue_command,
              :find_command,
              :event_reporter

  def self.run
    CLI.new.start
  end

  def initialize
    @command        = ""
    @queue_command  = ""
    @find_command   = ""
    @parameters     = ""
    @queue ||= TheQueue.new
    @event_reporter ||= EventReporter.new(@queue)
  end

  def start
    puts "Welcome to Entry Reporter"
    while command != 'q'
      puts "Enter your command:"
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

  def process_find_input(input)
    unless input.nil?
      if @find_command == 'state'
        input[0].upcase
      else
        input.map{|part| part.capitalize}.join
      end
    end
  end

  def assign_instructions(parts)
    @command = parts[0]
    if parts[0] == 'load'
      if parts[1]
        @parameters = Dir["./*/#{parts[1]}"].join('')
      else
        @parameters = './data/event_attendees.csv'
      end
    elsif parts[0] == 'find'
      @find_command = parts[1]
      @parameters = process_find_input(parts[2..-1])
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
    @queue_command = parts[1] if n == 1
    @queue_command = parts[1..2].join(" ") if n == 2
  end

  def assign_queue_parameters(parts, n)
    @parameters = parts[2..-1].join(" ") if n == 1
    @parameters = parts[3..-1].join(" ") if n == 2
  end

  def assign_help_instructions(parts)
    case parts[1]
    when 'find' then assign_help_parameter(parts, 1)
    when 'load' then assign_help_parameter(parts, 1)
    end
  end

  def assign_queue_help_instructions(parts)
    case parts[1..2].join(" ")
    when 'queue count' then assign_help_parameter(parts, 2)
    when 'queue clear' then assign_help_parameter(parts, 2)
    when 'queue print' then assign_help_parameter(parts, 2)
    end

    case parts[1..3].join(" ")
    when 'queue print by' then assign_help_parameter(parts, 3)
    when 'queue save to'  then assign_help_parameter(parts, 3)
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
    when 'count'    then puts event_reporter.count_data
    when 'save to'  then event_reporter.save_to(@parameters)
    when 'print by' then event_reporter.print_by(@parameters)
    when 'print'    then event_reporter.print_data_table
    when 'clear'    then event_reporter.clear_data
    end
  end

  def execute_help_command
    case parameters
    when 'queue count'    then puts Help.count
    when 'queue clear'    then puts Help.clear
    when 'queue print'    then puts Help.printer
    when 'queue save to'  then puts Help.save_to
    when 'queue print by' then puts Help.print_by
    when 'find'           then puts Help.find
    when 'load'           then puts Help.load_file
    end
  end
end
