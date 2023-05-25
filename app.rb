require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'

$books = []
$teachers = []
$students = []

def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    $teachers << Teacher.new(specialization, age, name)
    puts 'Person created successfully: '
    main(false)
end

def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    $books << Book.new(title, author)
    puts 'Book created successfully: '
    main(false)
end
