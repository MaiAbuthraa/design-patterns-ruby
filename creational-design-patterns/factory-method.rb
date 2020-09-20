# Factory method is a creational design pattern which solves the problem of creating
# product objects without specifying their concrete classes.

# When : You should use the Factory Method pattern when you have a class that can’t anticipate 
# the class of objects it must create

class Creator
  # give any name, this name for explain
  def factory_method
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end


  def call
    # factory_method expected to return obj enstance
    product = factory_method
    
    # do your oprations 

    product
  end
end

class A < Creator
  # we need to override factory_method 
  def factory_method
    ProductA.new
  end
end

class B < Creator
  # we need to override factory_method 
  def factory_method
    ProductB.new
  end
end

class Product
  def operation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ProductA < Product
  def operation
  end
end

class ProductB < Product
  def operation
  end
end
