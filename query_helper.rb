module QueryHelper
  def show_people_list(people, query)
    query ? people[0..query] : people
  end

  def search_user(people, query)
    if query.class == String
      person = people.find { |person| person[:name].downcase == query.downcase }
    else
      person = people.find { |person| person[:national_id] == query }
    end
    person || "User not found.\n"
  end
end