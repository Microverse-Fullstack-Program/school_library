require_relative './Nameable'
require_relative './CapitalizeDecorator'
require_relative './TrimmerDecorator'

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

capitalizedPerson = CapitalizeDecorator.new(person)
puts capitalizedPerson.correct_name

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts capitalizedTrimmedPerson.correct_name