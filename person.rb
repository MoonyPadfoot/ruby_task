class Person
  attr_accessor :name, :age, :national_id

  def initialize(name = nil, age = nil, national_id = nil)
    @name = name
    @age = age
    @national_id = national_id
  end

  @@records = [
    Person.new('Ren', 26, 1),
    Person.new('Rose', 27, 3),
    Person.new('Chase', 27, 4),
    Person.new('Precious', 23, 5),
    Person.new('Lyra', 26, 6),
    Person.new('Lloyd', 23, 7),
    Person.new('Jerome', 25, 8),
    Person.new('Jaarl', 22, 9),
    Person.new('Bernard', 29, 10),
    Person.new('Rex', 24, 11),
    Person.new('Mark', 29, 12),
    Person.new('Jati', 24, 13),
    Person.new('Carl', 33, 14),
    Person.new('John', 54, 15),
    Person.new('James', 60, 16),
    Person.new('Jack', 89, 17),
    Person.new('Rylle', 26, 18),
    Person.new('Mary', 25, 19),
    Person.new('Lincoln', 200, 20),
  ]

  def self.all
    @@records.each do |record|
      record.display
    end
  end

  def self.first
    @@records.first
  end

  def self.last
    @@records.last
  end

  def display
    puts "Name: #{self.name}"
    puts "Age: #{self.age}"
    puts "National ID: #{self.national_id}"
    puts "==============="
  end

  def self.find_by_national_id(national_id)
    @@records.find { |person| person.national_id == national_id }
  end

  def save
    @@records.prepend(self)
  end

  def update
    @@records.each { |person| person == self }
  end

  def destroy
    @@records.delete(self)
  end

  def self.destroy_all
    @@records.clear
  end

  def self.count
    @@records.size
  end

  def self.search(query)
    if query.instance_of? String
      person = @@records.find { |person| person.name.downcase == query.downcase }
    else
      person = @@records.find { |person| person.national_id == query }
    end
    person || "User not found.\n"
  end

  def self.show(query)
    query ? @@records[0..query] : @@records
  end
end


