module BookKeeping
  VERSION = 2
end

class Clock
  def self.at(hours, minutes)
    new(hours, minutes)
  end

  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    self.minutes = minutes
    self.hours   = hours
  end

  def to_s
    "#{format(hours)}:#{format(minutes)}"
  end

  def +(minutes)
    self.tap { self.minutes += minutes }
  end

  def ==(other)
    to_s == other.to_s
  end

  def hours=(value)
    return @hours = value if value.nil?
    @hours = (value + @full_minutes / 60) % 24
  end

  def minutes=(value)
    @full_minutes = value
    @minutes      = value % 60
    update_hours
  end

  private

  def update_hours
    self.hours = self.hours
  end

  def format(value)
    sprintf '%02d', value
  end
end
