require_relative '../book'
require_relative '../teacher'
require_relative '../student'
require_relative '../rental'

module ReadFromFile
    #read book from file
    def read_book(books)
        file = File.open('./data/book.json', 'r') if File.exist?('./data/book.json')
        return false if file.nil?
    
        return unless file.size.positive?
    
        books_record = JSON.parse(file.read)
        books_record.each do |_key, book|
          books << Book.new(book['title'], book['author'])
        end
      end

      # load persons record from file
  def read_person(persons)
    file = File.open('./data/person.json', 'r') if File.exist?('./data/person.json')
    return false if file.nil?

    return unless file.size.positive?

    person_record = JSON.parse(file.read)
    person_record['students'].each do |_key, person|
      persons << Student.new(person['classroom'], person['age'], person['name'],
                             parent_permission: person['parent_permission'])
    end
    person_record['teachers'].each do |_key, person|
      persons << Teacher.new(person['specialization'], person['age'], person['name'],
                             parent_permission: person['parent_permission'])
    end
  end

  # load rentals record from file
  def read_rental(rentals, books, persons)
    file = File.open('./data/rental.json', 'r') if File.exist?('./data/rental.json')
    return false if file.nil?

    return unless file.size.positive?

    rentals_record = JSON.parse(file.read)
    rentals_record.each do |_key, rental|
      book = books.find { |b| b.title == rental['book']['title'] }
      person = persons.find { |p| p.name == rental['person']['name'] }
      rentals << Rental.new(rental['date'], book, person)
    end
  end
end
