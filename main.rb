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

people.each do |person|
  Person.new(person[:name], person[:age], person[:national_id]).save
end

Person.all

def add_person
  person = Person.new
  puts "Enter name:"
  person.name = gets.chomp
  clear_console

  puts "Enter age:"
  person.age = gets.to_i
  clear_console

  puts "Enter national id"
  person.national_id = gets.to_i
  clear_console

  if Person.find_by_national_id(person.national_id)
    puts "Failed to add: National ID already exists."
  else
    person.save
    puts "User added successfully!"
    Person.show(5)
  end
end

def delete_person
  puts "Enter national id"
  national_id = gets.to_i
  clear_console

  person = Person.find_by_national_id(national_id)
  if person
    person.destroy
    puts "Successfully deleted."
    Person.show(5)
  else
    puts "User not found."
  end
end

def edit_person
  puts "Enter national id"
  national_id = gets.to_i
  clear_console

  person = Person.find_by_national_id(national_id)
  if person
    puts "Enter name:"
    name = gets.chomp
    person.name = name

    puts "Enter age:"
    age = gets.to_i
    person.age = age

    person.update

    Person.show(5)
  else
    puts "No User found."
  end
end

def search_person
  puts "Choose an option below:\n"
  puts "(1) Search By Name\n(2) Search By National ID"
  search_option = gets.to_i
  clear_console

  if search_option == 1
    puts "Enter name:"
    name = gets.chomp
    clear_console
    Person.search(name)

  elsif search_option == 2
    puts "Enter national id:"
    national_id = gets.to_i
    clear_console
    Person.search(national_id)

  end
end

def exit_program
  puts "Are you sure you want to exit (y/n)?"
  confirm = gets.chomp
  clear_console

  confirm.downcase == 'y'
end

def clear_console
  system('clear')
end

confirm = nil

while confirm != 'y'
  puts "Choose an option below:\n"
  puts "(1) Add User\n(2) Delete User\n(3) Edit User\n(4) Search User"
  option = gets.chomp

  # Add
  if option.to_i == 1
    clear_console
    add_person

    # Delete
  elsif option.to_i == 2
    clear_console
    delete_person

    # Edit
  elsif option.to_i == 3
    clear_console
    edit_person

    # Search
  elsif option.to_i == 4
    clear_console
    search_person

    # Exit
  elsif option == 'exit'
    break if exit_program
    next

  else
    puts "Invalid option.\n"

  end
end




