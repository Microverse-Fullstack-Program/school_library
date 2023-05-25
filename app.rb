require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'

$books = []
$teachers = []
$students = []
$rentals = []

def list_books
    $books.each do |book| puts "Title: \"#{book.title}\", Author: #{book.author}" end
    main(false)
end

def list_people
    $students.each do |student| puts "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}" end
    $teachers.each do |teacher| puts "[Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}"  end
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

def create_rental
    puts 'Select a book from the following list by number'
    $books.each_with_index do |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" end
    book = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    $students.each_with_index do |student, index| puts "#{index}) [Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}" end
    $teachers.each_with_index do |teacher, index| puts "#{index + $students.length}) [Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}" end
    person = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    $rentals << Rental.new(date, $books[book], $students[person] || $teachers[person - $students.length])
    puts 'Rental created successfully:'
    main(false)
end

def list_rental(id)
    puts 'Rentals:'
    $rentals.each do |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id end
    main(false)
end
