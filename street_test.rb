require "minitest/autorun"

require_relative "street"

class StreetTest < Minitest::Test

  # UNIT TESTS FOR METHOD to_location(from_location)
  # Equivalence classes:
  # from_location = location1 -> returns location2
  # from_location = location2 -> returns location1

  # If location1 is given for input to_location, location2 is returned
  # loc1 & loc2 are doubles for Location objects.
  def test_loc1_to_loc2
    loc1 = Minitest::Mock.new("Location 1")
    loc2 = Minitest::Mock.new("Location 2")
    avenue = Street::new("Foo", loc1, loc2)
    assert_equal loc2, avenue.to_location(loc1)
  end

  # If location2 is given for input toLocation, location1 is returned
  # loc1 & loc2 are doubles for Location objects.
  def test_loc2_to_loc1
    loc1 = Minitest::Mock.new("Location 1")
    loc2 = Minitest::Mock.new("Location 2")
    avenue = Street::new("Foo", loc1, loc2)
    assert_equal loc1, avenue.to_location(loc2)
  end

end
