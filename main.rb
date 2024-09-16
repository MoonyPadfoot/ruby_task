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
  if query != nil
    puts people[0..query]
  else
    puts people
  end
end

# Search Helper method

def search_user(people, query)
  if query.class == String
    if people.any? { |person| person[:name].downcase == query}
      p people.select {|person| person[:name].downcase == query }
    else
      p "User not found"
    end
  elsif query.class == Integer
    if people.any? { |person| person[:national_id] == query}
      p people.select {|person| person[:national_id] == query }
    else
      p "User not found"
    end
  end
end

show_people_list(people, 5)

# Add New User

show_people_list(people)
while true
  is_duplicate = false

  # Add or Delete User

  puts "Choose an option below:\n"
  puts "(1) Add User\n(2) Delete User\n(3) Edit User\n(4) Search User"
  option = gets.chomp

  if option == 'exit'
    puts "Are you sure you want to exit (y/n)?"
    confirm = gets.chomp

    if confirm.downcase == 'y'
      break
    end
  end

  option = option.to_i

  if !(option.equal? 1) && !(option.equal? 2) && !(option.equal? 3) && !(option.equal? 4)
    p 'Invalid option'
  end

  if option.equal? 1
    p "Enter name:"
    name = gets.chomp

    if name == 'exit'
      puts "Are you sure you want to exit (y/n)?"
      confirm = gets.chomp

      if confirm.downcase == 'y'
        break
      end
    end

    p "Enter age:"
    age = gets.chomp

    if age == 'exit'
      puts "Are you sure you want to exit (y/n)?"
      confirm = gets.chomp

      if confirm.downcase == 'y'
        break
      end
    end
    age = age.to_i

    p "Enter national id"
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
        p "Failed to add: National ID already exists."
        is_duplicate = true
      end
    end

    if !is_duplicate
      people.unshift({ name: name, age: age, national_id: national_id })
      p "User added successfully!"
    end

  elsif option.equal? 2
    p "Enter national id"
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

  elsif  option.equal? 3
    p "Enter national id"
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

      p target
    else
      puts "No User found."
    end
  elsif option == 4
    puts "Choose an option below:\n"
    puts "(1) Search By Name\n(2) Search By National ID"
    search_option = gets.to_i

    if search_option == 1
      puts "Enter username:"
      name = gets.chomp
      search_user(people, name)
    elsif search_option == 2
      puts "Enter national id:"
      national_id = gets.to_i
      search_user(people, national_id)
    end
  end

end




