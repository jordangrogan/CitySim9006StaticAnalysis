# Class that checks the arguments to the program
class ArgsChecker
  def check_args(arr)
    raise 'Enter a seed and only a seed' unless arr.size == 1
    arr[0].to_i # Will return 0 if it's not an integer
  end
end
