module Help
  def self.general
    general_statement = "The available commands are: [load <filename>] [queue count] [queue clear] [queue print] [queue print by <attribute>] [queue save to <filename.csv>] [find <attribute> <criteria>] \n Type help followed by the command name to learn more about each command"
    puts general_statement
    return general_statement
  end

  def self.find
    find_statement = "Load the queue with all records matching the criteria for the given attribute"
    puts find_statement
    return find_statement
  end

  def self.load_file
    load_file_statement = "Erase any loaded data and parse the specified file. If no filename is given, the default filename is event_attendees.csv"
    puts load_file_statement
    return load_file_statement
  end

  def self.count
    count_statement = "Output how many records are in the current queue"
    puts count_statement
    return count_statement
  end

  def self.clear
    clear_statement = "Empty the queue"
    puts clear_statement
    return clear_statement
  end

  def self.save_to
    save_to_statement = "Export the current queue to the specified filename as a CSV"
    puts save_to_statement
    return save_to_statement
  end

  def self.print_by
    print_by_statement = "Print the data table sorted by the specified attribute like zipcode"
    puts print_by_statement
    return print_by_statement
  end
end
