# A Street is a road that has two locations on it:
# location1 & location2.
# A street is two-way, that is, location1 can traverse to
# location2, and location2 can traverse to location1
class Street
  attr_accessor :name

  def initialize(name, location1, location2)
    @name = name
    @location1 = location1
    @location2 = location2
  end

  def to_location(from_location)
    if from_location == @location1
      @location2
    elsif from_location == @location2 # Two-Way Streets
      @location1
    end
  end
end
