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
end