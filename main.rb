require_relative './call_action'

class Main
  def initialize
    @choice_action = CallAction.new
  end

  def main()
    puts 'Welcome to School Library App!'

    loop do
      puts "\n"
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
      choice = gets.chomp.to_i
      if choice == 7
        puts 'Thank You for using this app!'
        exit 0
      end
      @choice_action.call_action(choice)
    end
  end
end

main_app = Main.new
main_app.main
