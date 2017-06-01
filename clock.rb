module BookKeeping
  VERSION = 2
end

class Clock
  def self.at(hours, minutes)
    new(hours, minutes)
  end

  def initialize(hours, minutes)
    @hours   = (hours + minutes / 60) % 24
    @minutes = minutes % 60
    self.freeze
  end

  def to_s
    "#{format(@hours)}:#{format(@minutes)}"
  end

  def +(minutes)
    Clock.new(@hours, @minutes + minutes)
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def format(value)
    sprintf '%02d', value
  end
end
