module Event
  class Ayso
    SUMMARY = "Soccer"

    def initialize(summary_suffix, date, time, field, home_or_away, opponent_team, opponent_coach)
      @event = Icalendar::Event.new
      @event.dtstart = Time.local(date.year, date.month, date.day, time.hour, time.min)
      @event.duration = "P60M"
      @event.summary = build_summary(summary_suffix)
      @event.location = build_location(field)
      @event.description = build_description(home_or_away, opponent_coach, opponent_team)
    end

    def to_ical
      @event
    end

    private

    def build_summary(suffix)
      suffix.empty? ? SUMMARY : "#{SUMMARY}: #{suffix}"
    end

    def build_location(field)
      friendly_field = field.split(" - ")[0..1].join(" @ ")
      "Field #{friendly_field}"
    end

    def build_description(home_or_away, opponent_coach, opponent_team)
      "#{home_or_away} versus coach: #{opponent_coach}#{', ' + opponent_team if opponent_team}"
    end
  end
end
