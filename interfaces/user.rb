# The simplest way to emulate interfaces in Ruby is to declare a module with 
# methods that raise a “not implemented” exception
module User
  def plans
    raise "Not implemented"
  end

  def info
    raise "Not implemented"
  end

  def salary
    raise "Not implemented"
  end
end

