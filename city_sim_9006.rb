require_relative "argschecker"
require_relative "city"

argschecker = ArgsChecker::new
seed = argschecker.check_args(ARGV)
prng = Random::new(seed)

city = City::new
for i in 1..5 do
  city.add_driver(Driver::new("Driver #{i}"))
end
city.run_simulation(prng)
