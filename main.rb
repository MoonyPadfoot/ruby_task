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
# system('clear')

# Helper function

def show_people_list(people, query = nil)
  return people[0..query] if query
  people
end

# Search Helper method

def search_user(people, query)
  person = people.find {|person| (person[query.class == String ? :username : :national_id]) == query }

  unless person
    return "User not found.\n"
  end
  person
end

puts show_people_list(people, 5)

option = 0
# Add New User
while option != 'exit'
  is_duplicate = false

  # Add or Delete User

  puts "Choose an option below:\n"
  puts "(1) Add User\n(2) Delete User\n(3) Edit User\n(4) Search User"
  option = gets.chomp

  if option == 'exit'
    puts "Are you sure you want to exit (y/n)?"
    confirm = gets.chomp

    break if confirm.downcase == 'y'
  end

  option = option.to_i

  if option == 1
    puts "Enter name:"
    name = gets.chomp

    if name == 'exit'
      puts "Are you sure you want to exit (y/n)?"
      confirm = gets.chomp

      if confirm.downcase == 'y'
        break
      end
    end

    puts "Enter age:"
    age = gets.chomp

    if age == 'exit'
      puts "Are you sure you want to exit (y/n)?"
      confirm = gets.chomp

      if confirm.downcase == 'y'
        break
      end
    end
    age = age.to_i

    puts "Enter national id"
    national_id = gets.chomp

    if national_id == 'exit'
      puts "Are you sure you want to exit (y/n)?"
      confirm = gets.chomp

      if confirm.downcase == 'y'
        break
      end
    end
    national_id = national_id.to_i

    people.each do |person|
      if person[:national_id].equal? national_id
        puts "Failed to add: National ID already exists."
        is_duplicate = true
      end
    end

    if !is_duplicate
      people.unshift({ name: name, age: age, national_id: national_id })
      puts "User added successfully!"
    end

  elsif option == 2
    puts "Enter national id"
    national_id = gets.chomp
    if national_id == 'exit'
      puts "Are you sure you want to exit (y/n)?"
      confirm = gets.chomp

      if confirm.downcase == 'y'
        break
      end
    end
    national_id = national_id.to_i

    if people.any? { |person| person[:national_id] == national_id }
      people.each do |person|
        people.delete(person) if person[:national_id].equal? national_id
      end

      puts "Successfully deleted."
    else
      puts "User not found."
    end

  elsif option == 3
    puts "Enter national id"
    national_id = gets.chomp
    if national_id == 'exit'
      puts "Are you sure you want to exit (y/n)?"
      confirm = gets.chomp

      if confirm.downcase == 'y'
        break
      end
    end

    national_id = national_id.to_i
    if people.any? { |person| person[:national_id] == national_id }
      target = people.select {|person| person[:national_id] == national_id }
      puts "Enter name:"
      name = gets.chomp
      if name == 'exit'
        puts "Are you sure you want to exit (y/n)?"
        confirm = gets.chomp

        if confirm.downcase == 'y'
          break
        end
      end

      target.first[:name] = name

      puts "Enter age:"
      age = gets.chomp
      if age == 'exit'
        puts "Are you sure you want to exit (y/n)?"
        confirm = gets.chomp

        if confirm.downcase == 'y'
          break
        end
      end
      age = gets.to_i
      target.first[:age] = age

      puts target
    else
      puts "No User found."
    end
  elsif option == 4
    puts "Choose an option below:\n"
    puts "(1) Search By Name\n(2) Search By National ID"
    search_option = gets.to_i

    if search_option == 1
      puts "Enter username:"
      name = gets.chomp.downcase
      puts search_user(people, name)
    elsif search_option == 2
      puts "Enter national id:"
      national_id = gets.to_i
      puts search_user(people, national_id)
    end
  else
    puts "Invalid option.\n"
  end

end




