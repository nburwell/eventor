class Parser
  def initialize(input)
    @filename = input
  end

  def events
    lines = read_file
    parse_into_events!(lines)
  end

  private

  def read_file
    File.read(@filename).split("\n")
  end

  def parse_into_events!(lines)
    lines.map do |line|
      parse_into_event!(line)
    end
  end

  def parse_into_event!(line)
    raise NotImplementedError
  end
end