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
    puts "#{name} obtained #{@books} #{pluralize("book", @books)}!"
    puts "#{name} obtained #{@dinos} #{pluralize("dinosaur toy", @dinos)}!"
    puts "#{name} attended #{@classes} #{pluralize("class", @classes)}!"
  end

  # The pluralize helper method takes in a singular string and
  #   adds the appropriate ending to make it plural
  def pluralize(singularStr, num)
    if num == 1
      return singularStr
    else
      if singularStr[-1] == "s" # singularStr[-1] returns last character of string
        return "#{singularStr}es"
      else
        return "#{singularStr}s"
      end
    end
  end

end
