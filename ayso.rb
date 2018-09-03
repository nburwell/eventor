class Ayso < Parser
  private

  SUMMARY = "Soccer"

  def parse_into_event!(line)
    data = line.split("\t").map { |col| col.strip }

    date = Date.parse(data[0])
    time = Time.parse(data[2])
    start_time = Time.local(date.year, date.month, date.day, time.hour, 0)
    field = data[1].split(" - ")[0]
    home_or_away = data[3]
    opponent_team = data[7]
    opponent_coach = data[8]

    event             = Icalendar::Event.new
    event.dtstart     = start_time
    event.duration    =  "P60M"
    event.summary     = SUMMARY
    event.location    = "Field #{field}"
    event.description = "#{home_or_away} versus #{opponent_team}, coach: #{opponent_coach}"
    event
  end
end