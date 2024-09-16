require "./query_helper.rb"
require "./person.rb"
include QueryHelper

people = [
  { name: 'Ren', age: 26, national_id: 1 },
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
# system('clear')
puts show_people_list(people, 5)

def add_person(people)
  puts "Enter name:"
  name = gets.chomp

  puts "Enter age:"
  age = gets.to_i

  puts "Enter national id"
  national_id = gets.to_i

  if people.find { |person| person[:national_id] == national_id }
    puts "Failed to add: National ID already exists."
  else
    people.unshift({ name: name, age: age, national_id: national_id })
    puts "User added successfully!"
    puts show_people_list(people, 5)
  end
end

def delete_person(people)
  puts "Enter national id"
  national_id = gets.to_i

  person = people.find { |person| person[:national_id] == national_id }
  if person
    people.delete(person) if person[:national_id].equal? national_id
    puts "Successfully deleted."
    puts show_people_list(people, 5)
  else
    puts "User not found."
  end
end

confirm = nil

while confirm != 'y'
  puts "Choose an option below:\n"
  puts "(1) Add User\n(2) Delete User\n(3) Edit User\n(4) Search User"
  option = gets.chomp

  # Add
  if option.to_i == 1
    add_person(people)

    # Delete
  elsif option.to_i == 2
    delete_person(people)

    # Edit
  elsif option.to_i == 3
    puts "Enter national id"
    national_id = gets.to_i

    person = people.find { |person| person[:national_id] == national_id }
    if person
      puts "Enter name:"
      name = gets.chomp
      person[:name] = name

      puts "Enter age:"
      age = gets.to_i
      person[:age] = age

      puts show_people_list(people, 5)
    else
      puts "No User found."
    end

    # Search
  elsif option.to_i == 4
    puts "Choose an option below:\n"
    puts "(1) Search By Name\n(2) Search By National ID"
    search_option = gets.to_i

    if search_option == 1
      puts "Enter name:"
      name = gets.chomp
      puts search_user(people, name)

    elsif search_option == 2
      puts "Enter national id:"
      national_id = gets.to_i
      puts search_user(people, national_id)

    end

    # Exit
  elsif option == 'exit'
    puts "Are you sure you want to exit (y/n)?"
    confirm = gets.chomp

    break if confirm.downcase == 'y'
    next
  else
    puts "Invalid option.\n"

  end
end




