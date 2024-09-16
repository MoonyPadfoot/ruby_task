module QueryHelper
  def show_people_list(people, query)
    query ? people[0..query] : people
  end

  def search_user(people, query)
    person = people.find { |person| (person[query.class == String ? :name : :national_id]).downcase == query.downcase }
    person || "User not found.\n"
  end
end