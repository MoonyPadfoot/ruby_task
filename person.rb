class Person
  attr_accessor :name, :age, :national_id
  def initialize(name = nil, age = nil, national_id = nil)
    @name = name
    @age = age
    @national_id = national_id
  end

end