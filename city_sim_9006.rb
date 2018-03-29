require_relative 'args_checker'
require_relative 'city'

argschecker = ArgsChecker.new
seed = argschecker.check_args(ARGV)
prng = Random.new(seed)

city = City.new
(1..5).each do |i|
  city.add_driver(Driver.new("Driver #{i}"))
end
city.run_simulation(prng)
