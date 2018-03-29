# Driver class
class Driver
  attr_accessor :name, :books, :dinos, :classes

  def initialize(name)
    @name = name
    @books = 0
    @dinos = 0
    @classes = 1
  end

  def add_book
    @books += 1
  end

  def add_dino
    @dinos += 1
  end

  def add_class
    @classes *= 2
  end

  def print_results
    puts "#{name} obtained #{@books} #{pluralize('book', @books)}!"
    puts "#{name} obtained #{@dinos} #{pluralize('dinosaur toy', @dinos)}!"
    puts "#{name} attended #{@classes} #{pluralize('class', @classes)}!"
  end

  # The pluralize helper method takes in a singular string and
  #   adds the appropriate ending to make it plural
  def pluralize(singular_str, num)
    return singular_str if num == 1
    # singular_str[-1] returns last character of string
    return "#{singular_str}es" if singular_str[-1] == 's'
    "#{singular_str}s"
  end
end
