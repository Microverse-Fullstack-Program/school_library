require_relative './app'

def welcome
  puts 'Welcome to School Library App!'
end

def main(initial = 1)
  welcome if initial
  puts "\n"
  puts 'Please choose an option by entering a number: '
  menu = ['1 - List all books',
          '2 - List all people',
          '3 - Create a person',
          '4 - Create a book',
          '5 - Create a rental',
          '6 - List all rentals for a given person id',
          '7 - Exit']
  puts menu
  choice = gets.chomp.to_i
  option(choice)
end

def option(selected)
  app = App.new

  case selected
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    puts 'Do you want to create a student (1) or a teacher(2)? [Input the number]'
    choose = gets.chomp.to_i
    case choose
    when 1
      app.create_student
    when 2
      app.create_teacher
    else
      puts 'Invalid option, try again!'
      main(false)
    end
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    print 'ID of the person: '
    id = gets.chomp.to_i
    app.list_rental(id)
  when 7
    puts 'Thank You for using this app!'
    exit 0
  else
    puts 'Invalid option, try again!'
    main(false)
  end
end

main
