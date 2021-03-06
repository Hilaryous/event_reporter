module Help
  def self.general
    "The available commands are:\n [load <filename>]\n [queue count]\n [queue clear]\n [queue print]\n [queue print by <attribute>]\n [queue save to <filename.csv>]\n [find <attribute> <criteria>]\nType help followed by the command name to learn more about each command"
  end

  def self.find
    "Load the queue with all records matching the criteria for the given attribute"
  end

  def self.load_file
    "Erase any loaded data and parse the specified file. If no filename is given, the default filename is event_attendees.csv"
  end

  def self.count
    "Output how many records are in the current queue"
  end

  def self.clear
    "Empty the queue"
  end

  def self.printer
    "Print out a tab-delimited data table with a header row"
  end

  def self.save_to
    "Export the current queue to the specified filename as a CSV"
  end

  def self.print_by
    "Print the data table sorted by the specified attribute like zipcode"
  end
end
