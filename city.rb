require_relative 'driver'
require_relative 'street'
require_relative 'avenue'
require_relative 'location'

# City class
class City
  attr_reader :drivers

  def initialize(prng)
    # SETUP LOCATIONS & ROADS & DRIVERS
    @prng = prng
    @drivers = []
    @locations = {}
    @starting_locations = []
    init_locations
    init_foo_street
    init_bar_street
    init_fourth_ave
    init_fifth_ave
  end

  def init_locations
    init_locations_cathedral_hospital
    init_locations_museum_hillman
    init_locations_monroeville_downtown
  end

  def init_locations_cathedral_hospital
    hospital = Location.new('Hospital')
    cathedral = Location.new('Cathedral')
    @starting_locations.push(hospital, cathedral)
    @locations['hospital'] = hospital
    @locations['cathedral'] = cathedral
  end

  def init_locations_museum_hillman
    museum = Location.new('Museum')
    hillman = Location.new('Hillman')
    @starting_locations.push(museum, hillman)
    @locations['museum'] = museum
    @locations['hillman'] = hillman
  end

  def init_locations_monroeville_downtown
    monroeville = Location.new('Monroeville')
    downtown = Location.new('Downtown')
    @locations['monroeville'] = monroeville
    @locations['downtown'] = downtown
  end

  def init_foo_street
    hospital = @locations['hospital']
    hillman = @locations['hillman']
    foo = Street.new('Foo St.', hospital, hillman)
    hospital.add_road(foo)
    hillman.add_road(foo)
  end

  def init_bar_street
    cathedral = @locations['cathedral']
    museum = @locations['museum']
    bar = Street.new('Bar St.', cathedral, museum)
    cathedral.add_road(bar)
    museum.add_road(bar)
  end

  def init_fourth_ave
    hospital = @locations['hospital']
    cathedral = @locations['cathedral']
    fourth = Avenue.new('Fourth Ave.', hospital,
                        cathedral, @locations['monroeville'])
    hospital.add_road(fourth)
    cathedral.add_road(fourth)
  end

  def init_fifth_ave
    hillman = @locations['hillman']
    museum = @locations['museum']
    fifth = Avenue.new('Fifth Ave.', museum,
                       hillman, @locations['downtown'])
    hillman.add_road(fifth)
    museum.add_road(fifth)
  end

  def run_simulation
    @drivers.each do |driver|
      traverse_city(driver)
      driver.print_results
    end
  end

  def traverse_city(driver)
    rand_val = @prng.rand(@starting_locations.size)
    current_location = @starting_locations[rand_val]
    until (current_location == @locations['monroeville']) ||
          (current_location == @locations['downtown'])
      driver.current_location = current_location.name
      current_location = route(driver, current_location)
    end
  end

  def add_driver(driver)
    @drivers << driver
  end

  def route(driver, current_location)
    next_road = current_location.get_next_road(@prng)
    next_location = next_road.to_location(current_location)
    from_to = "#{current_location.name} to #{next_location.name}"
    puts "#{driver.name} heading from #{from_to} via #{next_road.name}"
    next_location
  end
end
