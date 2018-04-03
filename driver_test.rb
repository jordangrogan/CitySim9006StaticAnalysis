# Note that we require and start simplecov before
# doing ANYTHING else, including other require statements.
require 'simplecov'
SimpleCov.start

require "minitest/autorun"

require_relative "driver"

class DriverTest < Minitest::Test

  def setup
    @d = Driver::new("Driver 1")
  end

  # UNIT TESTS FOR METHOD add_book
  # There are no parameters, it does not make sense to partition it.
  # This test ensures that when a book is added, the number of books increases by 1.
  def test_add_book
    @d.add_book
    assert_equal @d.resources["books"], 1
    @d.add_book
    assert_equal @d.resources["books"], 2
  end

  # UNIT TESTS FOR METHOD add_dino
  # There are no parameters, it does not make sense to partition it.
  # This test ensures that when a dino is added, the number of dinos increases by 1.
  def test_add_dino
    @d.add_dino
    assert_equal @d.resources["dinos"], 1
    @d.add_dino
    assert_equal @d.resources["dinos"], 2
  end

  # UNIT TESTS FOR METHOD add_class
  # There are no parameters, it does not make sense to partition it.
  # This test ensures that when a class is added, the number of dinos multiplies by 2.
  def test_add_class
    assert_equal @d.resources["classes"], 1
    @d.add_class
    assert_equal @d.resources["classes"], 2
    @d.add_class
    assert_equal @d.resources["classes"], 4
  end

  # UNIT TESTS FOR METHOD pluralize(singularStr, num)
  # Equivalence classes:
  # num = 0 && singularStr ends with s -> returns "#{singularStr}es"
  # num = 0 && singularStr does not end with s -> returns "#{singularStr}s"
  # num = 1 -> returns singularStr
  # num = 2..INFINITY && singularStr ends with s -> returns "#{singularStr}es"
  # num = 2..INFINITY && singularStr does not end with s -> returns "#{singularStr}s"

  # num = 0 && singularStr ends with s -> returns "#{singularStr}es"
  # 0 classes should return "classes"
  def test_pluralize_zero_ends_s
    assert_equal "classes", @d.pluralize("class", 0)
  end

  # num = 0 && singularStr does not end with s -> returns "#{singularStr}s"
  # 0 books should return "books"
  def test_pluralize_zero_not_ends_s
    assert_equal "books", @d.pluralize("book", 0)
  end

  # num = 1 -> returns singularStr
  # 1 book should return "book"
  def test_pluralize_one
    assert_equal "book", @d.pluralize("book", 1)
  end

  # num = 2..INFINITY && singularStr ends with s -> returns "#{singularStr}es"
  # 2 classes should return "classes"
  def test_pluralize_two_ends_s
    assert_equal "classes", @d.pluralize("class", 2)
  end

  # num = 2..INFINITY && singularStr does not end with s -> returns "#{singularStr}s"
  # 2 books should return "books"
  def test_pluralize_two_not_ends_s
    assert_equal "books", @d.pluralize("book", 2)
  end

  # UNIT TESTS FOR METHOD print_results
  # There are no parameters, it does not make sense to partition it.
  # This test ensures the proper output with arbitrary values assigned to books, dinos, & classes.
  def test_print_results
    @d.add_book
    @d.add_book
    @d.add_book
    @d.add_book
    @d.add_dino
    @d.add_dino
    @d.add_dino
    @d.add_class
    @d.add_class
    assert_output("Driver 1 obtained 4 books!\nDriver 1 obtained 3 dinosaur toys!\nDriver 1 attended 4 classes!\n") { @d.print_results }
  end

  # UNIT TESTS FOR METHOD current_location=(location_name)
  # Equivalence classes:
  # location_name = "Hillman" -> calls add_book
  # location_name = "Museum" -> calls add_dino
  # location_name = "Cathedral" -> calls add_class

  # If "Hillman" is given for location_name, then expect add_book to be called
  # def test_add_resource_hillman
  #   driver = Minitest::Mock.new("Driver")
  #   driver.expect :add_book, nil
  #   @c.current_location = "Hillman"
  #   assert_mock driver
  # end
  #
  # # If "Museum" is given for location_name, then expect add_dino to be called
  # def test_add_resource_museum
  #   driver = Minitest::Mock.new("Driver")
  #   driver.expect :add_dino, nil
  #   @c.current_location = "Museum"
  #   assert_mock driver
  # end
  #
  # # If "Cathedral" is given for location_name, then expect add_class to be called
  # def test_add_resource_cathedral
  #   driver = Minitest::Mock.new("Driver")
  #   driver.expect :add_class, nil
  #   @c.current_location = "Cathedral"
  #   assert_mock driver
  # end

end
