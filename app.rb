require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'

$books = []
$teachers = []
$students = []
 

def list_books
    $books.each do |book| puts "Title: \"#{book.title}\", Author: #{book.author}" end
    main(false)
end
 
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

def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    permission = gets.chomp
    permission = permission == 'Y' ? true : false
    $students << Student.new(nil, age, name, permission)
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

