# is a creational design pattern, which ensures that only one object of its 
# kind exists and provides a single point of access to it for any other code.

class Singleton
  @instance = new

  #Makes existing class methods private. Often used to hide the default constructor new.
  private_class_method :new

  # The static method that controls the access to the singleton instance.
  #
  # This implementation let you subclass the Singleton class while keeping just
  # one instance of each subclass around.
  def self.instance
    @instance
  end

  # Finally, any singleton should define some business logic, which can be
  # executed on its instance.
  def some_logic
    puts "Some Login"
  end
end

# The client code.

s1 = Singleton.instance
s2 = Singleton.instance

if s1.equal?(s2)
  print 'Singleton works, both variables contain the same instance.'
else
  print 'Singleton failed, variables contain different instances.'
end
