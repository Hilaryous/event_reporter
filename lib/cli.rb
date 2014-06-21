require 'pry'
class CLI
  attr_reader :command,
              :parameter,
              :queue_command,
              :help_command

  def initialize
    @command       = ""
    @queue_command = ""
    @help_command  = ""
    @parameter     = ""
  end

  def start
    "Event Reporter Initialized"
  end

  def process_input(input)
    input.split
  end

  def assign_instructions(parts)
    if parts[0] == 'load' || parts[0] == 'find'
      @command = parts[0]
      @parameter = parts[1]
    elsif parts[0] == 'queue'
      assign_queue_instructions(parts)
    elsif parts[0] == 'help'
      if parts[1]
        assign_help_instructions(parts)
      else
        @command = parts[0]
      end
    end
  end

  def assign_queue_instructions(parts)
    if parts[1]== 'count'
      @queue_command = parts[1]
    elsif parts[1]== 'clear'
      @queue_command = parts[1]
    elsif parts[1..2].join(' ') == 'print by'
      @queue_command = parts[1..2].join(' ')
    elsif parts[1]== 'print'
      @queue_command = parts[1]
    elsif parts[1..2].join(' ') == 'save to'
      @queue_command = parts[1..2].join(' ')
    end
  end

  def assign_help_instructions(parts)
    if parts[1..2].join(' ') == 'queue count'
      @help_command = parts[1..2].join(' ')
    elsif parts[1..2].join(' ') == 'queue clear'
      @help_command = parts[1..2].join(' ')
    elsif parts[1..2].join(' ') == 'queue print'
      @help_command = parts[1..2].join(' ')
    elsif parts[1..3].join(' ') == 'queue print by'
      @help_command = parts[1..3].join(' ')
    elsif parts[1..3].join(' ') == 'queue save to'
      @help_command = parts[1..3].join(' ')
    elsif parts[1].join(' ') == 'find'
      @help_command = parts[1].join(' ')
    elsif parts[1] == 'load'
      @help_command = parts[1]
    end
  end
end


# case command
# when 'queue'
#   execute_queue_command('queue')
# when 'load'
#   loading
# when 'help'
#   if parts[1] then execute_queue_command
#   else print help thing
#
#
# def execute_subcommand
#   case queue_command
#   when 'print'
#
# end


# def the_loop
#   loop do
#     puts "Enter something"
#     input = gets.chomp
#
#     case input
#     when 'load' then 'load command'
#     when 'help' then 'help command'
#     when 'queue' then 'queue command'
#     when 'find' then 'find command'
#     end
#   end
# end
