module ListBook
  def list_books(books)
    if books.empty?
      puts 'There are no books!'
    else
      puts 'List of books:'
      books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end
end
