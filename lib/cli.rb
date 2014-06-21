# require 'pry'
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
    @command = parts[0]
    if parts[0] == 'load' || parts[0] == 'find'
      @parameter = parts[1]
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

  def assign_queue_command(parts, n)
    @queue_command = parts[1] if n == 1
    @queue_command = parts[1..2].join(" ") if n == 2
  end

  def assign_help_instructions(parts)
    case parts[1..2].join(" ")
      when 'queue count'
        assign_help_command(parts, 2)
      when 'queue clear'
        assign_help_command(parts, 2)
      when 'queue print'
        assign_help_command(parts, 2)
    end

    case parts[1..3].join(" ")
      when 'queue print by'
        assign_help_command(parts, 3)
      when 'queue save to'
        assign_help_command(parts, 3)
    end

    case parts[1]
      when 'find'
        assign_help_command(parts, 1)
      when 'load'
        assign_help_command(parts, 1)
      end
  end

  def assign_help_command(parts, n) # n is number of commands to be added
    case n
    when 1 then @help_command = parts[1]
    when 2 then @help_command = parts[1..2].join(" ")
    when 3 then @help_command = parts[1..3].join(" ")
    end
  end

  def execute_command
    case command
    when 'queue'
      execute_queue_command
    when 'load'
      'load'
    when 'find'
      'find'
    when 'help'
      if help_command == ""
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
    case help_command
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
end
