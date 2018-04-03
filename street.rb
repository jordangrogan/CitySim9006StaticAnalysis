# A Street is a road that has two locations on it:
# location1 & location2.
# A street is two-way, that is, location1 can traverse to
# location2, and location2 can traverse to location1
class Street
  attr_reader :name

  def initialize(name, location_first, location_second)
    @name = name
    @location_first = location_first
    @location_second = location_second
  end

  def to_location(from_location)
    if from_location == @location_first
      @location_second
    elsif from_location == @location_second # Two-Way Streets
      @location_first
    end
  end
end
