require 'icalendar'

ical_urls = ENV['GOOGLE_CALENDARS'].split ','
ical_labels = ENV['CALENDAR_LABELS'].split ','

def getEvents(cal, label, number)
  result = Net::HTTP.get cal
  calendars = Icalendar.parse(result)
  calendar = calendars.first

  events = calendar.events.map do |event|
    {
      start: event.dtstart,
      end: event.dtend,
      summary: event.summary,
      label: label,
      number: "cal-#{number + 1}"
    }
  end.select { |event| event[:start] > DateTime.now }
end

SCHEDULER.every '60s', :first_in => 4 do |job|
  events = []

  # Get events from each calendar and add them to one list.
  i = 0
  while i < ical_urls.length do
    events.concat(getEvents(URI(ical_urls[i]), ical_labels[i], i))
    i += 1
  end

  events = events.sort { |a, b| a[:start] <=> b[:start] }

  events = events[0..10]

  send_event('google_calendar', { events: events, colours: [544,54754,337,45454] })
end
