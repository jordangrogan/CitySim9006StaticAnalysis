# Note that we require and start simplecov before
# doing ANYTHING else, including other require statements.
require 'simplecov'
SimpleCov.start

require "minitest/autorun"

require_relative "location"

class LocationTest < Minitest::Test

  def setup
    @l = Location::new("Test Location")
  end

  # UNIT TESTS FOR METHOD get_next_road(prng)
  # The parameter is a pseudorandom number generator, so it doesn't make sense for their to be equivalence classes
  # The pseudorandom number generator's rand function in this unit test is stubbed
  # In this test, we make sure that the "random value" (which we're stubbing & passing into get_next_road(prng)) returns the correct road that was added in the correct order.
  def test_get_next_road
    prng = Minitest::Mock.new("prng")
    road1 = Minitest::Mock.new("test_road_1")
    road2 = Minitest::Mock.new("test_road_2")
    @l.add_road(road1)
    @l.add_road(road2)
    def prng.rand(size); 0; end
    assert_equal road1, @l.get_next_road(prng)
    def prng.rand(size); 1; end
    assert_equal road2, @l.get_next_road(prng)
  end

end
