class Person
  attr_accessor :name, :age, :national_id

  def initialize(name = nil, age = nil, national_id = nil)
    @name = name
    @age = age
    @national_id = national_id
  end

  @@records = []

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
    @@records.find do |person|
      if person == self
        person.name = self.name
        person.age = self.age
      end
    end
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
      return @@records.find { |person| person.name.downcase == query.downcase }
    else
      return @@records.find { |person| person.national_id == query }
    end
  end

  def self.show(query)
    if query
      @@records[0..query].each do |record|
        record.display
      end
    else
      self.all
    end
  end
end