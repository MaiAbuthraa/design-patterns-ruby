# Abstract Factory is a creational design pattern, 
# which solves the problem of creating entire product families 
# without specifying their concrete classes.

# Abstract Factory defines an interface for creating all
# distinct products but leaves the actual product creation 
# to concrete factory classes. Each factory type corresponds to a certain product variety.

class AbstractFactory
  def name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def laptop
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def tablet
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Laptop
  def feature
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def keyboard
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Tablet
  def feature
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete Factories produce a family of products that belong to a single
# variant. The factory guarantees that resulting products are compatible.
#
# out example Apple & Ause

class Apple < AbstractFactory
  def name
    "Apple"
  end

  def laptop
    MacPro.new
  end

  def tablet
    Ipad.new
  end
end

# Each distinct product of a product family should have a base interface. All
# variants of the product must implement this interface (check Laptop and Ipad).
class MacPro < Laptop
  def feature
    "- Mac-Pro features"
  end

  def keyboard
    "- Mac-Pro has a keyboard"
  end
end

class Ipad < Tablet
  def feature
    "- Ipad features"
  end
end

class Asus < AbstractFactory
  def name
    "Asus"
  end

  def laptop
    ZenBook.new
  end

  def tablet
    ZenPad.new
  end
end

class ZenBook < Laptop
  def feature
    "- ZenBook features"
  end

  def keyboard
    "- ZenBook has a keyboard"
  end
end

class ZenPad < Tablet
  def feature
    "- ZenPad features"
  end
end

# The client code works with factories and products only through abstract types:
# AbstractFactory and AbstractProduct. This lets you pass any factory or product
# subclass to the client code without breaking it

def client_requset(factory)
  puts "#{factory.name} Laptop" 
  laptop = factory.laptop
  
  puts laptop.feature
  puts laptop.keyboard

  puts "#{factory.name} Tablet" 
  tablet = factory.tablet

  puts tablet.feature
end

client_requset(Apple.new)
puts "..........."
client_requset(Asus.new)
