class EventReporter
  def initialize(repository='./test/fixtures/event_attendees.csv')
    @repository = repository
  end

  def find(attribute, value='filename')
    "attribute: #{attribute}"
  end
end

