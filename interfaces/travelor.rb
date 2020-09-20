require './user.rb'

class Travelor
  include User

  def plans 
    [
      {id: 1, name: "Plan 1"},
      {id: 2, name: "Plan 2"}
    ]
  end

  def info
    {
      name: "User name",
      age: 60
    }
  end
end

travelor = Travelor.new
puts travelor.plans
puts travelor.salary

