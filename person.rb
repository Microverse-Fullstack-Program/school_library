require_relative './nameable'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age # getter & setter method
  attr_reader :id # getter method

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # private method
  def of_age?
    return true if @age >= 18

    false
  end
  private :of_age?

  # public method
  def can_use_services?
    return true if of_age || @parent_permission
  end

  def correct_name
    @name
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalizedperson = CapitalizeDecorator.new(person)
puts capitalizedperson.correct_name

capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedperson)
puts capitalizedtrimmedperson.correct_name
