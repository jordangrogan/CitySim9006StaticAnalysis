require_relative 'location'

# Driver class
class Driver
  attr_reader :name, :resources

  def initialize(name)
    @name = name
    @resources = { 'books' => 0, 'dinos' => 0, 'classes' => 1 }
    @current_location = ''
  end

  def current_location=(location_name)
    @current_location = location_name
    add_book if @current_location == 'Hillman'
    add_dino if @current_location == 'Museum'
    add_class if @current_location == 'Cathedral'
  end

  def add_book
    @resources['books'] += 1
  end

  def add_dino
    @resources['dinos'] += 1
  end

  def add_class
    @resources['classes'] *= 2
  end

  def print_results
    print_books
    print_dinos
    print_classes
  end

  def print_books
    books = @resources['books']
    puts "#{@name} obtained #{books} #{pluralize('book', books)}!"
  end

  def print_dinos
    dinos = @resources['dinos']
    puts "#{@name} obtained #{dinos} #{pluralize('dinosaur toy', dinos)}!"
  end

  def print_classes
    classes = @resources['classes']
    puts "#{@name} attended #{classes} #{pluralize('class', classes)}!"
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
