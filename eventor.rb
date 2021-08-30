require "rubygems"
require "bundler"
require "csv"
require "date"
require "time"
Bundler.require
 
require_relative 'lib/parser/ayso.rb'

### Create iCal ics file with multiple events
class EventCreator
  attr_reader :cal
 
  def initialize
    @cal = Icalendar::Calendar.new
    make_events
  end

  def make_events
    ayso_parser = Parser::Ayso.new(ARGV[0] || "", "input.txt")
    ayso_parser.events.each do |event|
      @cal.add_event(event)
    end
  end
 
  def to_ics
    File.open("events.ics", "w") { |f| f.write @cal.to_ical }
  end
end
 
if __FILE__ == $0
  calendar = EventCreator.new
  calendar.to_ics
end
