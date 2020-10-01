# Intro : Builder is a creational design pattern that lets you construct complex objects step by step.
# The pattern allows you to produce different types and representations of
# an object using the same construction code

# The HardwareBuilder interface 
# declares product construction steps that are common to all types of builders.

class ComputerBuilder
  def build_case
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def build_screen
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def build_keyboard
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# provide different implementations of the construction steps. Concrete builders
# may produce products that don’t follow the common interface.

class Apple < ComputerBuilder
  def initialize
    @computer = AppleComputer.new
  end

  def build_case
    @computer.build('case')
  end

  def build_screen
    @computer.build('screen')
  end

  def build_keyboard
    @computer.build('keyboard')
  end

  def result
    @computer.all
  end
end

# AppleComputer:are resulting objects. Products constructed by different 
# builders don’t have to belong to the same class
class AppleComputer 
  def initialize
    @parts = []
  end

  def build(part)
    @parts << part
  end

  def all
    @parts
  end
end

# another ComputerBuilder -> ASUS
class Asus < ComputerBuilder
  def initialize
    @computer = AsusComputer.new
  end

  def build_case
    @computer.add('case')
  end

  def build_screen
    @computer.add('screen')
  end

  def build_keyboard
    @computer.add('keyboard')
  end

  def result
    @computer.get_all
  end
end

class AsusComputer 
  def initialize
    @parts = []
  end

  def add(part)
    @parts << part
  end

  def get_all
    @parts
  end
end

# The Director class defines the order in which to call construction steps, 
# so you can create and reuse specific configurations of products.

class Director
  attr_accessor :builder
  
  def initialize
    @builder = nil
  end

  # The Director works with any builder instance that the client code passes to
  # it. This way, the client code may alter the final type of the newly
  # assembled product.
  def builder=(builder)
    @builder = builder
  end

  # The Director can construct several product variations using the same
  # building steps.
  
  def build_computer
    @builder.build_case
    @builder.build_screen
    @builder.build_keyboard
  end

  def build_tablet
    @builder.build_case
    @builder.build_screen
  end
end

# The client code creates a builder object, passes it to the director and then
# initiates the construction process. The end result is retrieved from the
# builder object.

director = Director.new

puts "<<<Apple>>>"

mac_pro = Apple.new
director.builder = mac_pro
puts "Build MacPro"
director.build_computer
puts ">> Parts: #{mac_pro.result.join(", ") }"

ipad = Apple.new
director.builder = ipad
puts "Build Ipad"
director.build_tablet
puts ">> Parts: #{ipad.result.join(", ") }"

puts "<<<Asus>>>"

zen_book = Asus.new
director.builder = zen_book
puts "Build ZenBook"
director.build_computer
puts ">> Parts: #{zen_book.result.join(", ") }"

asus_tablet = Asus.new
director.builder = asus_tablet
puts "Build Tablet"
director.build_tablet
puts ">> Parts: #{asus_tablet.result.join(", ") }"
