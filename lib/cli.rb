require 'pry'
class CLI
  attr_reader   :command,
                :parameters,
                :queue_command,
                :find_command,
                :event_reporter,
                :parser,
                :input

  def self.run
    CLI.new.start
  end

  def initialize
    @parser = Parser.new
    @command        = ""
    @queue_command  = ""
    @find_command   = ""
    @parameters     = ""
    @input          = ""
    @queue ||= TheQueue.new
    @event_reporter ||= EventReporter.new(@queue)
  end

  def start
    puts "Welcome to Entry Reporter"
    while command != 'q'
      puts "Enter your command:"
      @input = gets.chomp
      parts = @parser.process_input(input)
      @parser.assign_instructions(parts)
      assign_commands_and_params
      execute_instructions
    end
    puts "Quitting Event Reporter"
  end

  private

  def assign_commands_and_params
    @command        = @parser.command
    @queue_command  = @parser.queue_command
    @find_command   = @parser.find_command
    @parameters     = @parser.parameters
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
