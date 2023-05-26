require_relative './app'

class Main
  def initialize
    @app = App.new
  end

  def main()
    puts 'Welcome to School Library App!'

    loop do
      puts "\n"
      menu # print menu
      choice = gets.chomp.to_i

      case choice
      when 1...7 # if choice is between 1 and 6
        perform_action(choice)
      when 7
        puts 'Thank You for using this app!'
        exit 0
      else
        puts 'Invalid option, try again!'
      end
    end
  end

  def menu
    options = [
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]
    puts options
  end

  def perform_action(choice)
    case choice
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      add_people # add student or teacher
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      print 'ID of the person: '
      id = gets.chomp.to_i
      @app.list_rental(id)
    end
  end

  def add_people
    puts 'Do you want to create a student (1) or a teacher(2)? [Input the number]'
    choose = gets.chomp.to_i
    case choose
    when 1
      @app.create_student
    when 2
      @app.create_teacher
    else
      puts 'Invalid option, try again!'
    end
  end
end

main_app = Main.new
main_app.main
