require_relative './modules/create_book'
require_relative './modules/list_book'
require_relative './modules/create_person'
require_relative './modules/list_people'
require_relative './modules/create_rental'
require_relative './modules/list_rental'

class App
  include CreateBook
  include ListBook

  include CreatePerson
  include ListPeople

  include CreateRental
  include ListRental

  attr_accessor :books, :persons, :rentals

  def initialize()
    @books = []
    @persons = []
    @rentals = []
  end
end
