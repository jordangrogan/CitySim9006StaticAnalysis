# Note that we require and start simplecov before
# doing ANYTHING else, including other require statements.
require 'simplecov'
SimpleCov.start

require "minitest/autorun"

require_relative "avenue"

class AvenueTest < Minitest::Test

  # UNIT TESTS FOR METHOD to_location(from_location)
  # Equivalence classes:
  # from_location = location1 -> returns location2
  # from_location = location2 -> returns location3
  # from_location = location3 -> returns nil

  # If location1 is given for input to_location, location2 is returned.
  # loc1, loc2, & loc3 are doubles for Location objects.
  def test_loc1_to_loc2
    loc1 = Minitest::Mock.new("Location 1")
    loc2 = Minitest::Mock.new("Location 2")
    loc3 = Minitest::Mock.new("Location 3")
    avenue = Avenue::new("Foo", loc1, loc2, loc3)
    assert_equal loc2, avenue.to_location(loc1)
  end

  # If location2 is given for input to_location, location3 is returned
  # loc1, loc2, & loc3 are doubles for Location objects.
  def test_loc2_to_loc3
    loc1 = Minitest::Mock.new("Location 1")
    loc2 = Minitest::Mock.new("Location 2")
    loc3 = Minitest::Mock.new("Location 3")
    avenue = Avenue::new("Foo", loc1, loc2, loc3)
    assert_equal loc3, avenue.to_location(loc2)
  end

  # If location3 is given for input to_location, nil is returned
  # loc1, loc2, & loc3 are doubles for Location objects.
  def test_loc3_nil
    loc1 = Minitest::Mock.new("Location 1")
    loc2 = Minitest::Mock.new("Location 2")
    loc3 = Minitest::Mock.new("Location 3")
    avenue = Avenue::new("Foo", loc1, loc2, loc3)
    assert_nil avenue.to_location(loc3)
  end

end
