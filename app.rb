require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'

class App
  attr_accessor :books, :students, :teachers, :rentals

  def initialize()
    @books = []
    @students = []
    @teachers = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'There are no books!'
    else
      puts 'List of books:'
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  def list_people
    if @students.empty? && @teachers.empty?
      puts 'There are no people!'
    else
      puts 'List of people:'
      @students.each { |student| puts "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}" }
      @teachers.each { |teacher| puts "[Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}" }
    end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @teachers << Teacher.new(specialization, age, name)
    puts 'Person created successfully: '
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    permission = gets.chomp
    permission = permission == 'Y'
    @students << Student.new('', age, name, parent_permission: permission)
    puts 'Person created successfully: '
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully: '
  end

  def create_rental
    if @books.empty? || (@students.empty? && @teachers.empty?)
      puts 'Cannot create Rental. There are no books or people!'
    else
      book = select_book
      person = select_person

      print 'Date [YYYY/MM/DD]: '
      date = gets.chomp
      rentals << Rental.new(date, @books[book], @students[person] || @teachers[person - @students.length])
      puts 'Rental created successfully:'
    end
  end

  def select_book
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    gets.chomp.to_i
  end

  def select_person
    puts 'Select a person from the following list by number (not id)'
    @students.each_with_index do |student, index|
      puts "#{index}) [Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}"
    end
    @teachers.each_with_index do |teacher, index|
      puts "#{index + @students.length}) [Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}"
    end
    gets.chomp.to_i
  end

  def list_rental(id)
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
