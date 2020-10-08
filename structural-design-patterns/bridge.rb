# The Abstraction defines the interface for the "control" part of the two class
# hierarchies. It maintains a reference to an object of the Implementation
# hierarchy and delegates all of the real work to this object.
class Abstraction
  def initialize(implementation)
    @implementation = implementation
  end

  def operation 
    @implementation.do_some_operation
  end
end

# You can extend the Abstraction without changing the Implementation classes.
class ExtendedAbstraction < Abstraction
  def operation 
    puts "Do extra Steps"

    @implementation.do_some_operation
  end
end

# The Implementation defines the interface for all implementation classes. It
# doesn't have to match the Abstraction's interface. In fact, the two interfaces
# can be entirely different. Typically the Implementation interface provides
# only primitive operations, while the Abstraction defines higher-level
# operations based on those primitives.
class Implementation
  def do_some_operation 
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Each Concrete Implementation corresponds to a specific platform and implements
# the Implementation interface using that platform's API.
class ExtendedImplementationA < Implementation 
  def do_some_operation 
    10 + 20 
  end
end

class ExtendedImplementationB < Implementation 
  def do_some_operation 
    20 - 10
  end
end

# Except for the initialization phase, where an Abstraction object gets linked
# with a specific Implementation object, the client code should only depend on
# the Abstraction class. This way the client code can support any abstraction-
# implementation combination.
def client_code(abstraction)
  puts abstraction.operation 
end

first_implementation =  ExtendedImplementationA.new
client_code(Abstraction.new(first_implementation))

second_implementation =  ExtendedImplementationB.new
client_code(ExtendedAbstraction.new(second_implementation))

# Abstraction (also called interface) is a high-level control layer for some entity. 
# This layer isn’t supposed to do any real work on its own. 
# It should delegate the work to the implementation layer (also called platform).
