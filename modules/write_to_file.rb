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
end
