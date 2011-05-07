class FakeLogger

  attr_reader :lines

  def initialize
    @lines = []
  end

  def error( message )
    @lines << message
  end

  def to_s
    @lines.join("\n")
  end

  def flush
    @flush = true
  end
end
