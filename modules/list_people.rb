module ListPeople
  def list_people(persons)
    if persons.empty?
      puts 'There are no people!'
    else
      puts 'List of people:'
      persons.each do |person|
        print '[Student] Name: ' if person.is_a?(Student)
        print '[Teacher] Name: ' if person.is_a?(Teacher)
        puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end
end
