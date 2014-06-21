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

  def execute_command
    case command
    when 'queue'
      execute_queue_command
    when 'load'
      'load'
    when 'find'
      'find'Find.find(parameters)
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
