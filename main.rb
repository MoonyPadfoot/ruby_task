people = [
  { name: 'Ren', age: 26, national_id: 1 },
  { name: 'Josh', age: 19, national_id: 2 },
  { name: 'Rose', age: 27, national_id: 3 },
  { name: 'Chase', age: 27, national_id: 4 },
  { name: 'Precious', age: 23, national_id: 5 },
  { name: 'Lyra', age: 26, national_id: 6 },
  { name: 'Lloyd', age: 23, national_id: 7 },
  { name: 'Jerome', age: 25, national_id: 8 },
  { name: 'Jaarl', age: 22, national_id: 9 },
  { name: 'Bernard', age: 29, national_id: 10 },
  { name: 'Rex', age: 24, national_id: 11 },
  { name: 'Mark', age: 29, national_id: 12 },
  { name: 'Jati', age: 24, national_id: 13 },
  { name: 'Carl', age: 33, national_id: 14 },
  { name: 'John', age: 54, national_id: 15 },
  { name: 'James', age: 60, national_id: 16 },
  { name: 'Jack', age: 89, national_id: 17 },
  { name: 'Rylle', age: 26, national_id: 18 },
  { name: 'Mary', age: 25, national_id: 19 },
  { name: 'Lincoln', age: 200, national_id: 20 },
]

def show_people_list(people)
  people.each do |person|
    p person
  end
end

show_people_list(people)

# Add New User
p "Enter name:"
name = gets.chomp
p "Enter age:"
age = gets.to_i
p "Enter national id"
national_id = gets.to_i
is_duplicate = false

people.each do |val|
  if val[:national_id].equal? national_id
    p "Failed to add: National ID already exists."
    is_duplicate = true
  end
end

unless is_duplicate
  people.push({ name: name, age: age, national_id: national_id })
  p "User added successfully!"
end

show_people_list(people)


