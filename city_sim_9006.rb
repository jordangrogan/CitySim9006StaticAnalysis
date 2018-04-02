require_relative 'args_checker'
require_relative 'city'

argschecker = ArgsChecker.new(ARGV)
seed = argschecker.check_args
prng = Random.new(seed)

city = City.new
(1..5).each do |i|
  city.add_driver(Driver.new("Driver #{i}"))
end
city.run_simulation(prng)
