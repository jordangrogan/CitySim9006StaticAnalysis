require_relative 'args_checker'
require_relative 'city'

argschecker = ArgsChecker.new(ARGV)
seed = argschecker.check_args
prng = Random.new(seed)

city = City.new(prng)
city.run_simulation
