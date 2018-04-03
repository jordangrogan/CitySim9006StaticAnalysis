# Location class
class Location
  attr_reader :name, :roads

  def initialize(name)
    @name = name
    @roads = [] # @roads are streets or avenues that this location can travel to
  end

  def add_road(road)
    @roads << road
  end

  def get_next_road(prng)
    val = prng.rand(@roads.size)
    @roads[val]
  end
end
