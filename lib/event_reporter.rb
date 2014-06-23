class EventReporter
  def initialize(repository='./test/fixtures/event_attendees.csv')
    @repository = repository
  end

  def find(filename)
    'find method in EventReporter'
  end
end
