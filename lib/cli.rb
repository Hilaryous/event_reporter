class CLI
  attr_reader :command, :parameter, :sub_command
  def initialize
    @command = ""
    @sub_command = ""
    @parameter = ""
  end

  def start
    "Event Reporter Initialized"
  end

  def process_input(input)
    input.split
  end

  def assign_instructions(parts)
    if parts[0] == 'load'
      command = parts[0]
      paramater = parts[1]
    elsif parts[0] == 'find'
      command = parts[0]
      parameters = parts[1]
    end
  end
end

# case command
# when 'queue'
#   execute_sub_command('queue')
# when 'load'
#   loading
# when 'help'
#   if parts[1] then execute_sub_command
#   else print help thing
#
#
# def execute_subcommand
#   case sub_command
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
