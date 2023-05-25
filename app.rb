require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'

$books = []


def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    $books << Book.new(title, author)
    puts 'Book created successfully: '
    main(false)
end

