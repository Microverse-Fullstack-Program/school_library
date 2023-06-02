require_relative 'app'
require_relative './modules/write_to_file'
require_relative './modules/read_from_file'

class CallAction
  include ReadFromFile
  include WriteToFile

  def initialize
    @app = App.new
  end

  def call_action(choice)
    case choice
    when 1
      @app.list_books(@app.books)
    when 2
      @app.list_people(@app.persons)
    when 3
      add_people # add student or teacher
    when 4
      @app.create_book(@app.books)
    when 5
      @app.create_rental(@app.rentals)
    when 6
      print 'ID of the person: '
      id = gets.chomp.to_i
      @app.list_rental(id)
    else
      puts 'Invalid option, try again!'
    end
  end

  def add_people
    puts 'Do you want to create a student (1) or a teacher(2)? [Input the number]'
    choose = gets.chomp.to_i
    case choose
    when 1
      @app.create_person(@app.persons, 'student')
    when 2
      @app.create_person(@app.persons, 'teacher')
    else
      puts 'Invalid option, try again!'
    end
  end

  def load_data
    read_book(@app.books)
    read_person(@app.persons)
    read_rental(@app.rentals, @app.books, @app.persons)
  end

  def preserve_data
    write_book(@app.books)
    write_person(@app.persons)
    write_rental(@app.rentals)
  end
end
