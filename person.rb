class Person
  attr_accessor :name, :age, :national_id

  @@data = [
    Person.new(name: 'Ren', age: 26, national_id: 1),
    Person.new(name: 'Rose', age: 27, national_id: 3),
    Person.new(name: 'Chase', age: 27, national_id: 4),
    Person.new(name: 'Precious', age: 23, national_id: 5),
    Person.new(name: 'Lyra', age: 26, national_id: 6),
    Person.new(name: 'Lloyd', age: 23, national_id: 7),
    Person.new(name: 'Jerome', age: 25, national_id: 8),
    Person.new(name: 'Jaarl', age: 22, national_id: 9),
    Person.new(name: 'Bernard', age: 29, national_id: 10),
    Person.new(name: 'Rex', age: 24, national_id: 11),
    Person.new(name: 'Mark', age: 29, national_id: 12),
    Person.new(name: 'Jati', age: 24, national_id: 13),
    Person.new(name: 'Carl', age: 33, national_id: 14),
    Person.new(name: 'John', age: 54, national_id: 15),
    Person.new(name: 'James', age: 60, national_id: 16 ),
    Person.new(name: 'Jack', age: 89, national_id: 17),
    Person.new(name: 'Rylle', age: 26, national_id: 18),
    Person.new(name: 'Mary', age: 25, national_id: 19),
    Person.new(name: 'Lincoln', age: 200, national_id: 20 ),
  ]
  def initialize(name = nil, age = nil, national_id = nil)
    @name = name
    @age = age
    @national_id = national_id
  end

  def self.show(count)
    count ? @@data[0..count] : @@data
  end

  def self.count
    @@data.size
  end

  def self.search(query)
    if query.instance_of? String
      person = @@data.find { |person| person.name.downcase == query.downcase }
    else
      person = @@data.find { |person| person.national_id == query }
    end
    person || "User not found.\n"
  end
end