require 'json'

module WriteToFile
  # write books record to JSON file
  def write_book(books)
    file = File.open('./data/book.json', 'w+')

    book_hash = {}
    books.each_with_index do |book, index|
      book_hash[(index + 1).to_s] = { 'title' => book.title, 'author' => book.author }
    end
    file.write(JSON.pretty_generate(book_hash))
    file.close
  end

  # write persons record to JSON file
  def write_person(persons)
    file = File.open('./data/person.json', 'w+')

    person_hash = {}
    person_hash['students'] = {}
    person_hash['teachers'] = {}

    persons.each_with_index do |person, index|
      if person.instance_of?(Student)
        person_hash['students'][(index + 1).to_s] = {
          'id' => person.id, 'name' => person.name, 'age' => person.age,
          'parent_permission' => person.parent_permission, 'classroom' => person.classroom
        }
      elsif person.instance_of?(Teacher)
        person_hash['teachers'][(index + 1).to_s] = {
          'id' => person.id, 'name' => person.name, 'age' => person.age,
          'parent_permission' => person.parent_permission, 'specialization' => person.specialization
        }
      end
    end

    file.write(JSON.pretty_generate(person_hash))
    file.close
  end

  # write rentals record to JSON file
  def write_rental(rentals)
    file = File.open('./data/rental.json', 'w+')

    rental_hash = {}
    rentals.each_with_index do |rental, index|
      rental_hash[(index + 1).to_s] = {
        'date' => rental.date,
        'book' => { 'title' => rental.book.title, 'author' => rental.book.author },
        'person' => { 'id' => rental.person.id, 'name' => rental.person.name, 'age' => rental.person.age }
      }
      if rental.person.instance_of?(Student)
        rental_hash[(index + 1).to_s]['person']['classroom'] =
          rental.person.classroom
      end
      if rental.person.instance_of?(Teacher)
        rental_hash[(index + 1).to_s]['person']['specialization'] =
          rental.person.specialization
      end
    end

    file.write(JSON.pretty_generate(rental_hash))
    file.close
  end
end
