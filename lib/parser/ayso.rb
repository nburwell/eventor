require 'pry'
require_relative './base.rb'
require_relative '../event/ayso.rb'

module Parser
  class Ayso < Base
    SUMMARY = "Soccer"

    attr_reader :summary_suffix

    def initialize(summary, input)
      @summary_suffix = summary
      super(input)
    end

    private

    def parse_into_event!(line)
      data = line.split("\t").map { |col| col.strip }

      puts data.inspect
      date = Date.parse(data[0])
      time = Time.parse(data[2])
      field = data[1]
      home_or_away = data[3]
      opponent_team = data[8]
      opponent_coach = data[9]

      event = Event::Ayso.new(summary_suffix, date, time, field, home_or_away, opponent_team, opponent_coach)
      event.to_ical
    end
  end
end
