# Class that checks the arguments to the program
class ArgsChecker
  def initialize(args)
    @args = args
  end

  def check_args
    raise 'Enter a seed and only a seed' unless @args.size == 1
    @args[0].to_i # Will return 0 if it's not an integer
  end
end
