# An Avenue is a road that has three locations on it:
# location_first, location_second, location_third,
# in the order that they can be traversed.
# That is, location_first can go to location_second and
# location_second can go to location_third.
class Avenue
  attr_accessor :name

  def initialize(name, location_first, location_second, location_third)
    @name = name
    @location_first = location_first
    @location_second = location_second
    @location_third = location_third
  end

  def to_location(from_location)
    if from_location == @location_first
      @location_second
    elsif from_location == @location_second
      @location_third
    end
  end
end
