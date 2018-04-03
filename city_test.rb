# Note that we require and start simplecov before
# doing ANYTHING else, including other require statements.
require 'simplecov'
SimpleCov.start

require "minitest/autorun"

require_relative "city"

class CityTest < Minitest::Test

  def setup
    prng = Minitest::Mock.new("prng")
    @c = City::new(prng)
  end

  # UNIT TEST FOR METHOD route(driver, current_location)
  # Equivalence classes do not make sense for this test since it is simply making sure that the names of the objects are printed out
  def test_route
    driver = Minitest::Mock.new("Driver")
    current_location = Minitest::Mock.new("Current Location")
    def driver.name; "Driver 1"; end
    def current_location.name; "Museum"; end
    def current_location.get_next_road(random)
      next_road = Minitest::Mock.new("Next Road")
      def next_road.name; "Bar St."; end
      def next_road.to_location(from)
        next_location = Minitest::Mock.new("Next Location")
        def next_location.name; "Cathedral"; end
        next_location
      end
      next_road
    end
    assert_output("Driver 1 heading from Museum to Cathedral via Bar St.\n") { @c.route(driver, current_location) }
  end

  # UNIT TEST FOR METHOD add_driver(name)
  # The only parameter is an arbitrary name string, so there are no equivalence classes
  # If you add one driver, the size of the @drivers array should be incremented by one.
  def test_add_driver
    driver = Minitest::Mock.new "Driver 1"
    @c.add_driver(driver)
    assert_equal 6, @c.drivers.count
  end

  # UNIT TEST FOR METHOD run_simulation(prng)
  # The only parameter for this is a pseudorandom number generator (which is mocked for this test), so there are no noteworthy equivalence classes.
  # This test ensures that print_results is called for each driver in run_simulation(prng).
  def test_run_simulation
    driver1 = Minitest::Mock.new("Driver1")
    driver1.expect :print_results, nil
    driver2 = Minitest::Mock.new("Driver2")
    driver2.expect :print_results, nil
    def @c.traverse_city(driver); nil; end;
    @c.add_driver driver1
    @c.add_driver driver2
    @c.run_simulation
    assert_mock driver1
    assert_mock driver2
  end

end
