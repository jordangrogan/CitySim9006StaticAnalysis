require "minitest/autorun"

require_relative "argschecker"

class ArgsCheckerTest < Minitest::Test

  def setup
    @args_checker = ArgsChecker::new
  end

  # UNIT TESTS FOR METHOD check_args(arr)
  # Equivalence classes:
  # arr.size == 0 -> raises exception
  # arr.size == 1 && arr[0] is an Integer -> returns arr[0]
  # arr.size == 1 && arr[0] is not an Integer -> returns 0
  # arr.size == 2..INFINITY -> raises exception

  # If no arguments were provided, then an exception is raised.
  # EDGE CASE
  def test_no_args
    assert_raises "Enter a seed and only a seed" do
      arr = []
      @args_checker.check_args(arr)
    end
  end

  # If one integer argument was provided, then that argument is returned.
  # This tests the value 0 (which is also the default if not an integer).
  # BASE CASE
  def test_one_arg_zero
    arr = ["0"]
    assert_equal 0, @args_checker.check_args(arr)
  end

  # If one integer argument was provided, then that argument is returned.
  # This tests the value 1.
  # BASE CASE
  def test_one_arg_one
    arr = ["1"]
    assert_equal 1, @args_checker.check_args(arr)
  end

  # If two or more arguments were provided, then an exception is raised.
  # This tests two arguments.
  # EDGE CASE
  def test_two_args
    assert_raises "Enter a seed and only a seed" do
      arr = ["0","1"]
      @args_checker.check_args(arr)
    end
  end

  # If two or more arguments were provided, then an exception is raised.
  # This tests three arguments.
  def test_three_args
    assert_raises "Enter a seed and only a seed" do
      arr = ["0","1","2"]
      @args_checker.check_args(arr)
    end
  end

  # If one non-integer argument was provided, then 0 is returned.
  # This tests the string value "AString".
  def test_args_not_an_integer
    arr = ["AString"]
    assert_equal 0, @args_checker.check_args(arr)
  end

end
